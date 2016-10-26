package com.leoman.house.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseAlbumDao;
import com.leoman.house.dao.HouseAlbumImageDao;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseAlbumImage;
import com.leoman.house.service.HouseAlbumImageService;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.LongLiteral;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.List;

/**
 * 楼盘相册图片
 * Created by Daisy on 2016/10/14.
 */
@Service
public class HouseAlbumImageServiceImpl extends GenericManagerImpl<HouseAlbumImage,HouseAlbumImageDao> implements HouseAlbumImageService {

    @Autowired
    protected HouseAlbumImageDao houseAlbumImageDao;

    @Autowired
    protected UploadImageService uploadImageService;

    @Override
    public List<HouseAlbumImage> findImageNum(Long houseId, Long albumId) {
        return houseAlbumImageDao.findImage(houseId, albumId);
    }

    /**
     * 保存图片
     * @param albumImage
     * @return
     */
    @Override
    @Transactional
    public Result saveImage(HouseAlbumImage albumImage, String imageId){

        if(!StringUtils.isEmpty(imageId)){

            //先删除已存在的图片
            List<HouseAlbumImage> imageList = houseAlbumImageDao.findImage(albumImage.getHouseId(), albumImage.getAlbum().getId());
            for (HouseAlbumImage hai:imageList) {
                if(hai != null){
                    houseAlbumImageDao.delete(hai);
                }
            }

            //保存
            String [] imageIdArr = imageId.split("\\,");
            for (String imageIdStr:imageIdArr) {
                HouseAlbumImage hai = new HouseAlbumImage();
                hai.setAlbum(albumImage.getAlbum());
                hai.setHouseId(albumImage.getHouseId());
                hai.setImage(new Image(Integer.valueOf(imageIdStr)));
                houseAlbumImageDao.save(hai);
            }
        }

        /*List<MultipartFile> files = multipartRequest.getFiles("file");
        if(files != null){

            //先删除已存在的图片
            List<HouseAlbumImage> imageList = houseAlbumImageDao.findImage(albumImage.getHouseId(), albumImage.getAlbum().getId());
            for (HouseAlbumImage hai:imageList) {
                if(hai != null){
                    houseAlbumImageDao.delete(hai);
                }
            }

            //保存
            for (MultipartFile file:files) {
                HouseAlbumImage hai = new HouseAlbumImage();
                hai.setAlbum(albumImage.getAlbum());
                hai.setHouseId(albumImage.getHouseId());
                Image image = uploadImageService.uploadImage(file);
                hai.setImage(image);
                houseAlbumImageDao.save(hai);
            }
        }*/

        return new Result().success();
    }
}
