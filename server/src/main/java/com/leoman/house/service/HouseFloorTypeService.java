package com.leoman.house.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseFloorType;

import java.util.List;
import java.util.Map;

/**
 * 楼盘楼层类型
 * Created by Daisy on 2016/10/17.
 */
public interface HouseFloorTypeService extends GenericManager<HouseFloorType> {

    public List<HouseFloorType> findByHouseId(Long houseId);

    public Result saveFloor(List<Map> list);

}
