package com.leoman.house.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.entity.Configue;
import com.leoman.house.dao.*;
import com.leoman.house.entity.*;
import com.leoman.house.service.HouseService;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.label.dao.LabelDao;
import com.leoman.label.entity.Label;
import com.leoman.utils.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class HouseServiceImpl extends GenericManagerImpl<House,HouseDao> implements HouseService {

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private HouseUnitDao houseUnitDao;

    @Autowired
    private HouseFloorTypeDao houseFloorTypeDao;

    @Autowired
    private HouseRidgepoleDao houseRidgepoleDao;

    @Autowired
    private HouseAlbumImageDao houseAlbumImageDao;

    @Autowired
    private HouseDynamicDao houseDynamicDao;

    @Autowired
    private HouseRidgepoleFloorRoomDao houseRidgepoleFloorRoomDao;

    @Autowired
    private UploadImageService uploadImageService;

    @Autowired
    private LabelDao labelDao;

    private String [] allowedArr = {".jpg", ".jpeg", ".png", ".gif", "bmp"};

    //资料百分比比重
    private enum HousePercent{
        BASIC(10), //基本信息
        UNIT(20), //户型信息
        FLOOR(20), //楼层类型
        RIDGEPOLE(20), //楼栋信息
        ALBUM(20), //相册图片
        DYNAMIC(10); //动态

        private Integer value;

        public Integer getValue() {
            return value;
        }

        HousePercent(int value){
            this.value = value;
        }

    };

    @Override
    public void setHouse(House house){
        if(house != null){

            Long houseId = house.getId();
            //获取房间数
            Integer roomNum = houseRidgepoleFloorRoomDao.findRoomNumByHouseId(houseId);
            house.setRoomNum(roomNum);

            Integer percent = HousePercent.BASIC.getValue();
            //获取户型信息百分比
            List<HouseUnit> unitList = houseUnitDao.findByHouseId(houseId);
            percent += (unitList==null||unitList.size()==0)?0:HousePercent.UNIT.getValue();

            //获取楼层类型信息百分比
            List<HouseFloorType> typeList = houseFloorTypeDao.findByHouseId(houseId);
            percent += (typeList==null||typeList.size()==0)?0:HousePercent.FLOOR.getValue();

            //获取楼信息百分比
            List<HouseRidgepole> ridgepoleList = houseRidgepoleDao.findByHouseId(houseId);
            percent += (ridgepoleList==null||ridgepoleList.size()==0)?0:HousePercent.RIDGEPOLE.getValue();

            //获取楼盘相册
            List<Image> imageList = houseAlbumImageDao.findImage(houseId);
            percent += (imageList==null||imageList.size()==0)?0:HousePercent.ALBUM.getValue();

            //获取楼盘动态
            Integer dynamicNum = houseDynamicDao.findNumByHouseId(houseId);
            percent += (dynamicNum <= 0)?0:HousePercent.DYNAMIC.getValue();

            house.setHousePercent(percent);
        }
    }

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

    /**
     * 修改楼盘的沙盘图
     */
    @Override
    @Transactional
    public Result saveBigImage(Long houseId, MultipartRequest multipartRequest){
        MultipartFile file = multipartRequest.getFile("tempImage");

        // 验证图片格式
        String originalFileName = file.getOriginalFilename().toLowerCase();
        String fileType = originalFileName.substring(originalFileName.lastIndexOf("."));


        if (!Arrays.asList(allowedArr).contains(fileType.toLowerCase())) {
            return Result.failure(ErrorType.ERROR_CODE_00014);//上传文件格式错误
        }

        Image image = uploadImageService.uploadImage(file);

        //修改楼盘对应的大图
        House house = houseDao.findOne(houseId);
        //把之前图片对应的标签全部对应到新的图片
        if(house.getBigImage() != null){
            List<Label> labelList = labelDao.findListByObjectId(house.getBigImage().getId());
            for (Label label:labelList) {
                label.setObjectId(image.getId());
                labelDao.save(label);
            }
        }

        //修改楼盘对应的大图
        house.setBigImage(image);
        houseDao.save(house);

        image.setUploadUrl(Configue.getUploadUrl()+image.getPath());

        return new Result().success(image);
    }


}
