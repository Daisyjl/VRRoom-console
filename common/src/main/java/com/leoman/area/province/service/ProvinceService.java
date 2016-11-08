package com.leoman.area.province.service;

import com.leoman.common.service.GenericManager;
import com.leoman.area.province.entity.Province;
import com.leoman.area.province.entity.vo.ProvinceVo;

import java.util.List;

/**
 * Created by Administrator on 2016/6/16 0016.
 */
public interface ProvinceService extends GenericManager<Province> {

    public List<Province> iFindList();

    public List<ProvinceVo> getProvinceList();
}
