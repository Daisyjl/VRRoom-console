package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.entity.Configue;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.entity.HouseRidgepole;
import com.leoman.house.service.HouseRidgepoleService;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.impl.HouseDynamicServiceImpl;
import com.leoman.label.entity.Label;
import com.leoman.label.service.LabelService;
import com.leoman.utils.JsonUtil;
import net.sf.json.JSONArray;
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
 * 楼盘的每一栋
 * Created by Daisy on 2016/10/14.
 */
@Controller
@RequestMapping(value = "admin/house/ridgepole")
public class HouseRidgepoleController extends GenericEntityController<HouseDynamic,HouseDynamic,HouseDynamicServiceImpl> {

    @Autowired
    private HouseService houseService;

    @Autowired
    private LabelService labelService;

    @Autowired
    private HouseRidgepoleService houseRidgepoleService;

    /**
     * 跳转编辑楼盘的栋首页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model){
        House house = houseService.queryByPK(id);

        if(house.getImage() != null){
            house.getImage().setPath(Configue.getUploadUrl()+house.getImage().getPath());
            List<Label> labelList = labelService.findListByParams(house.getImage().getId());
            model.addAttribute("labelList", JSONArray.fromObject(labelList));
        }
        model.addAttribute("house", house);
        return "house/house_edit_ridgepole";
    }

    /**
     * 跳转至编辑楼盘的栋详情页
     * @param labelId
     * @param model
     * @return
     */
    @RequestMapping(value = "/editFloor/{houseId}_{labelId}")
    public String editFloor(@PathVariable("houseId") Long houseId,@PathVariable("labelId") String labelId, Model model){
        Label label = labelService.searchByLabelId(labelId);

        HouseRidgepole ridgepole = houseRidgepoleService.queryByPK(label.getRidgepoleId());

        model.addAttribute("label", label);
        model.addAttribute("houseId", houseId);
        model.addAttribute("ridgepole", ridgepole);
        return "house/house_edit_ridgepole_floor";
    }

    /**
     * 根据楼层类型分组，获取楼层列表
     * @param ridgepoleId
     * @return
     */
    @RequestMapping(value = "/floorList", method = RequestMethod.POST)
    @ResponseBody
    public List<Map> floorList(Long ridgepoleId) throws Exception{

        List<Map> result = houseRidgepoleService.findByGroupFloorType(ridgepoleId);
        return result;
    }

    /**
     * 保存
     * @param data
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(String data) {

        Map map = JsonUtil.json2Obj(data, Map.class);
        houseRidgepoleService.saveRidgepole(map);

        return Result.success();
    }


}
