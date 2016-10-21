package com.leoman.house.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.entity.HouseRidgepole;

import java.util.Map;

/**
 * 楼盘的每一栋
 * Created by Daisy on 2016/10/18.
 */
public interface HouseRidgepoleService extends GenericManager<HouseRidgepole> {

    public Result saveRidgepole(Map map);

    public Result findByGroupFloorType(Long ridgepoleId);

}
