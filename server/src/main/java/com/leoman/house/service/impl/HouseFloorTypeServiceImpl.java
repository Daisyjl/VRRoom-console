package com.leoman.house.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.*;
import com.leoman.house.entity.*;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseFloorTypeService;
import com.leoman.image.entity.Image;
import org.apache.commons.lang.StringUtils;
import org.apache.taglibs.standard.lang.jstl.IntegerDivideOperator;
import org.apache.taglibs.standard.tag.common.core.ForEachSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 楼盘楼层类型
 * Created by Daisy on 2016/10/17.
 */
@Service
public class HouseFloorTypeServiceImpl extends GenericManagerImpl<HouseFloorType,HouseFloorTypeDao> implements HouseFloorTypeService {

    @Autowired
    protected HouseFloorTypeDao houseFloorTypeDao;

    @Autowired
    protected HouseFloorTypeUnitDao houseFloorTypeUnitDao;

    @Autowired
    protected HouseRidgepoleFloorDao houseRidgepoleFloorDao;

    @Autowired
    protected HouseRidgepoleFloorRoomDao houseRidgepoleFloorRoomDao;

    @Override
    public List<HouseFloorType> findByHouseId(Long houseId) {
        return houseFloorTypeDao.findByHouseId(houseId);
    }

    /**
     * 保存楼层信息
     * @param list
     * @return
     */
    @Override
    @Transactional
    public Result saveFloor(List<Map> list){
        if(list != null){

            for (Map floorMap: list) {

                String houseId = (String)floorMap.get("houseId");
                String name = (String)floorMap.get("name");
                String floorTypeId = (String)floorMap.get("floorTypeId");
                List<Map> tranList = (List)floorMap.get("tranArr");

                //如果此楼层类型不存在，则新增
                HouseFloorType houseFloorType = floorTypeId==null?null:houseFloorTypeDao.findOne(Long.valueOf(floorTypeId));
                if(houseFloorType == null){
                    //保存楼层类型
                    houseFloorType = new HouseFloorType();
                    houseFloorType.setHouseId(Long.valueOf(houseId));
                    houseFloorType.setName(name);
                    houseFloorTypeDao.save(houseFloorType);
                }

                //保存楼层类型和户型的关系
                for (Map tranMap:tranList) {
                    String imageId = (String)tranMap.get("imageId");
                    String unitId = (String)tranMap.get("unitId");
                    String roomNo = (String)tranMap.get("roomNo");
                    String typeUnitId = (String)tranMap.get("typeUnitId");

                    if(imageId == null || unitId == null || roomNo == null){
                        new Result().failure(ErrorType.ERROR_CODE_00013);//该横切面信息不能为空
                    }

                    //如果该关系存在，则修改，不存在，则新增
                    HouseFloorTypeUnit houseFloorTypeUnit = StringUtils.isBlank(typeUnitId)?null:houseFloorTypeUnitDao.findOne(Long.valueOf(typeUnitId));
                    if(houseFloorTypeUnit == null){
                        houseFloorTypeUnit = new HouseFloorTypeUnit();
                    }
                    houseFloorTypeUnit.setFloorType(houseFloorType);
                    houseFloorTypeUnit.setTransverseImage(new Image(Integer.valueOf(imageId)));
                    houseFloorTypeUnit.setUnit(new HouseUnit(Long.valueOf(unitId)));
                    houseFloorTypeUnit.setRoomNo(Integer.valueOf(roomNo));
                    houseFloorTypeUnitDao.save(houseFloorTypeUnit);

                    //修改了户型关系后，重新生成房间
                    this.updateRoom(houseFloorTypeUnit.getId());
                }
            }
        }

        return Result.success();
    }

    /**
     * 删除楼层类型
     * @param floorTypeId
     * @return
     */
    @Override
    @Transactional
    public Result deleteFloorType(Long floorTypeId){
        //删除楼层类型和户型的关系
        List<HouseFloorTypeUnit> typeUnitList = houseFloorTypeUnitDao.findByFloorTypeId(floorTypeId);
        for (HouseFloorTypeUnit typeUnit:typeUnitList) {
            if(typeUnit != null){
//                houseFloorTypeUnitDao.delete(typeUnit);
                this.deleteTypeUnit(typeUnit.getId());
            }
        }

        //删除楼层中有该楼层类型的数据
        List<HouseRidgepoleFloor> floorList = houseRidgepoleFloorDao.findByFloorTypeId(floorTypeId);
        for (HouseRidgepoleFloor floor:floorList) {
            if(floor != null){
                houseRidgepoleFloorDao.delete(floor);
            }
        }

        //删除楼层类型
        houseFloorTypeDao.delete(floorTypeId);

        return new Result().success();
    }

    /**
     * 删除楼层类型和户型关系
     * @param typeUnitId
     * @return
     */
    @Override
    @Transactional
    public Result deleteTypeUnit(Long typeUnitId){

        //删除有该户型关系的房间
        List<HouseRidgepoleFloorRoom> roomList = houseRidgepoleFloorRoomDao.findByTypeUnitId(typeUnitId);
        for (HouseRidgepoleFloorRoom room:roomList) {
            if(room != null){
                houseRidgepoleFloorRoomDao.delete(room);
            }
        }

        houseFloorTypeUnitDao.delete(typeUnitId);

        return new Result().success();
    }

    /**
     * 根据户型，重新生成房间
     * @param typeUnitId
     */
    public void updateRoom(Long typeUnitId){

        //获取修改的户型关系
        HouseFloorTypeUnit typeUnit = houseFloorTypeUnitDao.findOne(typeUnitId);

        //获取户型关系被修改的房间列表
        List<HouseRidgepoleFloorRoom> roomList = houseRidgepoleFloorRoomDao.findByTypeUnitId(typeUnitId);

        //若没有该户型关系的房间列表，说明新增了一种户型关系，则新增房间
        if(roomList == null || roomList.size() ==0){
            HouseFloorType floorType = typeUnit.getFloorType();

            //获取所有这种楼层类型的楼层
            List<HouseRidgepoleFloor> floorList = houseRidgepoleFloorDao.findByFloorTypeId(floorType.getId());
            for (HouseRidgepoleFloor floor:floorList) {
                //为每个楼层新建这种户型关系的房间
                HouseRidgepoleFloorRoom room = new HouseRidgepoleFloorRoom();
                room.setIsSale(0);
                room.setRidgepoleFloorId(floor.getId());
                room.setRoomNo(floor.getFloorNo() + String.format("%02d", typeUnit.getRoomNo()));
                room.setTypeUnitId(typeUnitId);
                houseRidgepoleFloorRoomDao.save(room);
            }
        }
        //修改户型关系
        else{
            for (HouseRidgepoleFloorRoom room:roomList) {
                //如果修改的户型关系id = 之前生成的房间对应的户型id
                if(room != null && room.getTypeUnitId().equals(typeUnitId)){
                    //得到房间号的最后两位数
                    String roomNum = room.getRoomNo().substring(room.getRoomNo().length()-2, room.getRoomNo().length());

                    //若该户型关系的房间号与之前生成的房间号后两位不一致，则修改之前生成的房间号
                    if(Long.parseLong(roomNum) != typeUnit.getRoomNo()){
                        String floorNum = room.getRoomNo().substring(0, room.getRoomNo().length()-2);
                        room.setRoomNo(floorNum + String.format("%02d", typeUnit.getRoomNo()));
                        houseRidgepoleFloorRoomDao.save(room);
                    }
                }
            }
        }

    }
}
