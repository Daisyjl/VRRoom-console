package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseFloorTypeDao;
import com.leoman.house.dao.HouseFloorTypeUnitDao;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.entity.HouseFloorTypeUnit;
import com.leoman.house.service.HouseFloorTypeService;
import com.leoman.house.service.HouseFloorTypeUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 楼盘楼层类型和户型的关系
 * Created by Daisy on 2016/10/17.
 */
@Service
public class HouseFloorTypeUnitServiceImpl extends GenericManagerImpl<HouseFloorTypeUnit,HouseFloorTypeUnitDao> implements HouseFloorTypeUnitService {

    @Autowired
    protected HouseFloorTypeUnitDao houseFloorTypeUnitDao;

    @Override
    public List<HouseFloorTypeUnit> findByFloorTypeId(Long floorTypeId) {
        return houseFloorTypeUnitDao.findByFloorTypeId(floorTypeId);
    }


}
