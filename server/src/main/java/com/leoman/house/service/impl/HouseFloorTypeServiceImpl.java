package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseAlbumDao;
import com.leoman.house.dao.HouseFloorTypeDao;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseFloorTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘楼层类型
 * Created by Daisy on 2016/10/17.
 */
@Service
public class HouseFloorTypeServiceImpl extends GenericManagerImpl<HouseFloorType,HouseFloorTypeDao> implements HouseFloorTypeService {

    @Autowired
    protected HouseFloorTypeDao houseFloorTypeDao;

    @Override
    public HouseFloorType findByHouseId(Long houseId) {
        return houseFloorTypeDao.findByHouseId(houseId);
    }
}
