package com.leoman.house.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseAlbumImage;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.List;

/**
 * 楼盘相册图片
 * Created by Daisy on 2016/10/14.
 */
public interface HouseAlbumImageService extends GenericManager<HouseAlbumImage> {

    public List<HouseAlbumImage> findImageNum(Long houseId, Long albumId);

    public Result saveImage(HouseAlbumImage albumImage, String imageId);

}
