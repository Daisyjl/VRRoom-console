package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseDao;
import com.leoman.house.dao.HouseUnitDao;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.HouseUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘户型
 * Created by Daisy on 2016/10/11.
 */
@Service
public class HouseUnitServiceImpl extends GenericManagerImpl<HouseUnit,HouseUnitDao> implements HouseUnitService {

    @Autowired
    protected HouseUnitDao houseUnitDao;


}
