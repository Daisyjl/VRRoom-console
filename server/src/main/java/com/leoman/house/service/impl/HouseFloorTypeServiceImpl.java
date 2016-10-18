package com.leoman.house.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseAlbumDao;
import com.leoman.house.dao.HouseFloorTypeDao;
import com.leoman.house.dao.HouseFloorTypeUnitDao;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.entity.HouseFloorTypeUnit;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseFloorTypeService;
import com.leoman.image.entity.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    public List<HouseFloorType> findByHouseId(Long houseId) {
        return houseFloorTypeDao.findByHouseId(houseId);
    }

    @Override
    @Transactional
    public Result saveFloor(List<Map> list){
        if(list != null){
            for (Map floorMap: list) {

                String houseId = (String)floorMap.get("houseId");
                String name = (String)floorMap.get("name");
                List<Map> tranList = (List)floorMap.get("tranArr");

                //保存楼层类型
                HouseFloorType houseFloorType = new HouseFloorType();
                houseFloorType.setHouseId(Long.valueOf(houseId));
                houseFloorType.setName(name);
                houseFloorTypeDao.save(houseFloorType);

                for (Map tranMap:tranList) {
                    String imageId = (String)tranMap.get("imageId");
                    String unitId = (String)tranMap.get("unitId");

                    //保存楼层类型和户型的关系
                    HouseFloorTypeUnit houseFloorTypeUnit = new HouseFloorTypeUnit();
                    houseFloorTypeUnit.setFloorType(houseFloorType);
                    houseFloorTypeUnit.setTransverseImage(new Image(Integer.valueOf(imageId)));
                    houseFloorTypeUnit.setUnit(new HouseUnit(Long.valueOf(unitId)));
                    houseFloorTypeUnitDao.save(houseFloorTypeUnit);
                }
            }
        }

        return Result.success();
    }
}
