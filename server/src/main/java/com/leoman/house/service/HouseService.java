package com.leoman.house.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.House;
import org.springframework.web.multipart.MultipartRequest;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface HouseService extends GenericManager<House> {

    public Result saveHouse(House house, String imageIds, String district, String city);

    public void setHouse(House house);

    public Result saveBigImage(Long houseId, MultipartRequest multipartRequest);

}
