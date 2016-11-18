package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseImageDao;
import com.leoman.house.entity.HouseImage;
import com.leoman.house.service.HouseImageService;
import com.leoman.image.entity.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 楼盘封面
 * Created by Daisy on 2016/10/14.
 */
@Service
public class HouseImageServiceImpl extends GenericManagerImpl<HouseImage,HouseImageDao> implements HouseImageService {

    @Autowired
    protected HouseImageDao houseImageDao;

    @Override
    public List<Image> findByHouseId(Long houseId) {
        return houseImageDao.findByHouseId(houseId);
    }
}
