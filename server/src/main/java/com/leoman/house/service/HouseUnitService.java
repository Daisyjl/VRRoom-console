package com.leoman.house.service;

import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseUnit;

import java.util.List;

/**
 * Created by Daisy on 2016/10/12.
 */
public interface HouseUnitService extends GenericManager<HouseUnit> {

    public List<HouseUnit> findByHouseId(Long houseId);

}
