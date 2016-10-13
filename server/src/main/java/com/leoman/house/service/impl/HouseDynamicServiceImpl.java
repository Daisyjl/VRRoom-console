package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseDao;
import com.leoman.house.dao.HouseDynamicDao;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘动态
 * Created by Daisy on 2016/10/12.
 */
@Service
public class HouseDynamicServiceImpl extends GenericManagerImpl<HouseDynamic,HouseDynamicDao> implements HouseDynamicService {

    @Autowired
    protected HouseDynamicDao houseDynamicDao;

}
