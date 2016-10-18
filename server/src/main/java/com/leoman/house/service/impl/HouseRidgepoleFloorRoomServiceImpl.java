package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseRidgepoleFloorDao;
import com.leoman.house.dao.HouseRidgepoleFloorRoomDao;
import com.leoman.house.entity.HouseRidgepoleFloor;
import com.leoman.house.entity.HouseRidgepoleFloorRoom;
import com.leoman.house.service.HouseRidgepoleFloorRoomService;
import com.leoman.house.service.HouseRidgepoleFloorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘的每一栋的每一层
 * Created by Daisy on 2016/10/18.
 */
@Service
public class HouseRidgepoleFloorRoomServiceImpl extends GenericManagerImpl<HouseRidgepoleFloorRoom,HouseRidgepoleFloorRoomDao> implements HouseRidgepoleFloorRoomService {

    @Autowired
    protected HouseRidgepoleFloorRoomDao houseRidgepoleFloorRoomDao;

}
