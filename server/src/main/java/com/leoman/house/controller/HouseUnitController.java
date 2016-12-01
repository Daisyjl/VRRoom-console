package com.leoman.house.controller;

import com.leoman.bedroom.entity.Bedroom;
import com.leoman.bedroom.service.BedroomService;
import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.direction.entity.Direction;
import com.leoman.direction.service.DirectionService;
import com.leoman.entity.Configue;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.entity.HouseUnitImage;
import com.leoman.house.service.HouseUnitService;
import com.leoman.house.service.impl.HouseServiceImpl;
import com.leoman.utils.ImageUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import java.util.ArrayList;
import java.util.List;

/**
 * 楼层户型管理
 * Created by Daisy on 2016/10/13.
 */
@Controller
@RequestMapping(value = "admin/house/unit")
public class HouseUnitController extends GenericEntityController<House,House,HouseServiceImpl> {

    @Autowired
    private HouseUnitService houseUnitService;

    @Autowired
    private DirectionService directionService;

    @Autowired
    private BedroomService bedroomService;

    /**
     * 跳转编辑楼盘户型页面
     * @param houseId
     * @param model
     * @return
     */
    @RequestMapping(value = "/index/{houseId}")
    public String index(@PathVariable("houseId") Long houseId, Model model){
        model.addAttribute("houseId", houseId);
        return "house/house_unit_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Result list(Long houseId) {
        List<HouseUnit> list = houseUnitService.findByHouseId(houseId);
        return new Result().success(list);
    }

    /**
     * 查询户型详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(Long houseId, Long id, Model model) throws Exception {
        List<HouseUnitImage> d3ImageList = new ArrayList<>();
        if(id != null){
            HouseUnit unit = houseUnitService.queryByPK(id);
            if(StringUtils.isNotBlank(unit.getPlaneImage().getPath())){
                unit.getPlaneImage().setUploadUrl(Configue.getUploadUrl() + unit.getPlaneImage().getPath());
            }
            if(StringUtils.isNotBlank(unit.getD3ModelUrl())){
                unit.setD3ModelUrl(Configue.getUploadUrl() + unit.getD3ModelUrl());
            }
            if(StringUtils.isNotBlank(unit.getD3ModelRecogUrl())){
                unit.setD3ModelRecogUrl(Configue.getUploadUrl() + unit.getD3ModelRecogUrl());
            }
            if(StringUtils.isNotBlank(unit.getD3ModelUrl())){
                unit.setD3ModelUrl(Configue.getUploadUrl() + unit.getD3ModelUrl());
            }

            ImageUtil.setImagePath(unit.getD3ImageList());

            model.addAttribute("unit", unit);
            d3ImageList = unit.getD3ImageList();
        }
        List<Direction> directionList = directionService.queryAll();
        List<Bedroom> bedroomList = bedroomService.queryAll();
        model.addAttribute("directionList", directionList);
        model.addAttribute("bedroomList", bedroomList);
        model.addAttribute("d3ImageList", JSONArray.fromObject(d3ImageList));
        model.addAttribute("houseId", houseId);
        return "house/house_unit_edit";
    }

    /**
     * 保存新增的楼盘户型
     * @param houseUnit
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result saveUnit(HouseUnit houseUnit, MultipartRequest multipartRequest, String d3ImageId) {

        Result result = houseUnitService.saveUnit(houseUnit, multipartRequest, d3ImageId);
        return result;
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(Long id) {

        HouseUnit hu = houseUnitService.queryByPK(id);
        if(hu != null){
            houseUnitService.delete(hu);
        }
        return new Result().success();
    }


}
