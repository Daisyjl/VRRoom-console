package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.entity.Configue;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.HouseUnitService;
import com.leoman.house.service.impl.HouseServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import java.util.List;

/**
 * 楼层户型管理
 * Created by Daisy on 2016/10/13.
 */
@Controller
@RequestMapping(value = "admin/house/unit")
public class HouseUnitController extends GenericEntityController<House,House,HouseServiceImpl> {

    @Autowired
    private HouseService houseService;

    @Autowired
    private HouseUnitService houseUnitService;

    /**
     * 跳转编辑楼盘户型页面
     * @param houseId
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{houseId}")
    public String index(@PathVariable("houseId") Long houseId, Model model){
        model.addAttribute("houseId", houseId);
        return "house/house_edit_unit";
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
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Result detail(@PathVariable("id") Long id, Model model){
        HouseUnit unit = houseUnitService.queryByPK(id);
        if(StringUtils.isNotBlank(unit.getD3ModelRecogUrl())){
            unit.setD3ModelRecogUrl(Configue.getUploadUrl() + unit.getD3ModelRecogUrl());
        }
        if(StringUtils.isNotBlank(unit.getD3ModelUrl())){
            unit.setD3ModelUrl(Configue.getUploadUrl() + unit.getD3ModelUrl());
        }
        return new Result().success(unit);
    }

    /**
     * 保存新增的楼盘户型
     * @param houseUnit
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result saveUnit(HouseUnit houseUnit, MultipartRequest multipartRequest) {

        Result result = houseUnitService.saveUnit(houseUnit, multipartRequest);
        return result;
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(Long id) {

        /*String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                houseUnitService.deleteByPK(Long.valueOf(id));
            }
        }*/
        HouseUnit hu = houseUnitService.queryByPK(id);
        if(hu != null){
            houseUnitService.delete(hu);
        }
        return new Result().success();
    }


}
