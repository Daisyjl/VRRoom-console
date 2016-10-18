package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.entity.Configue;
import com.leoman.entity.Constant;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseRidgepoleService;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.impl.HouseDynamicServiceImpl;
import com.leoman.label.entity.Label;
import com.leoman.label.service.LabelService;
import com.leoman.utils.DateUtils;
import com.leoman.utils.JsonUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
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

    /**
     * 跳转编辑楼层类型页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public String editAlbum(@PathVariable("id") Long id, Model model){
        House house = houseService.queryByPK(id);

        if(house.getImage() != null){
            house.getImage().setPath(Configue.getUploadUrl()+house.getImage().getPath());
            List<Label> labelList = labelService.findListByParams(house.getImage().getId(), 1);
            model.addAttribute("labelList", JSONArray.fromObject(labelList));
        }
        model.addAttribute("house", house);
        return "house/house_edit_ridgepole";
    }


}
