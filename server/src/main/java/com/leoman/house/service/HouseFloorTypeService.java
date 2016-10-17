package com.leoman.house.service;

import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseFloorType;

/**
 * 楼盘楼层类型
 * Created by Daisy on 2016/10/17.
 */
public interface HouseFloorTypeService extends GenericManager<HouseFloorType> {

    public HouseFloorType findByHouseId(Long houseId);

}
