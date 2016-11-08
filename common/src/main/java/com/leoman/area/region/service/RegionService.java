package com.leoman.area.region.service;


import com.leoman.area.region.entity.Region;
import com.leoman.common.service.GenericManager;

import java.util.List;

/**
 * RegionService
 * Created by 涂奕恒 on 2016/10/18 0018 下午 3:12.
 */
public interface RegionService extends GenericManager<Region> {

    public List<Region> findListByCityId(Long cityId);

}