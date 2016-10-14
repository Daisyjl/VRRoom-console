package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseAlbumDao;
import com.leoman.house.dao.HouseDynamicDao;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseDynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 楼盘相册
 * Created by Daisy on 2016/10/14.
 */
@Service
public class HouseAlbumServiceImpl extends GenericManagerImpl<HouseAlbum,HouseAlbumDao> implements HouseAlbumService {

    @Autowired
    protected HouseAlbumDao houseAlbumDao;

}
