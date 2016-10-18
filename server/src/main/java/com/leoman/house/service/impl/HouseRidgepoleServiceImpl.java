package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseDynamicDao;
import com.leoman.house.dao.HouseRidgepoleDao;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.entity.HouseRidgepole;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseRidgepoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘的每一栋
 * Created by Daisy on 2016/10/18.
 */
@Service
public class HouseRidgepoleServiceImpl extends GenericManagerImpl<HouseRidgepole,HouseRidgepoleDao> implements HouseRidgepoleService {

    @Autowired
    protected HouseRidgepoleDao houseRidgepoleDao;

}
