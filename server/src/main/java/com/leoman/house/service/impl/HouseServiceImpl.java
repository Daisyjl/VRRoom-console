package com.leoman.house.service.impl;

import com.leoman.area.region.dao.RegionDao;
import com.leoman.area.region.entity.Region;
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
import org.springframework.util.StringUtils;
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
    private HouseImageDao houseImageDao;

    @Autowired
    private LabelDao labelDao;

    @Autowired
    private RegionDao regionDao;

    @Autowired
    private HousePriceDao housePriceDao;


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

    }

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
    public Result saveHouse(House house, String imageIds, String district){

        Long houseId = house.getId();

        //设置省市区
        if(!StringUtils.isEmpty(district)){
            Region reg = regionDao.findByName(district);
            house.setRegion(reg);
        }

        //富文本
        String content = house.getIntro();
        if(org.apache.commons.lang.StringUtils.isNotBlank(content)){
            content = content.replace("&lt", "<").replace("&gt", ">");
            house.setIntro(content);
        }

        //新增
        if(houseId == null){
            House h = houseDao.findByName(house.getName());
            if(h != null){
                return new Result().failure(ErrorType.ERROR_CODE_00010);//楼盘名称已存在
            }
            house.setStatus(0);
        }
        //修改
        else{
            House h = houseDao.findByNameAndId(house.getName(), houseId);
            if(h != null){
                return new Result().failure(ErrorType.ERROR_CODE_00010);//楼盘名称已存在
            }

            House org = houseDao.findOne(houseId);

            //如果价格改变，则保存价格走势
            if(house.getUnitPrice() != null && !house.getUnitPrice().equals(org.getUnitPrice())){
                HousePrice housePrice = new HousePrice();
                housePrice.setHouseId(houseId);
                housePrice.setPrice(house.getUnitPrice());
                housePriceDao.save(housePrice);
            }

            ClassUtil.copyProperties(org, house);
            house = org;

            //删除楼盘的封面图
            List<HouseImage> imageList = houseImageDao.findListByHouseId(houseId);
            if(imageList != null){
                for (HouseImage hi:imageList) {
                    if(hi != null){
                        houseImageDao.delete(hi);
                    }
                }
            }




        }

        //保存
        houseDao.save(house);

        //新增封面图列表
        if(!StringUtils.isEmpty(imageIds)){
            String [] imageIdArr = imageIds.split("\\,");
            for (int i =0; i<imageIdArr.length; i++) {
                HouseImage houseImage = new HouseImage();
                houseImage.setHouseId(house.getId());
                houseImage.setImage(new Image(Integer.valueOf(imageIdArr[i])));
                houseImage.setSeq((long)i);
                houseImageDao.save(houseImage);
            }

            //如果是新增，则默认把封面图作为沙盘图
            if(imageIdArr.length > 0){
                house.setBigImage(new Image(Integer.valueOf(imageIdArr[0])));
            }
        }

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
