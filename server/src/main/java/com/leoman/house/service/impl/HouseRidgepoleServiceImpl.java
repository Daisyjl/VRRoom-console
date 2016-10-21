package com.leoman.house.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.*;
import com.leoman.house.entity.*;
import com.leoman.house.entity.vo.RidgepoleFloorVo;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseRidgepoleService;
import com.leoman.image.dao.ImageDao;
import com.leoman.image.entity.Image;
import com.leoman.label.dao.LabelDao;
import com.leoman.label.entity.Label;
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

    /**
     * 根据楼层类型分组，获取楼层列表
     * @return
     */
    @Override
    public Result findByGroupFloorType(Long ridgepoleId){

        String sql = "SELECT \n" +
                "  t.`floor_type_id` AS floorTypeId,\n" +
                "  t.`direction_image_id` AS directionImageId,\n" +
                "  GROUP_CONCAT(t.`floor_no`) AS floorNos \n" +
                "FROM\n" +
                "  t_house_ridgepole_floor t \n" +
                "WHERE t.`ridgepole_id` = "+ridgepoleId+" \n" +
                "GROUP BY t.`floor_type_id`";
        /*List<RidgepoleFloorVo> list = super.queryBySql(sql);
        for (RidgepoleFloorVo vo:list) {
            BigInteger floorTypeId = vo.getFloorTypeId();
            BigInteger directionImageId = vo.getDirectionImageId();

            Image directionImage = imageDao.findOne(directionImageId.intValue());
            vo.setDirectionImage(directionImage);

            List<HouseFloorTypeUnit> typeUnitList = houseFloorTypeUnitDao.findByFloorTypeId(floorTypeId.longValue());
            vo.setFloorType((typeUnitList==null || typeUnitList.size()==0)?null:typeUnitList.get(0).getFloorType());
        }
        return new Result().success(list);*/
        return null;
    }

    /**
     * 保存
     * @param map
     * @return
     */
    @Override
    @Transactional
    public Result saveRidgepole(Map map){

        String houseId = (String)map.get("houseId");
        String name = (String)map.get("name");
        String floorNum = (String)map.get("floorNum");
        String minSpace = (String)map.get("minSpace");

        //保存楼盘的栋信息
        HouseRidgepole houseRidgepole = new HouseRidgepole();
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
                            houseRidgepoleFloorRoom.setRidgepoleFloor(houseRidgepoleFloor);
                            houseRidgepoleFloorRoom.setIsSale(0);
                            houseRidgepoleFloorRoom.setTypeUnit(hftu);
                            houseRidgepoleFloorRoomDao.save(houseRidgepoleFloorRoom);
                        }
                    }
                }
            }
        }

        return Result.success();
    }

}
