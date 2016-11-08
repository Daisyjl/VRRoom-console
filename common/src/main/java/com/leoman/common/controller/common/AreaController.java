package com.leoman.common.controller.common;

import com.leoman.area.city.entity.City;
import com.leoman.area.city.service.CityService;
import com.leoman.area.region.entity.Region;
import com.leoman.area.region.service.RegionService;
import com.leoman.common.core.Result;
import com.leoman.area.province.entity.Province;
import com.leoman.area.province.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Daisy on 2016/10/11.
 */
@Controller
@RequestMapping(value = "common/area")
public class AreaController extends CommonController {

    @Autowired
    private ProvinceService provinceService;

    @Autowired
    private CityService cityService;

    @Autowired
    private RegionService regionService;

    /**
     * 省份列表
     *
     * @return
     */
    @RequestMapping("/provinceList")
    @ResponseBody
    public Result provinceList() {
        List<Province> provinceList = provinceService.iFindList();
        return new Result().success(createMap("provinceList",provinceList));
    }

    /**
     * 根据省份id查询城市列表
     *
     * @return
     */
    @RequestMapping("/cityList")
    @ResponseBody
    public Result cityList(Long provinceId) {
        List<City> cityList = cityService.findListByProvinceId(provinceId);
        return new Result().success(createMap("cityList",cityList));
    }

    /**
     * 根据城市id查询区列表
     * @param cityId
     * @return
     */
    @RequestMapping("/regionList")
    @ResponseBody
    public Result regionList(Long cityId) {
        List<Region> regionList = regionService.findListByCityId(cityId);
        return new Result().success(createMap("regionList",regionList));
    }


}
