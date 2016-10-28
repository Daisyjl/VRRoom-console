package com.leoman.house.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.*;
import com.leoman.house.entity.*;
import com.leoman.house.service.HouseRidgepoleService;
import com.leoman.image.dao.ImageDao;
import com.leoman.image.entity.Image;
import com.leoman.label.dao.LabelDao;
import com.leoman.label.entity.Label;
import com.leoman.utils.ImageUtil;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * 楼盘的每一栋
 * Created by Daisy on 2016/10/18.
 */
@Service
public class HouseRidgepoleServiceImpl extends GenericManagerImpl<HouseRidgepole,HouseRidgepoleDao> implements HouseRidgepoleService {

    @Autowired
    protected HouseRidgepoleDao houseRidgepoleDao;

    @Autowired
    protected HouseRidgepoleFloorDao houseRidgepoleFloorDao;

    @Autowired
    protected HouseFloorTypeDao houseFloorTypeDao;

    @Autowired
    protected HouseFloorTypeUnitDao houseFloorTypeUnitDao;

    @Autowired
    protected HouseRidgepoleFloorRoomDao houseRidgepoleFloorRoomDao;

    @Autowired
    protected LabelDao labelDao;

    @Autowired
    protected ImageDao imageDao;

    @Override
    public List<HouseRidgepole> findRoomList(Long houseId){
        List<HouseRidgepole> list = houseRidgepoleDao.findByHouseId(houseId);
        for (HouseRidgepole ridgepole:list) {
            List<HouseRidgepoleFloor> floorList = houseRidgepoleFloorDao.findByRidgepoleId(ridgepole.getId());
            ridgepole.setFloorList(floorList);
            for (HouseRidgepoleFloor floor:floorList) {
                List<HouseRidgepoleFloorRoom> roomList = houseRidgepoleFloorRoomDao.findByRidgepoleFloorId(floor.getId());
                floor.setRoomList(roomList);
            }
        }
        return list;
    }

    /**
     * 根据楼层类型分组，获取楼层列表
     * @return
     */
    @Override
    public List<Map> findByGroupFloorType(Long ridgepoleId) throws Exception{

        String sql = "SELECT \n" +
                "  t.`floor_type_id` AS floorTypeId,\n" +
                "  t.`direction_image_id` AS directionImageId,\n" +
                "  GROUP_CONCAT(t.`floor_no` ORDER BY t.`floor_no` ASC) AS floorNos \n" +
                "FROM\n" +
                "  t_house_ridgepole_floor t \n" +
                "WHERE t.`ridgepole_id` = "+ridgepoleId+" \n" +
                "GROUP BY t.`floor_type_id`";
        List<Map> list = super.queryBySql(sql);
        for (Map map:list) {
            String floorNos = "";
            if(map.get("floorNos").getClass().equals(String.class)){
                floorNos = (String) map.get("floorNos");
            }else if(map.get("floorNos").getClass().equals(byte[].class)){
                floorNos = new String((byte[]) map.get("floorNos"),"UTF-8");
            }
            map.put("floorNos", floorNos);
            BigInteger floorTypeId = (BigInteger) map.get("floorTypeId");
            BigInteger directionImageId = (BigInteger) map.get("directionImageId");

            Image directionImage = imageDao.findOne(directionImageId.intValue());
            map.put("directionImage",directionImage);

            List<HouseFloorTypeUnit> typeUnitList = houseFloorTypeUnitDao.findByFloorTypeId(floorTypeId.longValue());
            HouseFloorTypeUnit typeUnit = (typeUnitList==null || typeUnitList.size()==0)?null:typeUnitList.get(0);
            map.put("typeUnit", typeUnit);
        }
        return list;
    }

