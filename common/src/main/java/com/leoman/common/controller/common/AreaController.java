package com.leoman.common.controller.common;

import com.leoman.city.entity.City;
import com.leoman.city.service.CityService;
import com.leoman.common.core.Result;
import com.leoman.province.entity.Province;
import com.leoman.province.service.ProvinceService;
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


}
