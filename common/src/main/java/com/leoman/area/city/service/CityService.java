package com.leoman.area.city.service;

import com.leoman.area.city.entity.City;
import com.leoman.common.service.GenericManager;

import java.util.List;

/**
 * Created by Administrator on 2016/6/16 0016.
 */
public interface CityService extends GenericManager<City>{

    public List<City> findListByProvinceId(Long provinceId);

}