    /**
     * 保存
     * @param map
     * @return
     */
    @Override
    @Transactional
    public Result saveRidgepole(Map map){

        String ridgepoleId = (String)map.get("ridgepoleId");
        String houseId = (String)map.get("houseId");
        String name = (String)map.get("name");
        String floorNum = (String)map.get("floorNum");
        String minSpace = (String)map.get("minSpace");

        HouseRidgepole houseRidgepole;

        //新增
        if(StringUtils.isEmpty(ridgepoleId)){
            houseRidgepole = new HouseRidgepole();
        }
        //编辑
        else{
            houseRidgepole = houseRidgepoleDao.findOne(Long.valueOf(ridgepoleId));

            if(houseRidgepole == null){
                return new Result().failure(ErrorType.ERROR_CODE_00011);//楼信息不存在
            }

            //删除楼层信息
            List<HouseRidgepoleFloor> floorList = houseRidgepoleFloorDao.findByRidgepoleId(Long.valueOf(ridgepoleId));
            for (HouseRidgepoleFloor hrf:floorList) {
                if(hrf != null){
                    houseRidgepoleFloorDao.delete(hrf);
                }
            }

            //楼层的房间信息
            List<HouseRidgepoleFloorRoom> roomList = houseRidgepoleFloorRoomDao.findByRidgepoleId(Long.valueOf(ridgepoleId));
            for (HouseRidgepoleFloorRoom room:roomList) {
                if(room != null){
                    houseRidgepoleFloorRoomDao.delete(room);
                }
            }
        }


        //保存楼盘的栋信息
        houseRidgepole.setHouseId(Long.valueOf(houseId));
        houseRidgepole.setFloorNum(Long.valueOf(floorNum));
        houseRidgepole.setMinSpace(minSpace);
        houseRidgepole.setName(name);
        houseRidgepoleDao.save(houseRidgepole);

        //设置该label的关联哪一栋
        String labelId = (String)map.get("labelId");
        Label label = labelDao.findOneByLabelId(labelId);
        label.setRidgepoleId(houseRidgepole.getId());
        labelDao.save(label);

        //楼层信息
        List<Map> list = (List)map.get("floorArr");
        for (Map floor:list) {
            String imageId = (String)floor.get("imageId");
            String floorTypeId = (String)floor.get("floorTypeId");
            String floorNos = (String)floor.get("floorNos");

            String [] floorNoArr = floorNos.split("\\,");
            for (String floorNo:floorNoArr) {
                //保存栋的层信息
                HouseRidgepoleFloor houseRidgepoleFloor = new HouseRidgepoleFloor();
                if(!StringUtils.isEmpty(imageId)){
                    houseRidgepoleFloor.setDirectionImage(new Image(Integer.valueOf(imageId)));
                }
                houseRidgepoleFloor.setFloorNo(Long.valueOf(floorNo));
                houseRidgepoleFloor.setFloorType(new HouseFloorType(Long.valueOf(floorTypeId)));
                houseRidgepoleFloor.setRidgepole(houseRidgepole);
                houseRidgepoleFloorDao.save(houseRidgepoleFloor);

                //保存层的房间信息
                HouseFloorType houseFloorType = houseFloorTypeDao.findOne(Long.valueOf(floorTypeId));
                if(houseFloorType != null){
                    List<HouseFloorTypeUnit> typeUnitList = houseFloorTypeUnitDao.findByFloorTypeId(houseFloorType.getId());
                    if(typeUnitList != null && typeUnitList.size() > 0){
                        for (HouseFloorTypeUnit hftu:typeUnitList) {
                            Integer roomNo = hftu.getRoomNo();
                            HouseRidgepoleFloorRoom houseRidgepoleFloorRoom = new HouseRidgepoleFloorRoom();
                            houseRidgepoleFloorRoom.setRoomNo(floorNo + String.format("%02d", roomNo));
                            houseRidgepoleFloorRoom.setRidgepoleFloorId(houseRidgepoleFloor.getId());
                            houseRidgepoleFloorRoom.setIsSale(0);
                            houseRidgepoleFloorRoom.setTypeUnitId(hftu.getId());
                            houseRidgepoleFloorRoomDao.save(houseRidgepoleFloorRoom);
                        }
                    }
                }
            }
        }

        return Result.success();
    }

    @Override
    @Transactional
    public Result saveRoom(List<Map> list){
        if(list != null){
            for (Map map:list) {
                String roomId = (String) map.get("roomId");
                double isSale = (double) map.get("isSale");
                if(!StringUtils.isEmpty(roomId)){
                    HouseRidgepoleFloorRoom room = houseRidgepoleFloorRoomDao.findOne(Long.valueOf(roomId));
                    if(room != null){
                        room.setIsSale((int)isSale);
                        houseRidgepoleFloorRoomDao.save(room);
                    }
                }
            }
        }

        return new Result().success();
    }

}
