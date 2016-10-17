package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.entity.Configue;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseAlbumImage;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.service.*;
import com.leoman.house.service.impl.HouseAlbumServiceImpl;
import com.leoman.house.service.impl.HouseFloorTypeServiceImpl;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.List;

/**
 * 楼层楼层管理
 * Created by Daisy on 2016/10/17.
 */
@Controller
@RequestMapping(value = "admin/house/floor")
public class HouseFloorController extends GenericEntityController<HouseFloorType,HouseFloorType,HouseFloorTypeServiceImpl> {

    @Autowired
    private UploadImageService uploadImageService;

    @Autowired
    private HouseFloorTypeService floorTypeService;

    @Autowired
    private HouseFloorTypeUnitService floorTypeUnitService;


    /**
     * 跳转编辑楼层类型页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/editType/{id}")
    public String editAlbum(@PathVariable("id") Long id, Model model){
        model.addAttribute("houseId", id);
        return "house/house_edit_floor_type";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Result list(Long houseId) {
        List<HouseFloorType> list = floorTypeService.queryAll();

        return new Result().success(createMap("list",list));
    }

    /**
     * 保存楼盘相册
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(HouseAlbumImage albumImage) {

        return Result.success();
    }



}
