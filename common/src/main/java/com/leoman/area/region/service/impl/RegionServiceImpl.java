package com.leoman.area.region.service.impl;

import com.leoman.area.region.dao.RegionDao;
import com.leoman.area.region.entity.Region;
import com.leoman.area.region.service.RegionService;
import com.leoman.common.service.impl.GenericManagerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * RegionServiceImpl
 * Created by 涂奕恒 on 2016/10/18 0018 下午 3:23.
 */
@Service
public class RegionServiceImpl  extends GenericManagerImpl<Region, RegionDao> implements RegionService {

    @Autowired
    private RegionDao regionDao;


    @Override
    public List<Region> findListByCityId(Long cityId) {
        return regionDao.findListByCityId(cityId);
    }
}