package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseAlbumDao;
import com.leoman.house.dao.HouseAlbumImageDao;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseAlbumImage;
import com.leoman.house.service.HouseAlbumImageService;
import com.leoman.house.service.HouseAlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 楼盘相册图片
 * Created by Daisy on 2016/10/14.
 */
@Service
public class HouseAlbumImageServiceImpl extends GenericManagerImpl<HouseAlbumImage,HouseAlbumImageDao> implements HouseAlbumImageService {

    @Autowired
    protected HouseAlbumImageDao houseAlbumImageDao;

    @Override
    public List<HouseAlbumImage> findImageNum(Long houseId, Long albumId) {
        return houseAlbumImageDao.findImageNum(houseId, albumId);
    }
}
