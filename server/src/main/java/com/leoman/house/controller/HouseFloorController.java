package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.entity.Configue;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.entity.HouseFloorTypeUnit;
import com.leoman.house.service.HouseFloorTypeService;
import com.leoman.house.service.HouseFloorTypeUnitService;
import com.leoman.house.service.impl.HouseFloorTypeServiceImpl;
import com.leoman.house.util.ImageFindUtil;
import com.leoman.image.entity.Image;
import com.leoman.image.service.ImageService;
import com.leoman.label.entity.Label;
import com.leoman.label.service.LabelService;
import com.leoman.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @Autowired
    private ImageService imageService;

    @Autowired
    private LabelService labelService;

    @RequestMapping(value = "/typeLabel")
    public String typeLabel(Long id, Model model){
        model.addAttribute("houseId", id);
        return "house/house_edit_floor_type_label";
    }

    /**
     * 跳转编辑楼层类型页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/editType/{id}")
    public String editType(@PathVariable("id") Long id, Model model){
        model.addAttribute("houseId", id);
        return "house/house_edit_floor_type_label";
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
            hft.setTypeUnitList(typeUnitList);

            if(hft.getBigImage() != null){
                List<Label> labelList = labelService.findListByParams(hft.getBigImage().getId());
                hft.getBigImage().setLabelList(labelList);
            }
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

    /**
     * 删除楼层类型和户型关系
     * @param floorTypeId
     * @return
     */
    @RequestMapping(value = "/delFloorType", method = RequestMethod.POST)
    @ResponseBody
    public Result delFloorType(Long floorTypeId) {

        HouseFloorType floorType = floorTypeService.queryByPK(floorTypeId);
        if(floorType != null){
            floorTypeService.deleteFloorType(floorType.getId());
        }

        return Result.success();
    }

    /**
     * 删除楼层类型和户型关系
     * @param typeUnitId
     * @return
     */
    @RequestMapping(value = "/delTypeUnit", method = RequestMethod.POST)
    @ResponseBody
    public Result delTypeUnit(Long typeUnitId) {

        Result result = floorTypeService.deleteTypeUnit(typeUnitId);
        return result;
    }

    /**
     * 根据图片和点，生成点对应图片的坐标
     * @return
     */
    @RequestMapping(value = "/findPoints", method = RequestMethod.POST)
    @ResponseBody
    public Result findPoints(Integer bigImageId, Integer smallImageId) {

        Image bigImage = imageService.getById(bigImageId);
        Image smallImage = imageService.getById(smallImageId);
        List<Map> pointList = ImageFindUtil.findPoints(Configue.getUploadPath()+smallImage.getPath(), Configue.getUploadPath()+bigImage.getPath());

        return Result.success(pointList);
    }

}
