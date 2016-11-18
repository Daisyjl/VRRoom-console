package com.leoman.house.service;

import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseImage;
import com.leoman.image.entity.Image;

import java.util.List;

/**
 * 楼盘封面图
 * Created by Daisy on 2016/10/14.
 */
public interface HouseImageService extends GenericManager<HouseImage> {

    public List<Image> findByHouseId(Long houseId);

}
