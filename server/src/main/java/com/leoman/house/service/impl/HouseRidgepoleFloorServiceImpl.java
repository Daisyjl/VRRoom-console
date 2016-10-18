package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseRidgepoleDao;
import com.leoman.house.dao.HouseRidgepoleFloorDao;
import com.leoman.house.entity.HouseRidgepole;
import com.leoman.house.entity.HouseRidgepoleFloor;
import com.leoman.house.service.HouseRidgepoleFloorService;
import com.leoman.house.service.HouseRidgepoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘的每一栋的每一层
 * Created by Daisy on 2016/10/18.
 */
@Service
public class HouseRidgepoleFloorServiceImpl extends GenericManagerImpl<HouseRidgepoleFloor,HouseRidgepoleFloorDao> implements HouseRidgepoleFloorService {

    @Autowired
    protected HouseRidgepoleFloorDao houseRidgepoleFloorDao;

}
