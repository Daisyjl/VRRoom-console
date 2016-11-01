package com.leoman.house.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseDao;
import com.leoman.house.dao.HouseDynamicDao;
import com.leoman.house.dao.HouseUnitDao;
import com.leoman.house.entity.House;
import com.leoman.house.service.HouseService;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.utils.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class HouseServiceImpl extends GenericManagerImpl<House,HouseDao> implements HouseService {

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private UploadImageService uploadImageService;

    /**
     * 保存
     */
    @Override
    @Transactional
    public Result saveHouse(House house, MultipartRequest multipartRequest){

        Long houseId = house.getId();

        //新增
        if(houseId == null){
            House h = houseDao.findByName(house.getName());
            if(h != null){
                return new Result().failure(ErrorType.ERROR_CODE_00010);//楼盘名称已存在
            }
        }
        //修改
        else{
            House h = houseDao.findByNameAndId(house.getName(), houseId);
            if(h != null){
                return new Result().failure(ErrorType.ERROR_CODE_00010);//楼盘名称已存在
            }

            House orgHouse = houseDao.findOne(houseId);
            house.setImage(orgHouse.getImage());
            house.setStatus(orgHouse.getStatus());
        }

        MultipartFile coverFile = multipartRequest.getFile("coverFile");
        if (null != coverFile) {
            Image image = uploadImageService.uploadImage(coverFile);
            house.setImage(image);
        }

        if(house.getImage() == null){
            return new Result().failure(ErrorType.ERROR_CODE_00012);//楼盘封面图不能为空
        }

        //基本信息
        house.setStatus(0);
        houseDao.save(house);

        return new Result().success();
    }


}
