package com.leoman.house.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseUnitDao;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.service.HouseUnitService;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.utils.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.List;

/**
 * 楼盘户型
 * Created by Daisy on 2016/10/11.
 */
@Service
public class HouseUnitServiceImpl extends GenericManagerImpl<HouseUnit,HouseUnitDao> implements HouseUnitService {

    @Autowired
    protected HouseUnitDao houseUnitDao;

    @Autowired
    protected UploadImageService uploadImageService;

    @Override
    public List<HouseUnit> findByHouseId(Long houseId) {
        return houseUnitDao.findByHouseId(houseId);
    }

    /**
     * 保存户型
     * @param houseUnit
     * @param multipartRequest
     * @return
     */
    @Override
    @Transactional
    public Result saveUnit(HouseUnit houseUnit, MultipartRequest multipartRequest){

        MultipartFile planeFile = multipartRequest.getFile("planeFile");
        if (null != planeFile) {
            Image planeImage = uploadImageService.uploadImage(planeFile);
            houseUnit.setPlaneImage(planeImage);//平面图
        }

        /*MultipartFile d3File = multipartRequest.getFile("d3File");
        if (null != d3File) {
            Image d3Image = uploadImageService.uploadImage(d3File);
            houseUnit.setD3Image(d3Image);//3d图片
        }*/

        MultipartFile d3ModelRecogFile = multipartRequest.getFile("d3ModelRecogFile");
        if (null != d3ModelRecogFile) {
            String d3ModelRecogUrl = uploadImageService.uploadFile(d3ModelRecogFile);
            houseUnit.setD3ModelRecogUrl(d3ModelRecogUrl);//3D模型识别图
        }

        MultipartFile d3ModelFile = multipartRequest.getFile("d3ModelFile");
        if (null != d3ModelFile) {
            String d3ModelUrl = uploadImageService.uploadFile(d3ModelFile);
            houseUnit.setD3ModelUrl(d3ModelUrl);//3D模型
        }

        Long unitId = houseUnit.getId();

        if(unitId == null){
            houseUnitDao.save(houseUnit);
        }else{
            HouseUnit unit = houseUnitDao.findOne(unitId);
            ClassUtil.copyProperties(unit, houseUnit);
            houseUnitDao.save(unit);
        }

        return new Result().success();
    }
}
