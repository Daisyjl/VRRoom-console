package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.entity.Configue;
import com.leoman.house.entity.*;
import com.leoman.house.service.*;
import com.leoman.house.service.impl.HouseAlbumServiceImpl;
import com.leoman.house.service.impl.HouseFloorTypeServiceImpl;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.utils.HttpRequestUtil;
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

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 楼层楼层管理
 * Created by Daisy on 2016/10/17.
 */
@Controller
@RequestMapping(value = "admin/house/floor")
public class HouseFloorController extends GenericEntityController<HouseFloorType,HouseFloorType,HouseFloorTypeServiceImpl> {

    @Autowired
    private HouseFloorTypeService floorTypeService;

    @Autowired
    private HouseFloorTypeUnitService houseFloorTypeUnitService;

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
        List<HouseFloorType> list = floorTypeService.findByHouseId(houseId);
        for (HouseFloorType hft:list) {
            List<HouseFloorTypeUnit> typeUnitList = houseFloorTypeUnitService.findByFloorTypeId(hft.getId());
            for (HouseFloorTypeUnit typeUnit:typeUnitList) {
                if(typeUnit.getTransverseImage() != null){
                    typeUnit.getTransverseImage().setPath(Configue.getUploadUrl() + typeUnit.getTransverseImage().getPath());
                }

                if(typeUnit.getUnit().getPlaneImage() != null){
                    typeUnit.getUnit().getPlaneImage().setPath(Configue.getUploadUrl() + typeUnit.getUnit().getPlaneImage().getPath());
                }
            }
            hft.setTypeUnitList(typeUnitList);
        }

        return new Result().success(list);
    }

    /**
     * 保存楼层类型
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(String data) {

        List<Map> list = JsonUtil.json2Obj(data, List.class);
        floorTypeService.saveFloor(list);

        return Result.success();
    }

}
