package com.leoman.house.service;

import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.entity.HouseFloorTypeUnit;

import java.util.List;

/**
 * 楼盘楼层类型和户型关系
 * Created by Daisy on 2016/10/17.
 */
public interface HouseFloorTypeUnitService extends GenericManager<HouseFloorTypeUnit> {

    public List<HouseFloorTypeUnit> findByFloorTypeId(Long floorTypeId);

}
