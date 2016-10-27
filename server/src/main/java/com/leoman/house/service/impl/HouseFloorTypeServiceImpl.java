package com.leoman.house.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.*;
import com.leoman.house.entity.*;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseFloorTypeService;
import com.leoman.image.entity.Image;
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

                    //如果该关系存在，则修改，不存在，则新增
                    HouseFloorTypeUnit houseFloorTypeUnit = houseFloorTypeUnitDao.findOne(Long.valueOf(typeUnitId));
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
        List<HouseRidgepoleFloor> floorList = new ArrayList<>();
        List<HouseRidgepoleFloorRoom> roomList = houseRidgepoleFloorRoomDao.findByTypeUnitId(typeUnitId);
        for (HouseRidgepoleFloorRoom room:roomList) {
            if(room != null && !floorList.contains(room.getRidgepoleFloor())){
                floorList.add(room.getRidgepoleFloor());//获取所有修改了户型的楼层
                //删除该楼层的所有房间
                houseRidgepoleFloorRoomDao.delete(room);
            }
        }

        //重新生成所有房间
        for (HouseRidgepoleFloor floor:floorList) {
            if(floor != null){
                HouseFloorType floorType = floor.getFloorType();
                List<HouseFloorTypeUnit> typeUnitList = houseFloorTypeUnitDao.findByFloorTypeId(floorType.getId());
                if(typeUnitList != null && typeUnitList.size() > 0){
                    for (HouseFloorTypeUnit hftu:typeUnitList) {
                        Integer roomNo = hftu.getRoomNo();
                        HouseRidgepoleFloorRoom houseRidgepoleFloorRoom = new HouseRidgepoleFloorRoom();
                        houseRidgepoleFloorRoom.setRoomNo(floor.getFloorNo() + String.format("%02d", roomNo));
                        houseRidgepoleFloorRoom.setRidgepoleFloor(floor);
                        houseRidgepoleFloorRoom.setIsSale(0);
                        houseRidgepoleFloorRoom.setTypeUnit(hftu);
                        houseRidgepoleFloorRoomDao.save(houseRidgepoleFloorRoom);
                    }
                }
            }
        }


    }
}
