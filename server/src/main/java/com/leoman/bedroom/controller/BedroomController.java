package com.leoman.bedroom.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.bedroom.entity.Bedroom;
import com.leoman.bedroom.service.BedroomService;
import com.leoman.bedroom.service.impl.BedroomServiceImpl;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 系统设置-居室
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/bedroom")
public class BedroomController extends GenericEntityController<Bedroom,Bedroom,BedroomServiceImpl> {

    @Autowired
    private BedroomService bedroomService;

    @RequestMapping(value = "/index")
    public String index(){
        return "bedroom/bedroom_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(Bedroom.class, bedroomService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<Bedroom> page = bedroomService.queryPage(query);
        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 编辑
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(Long id, Model model){

        if(id != null){
            Bedroom bedroom = bedroomService.queryByPK(id);
            model.addAttribute("bedroom", bedroom);
        }
        return "bedroom/bedroom_add";
    }

    /**
     * 保存
     * @param bedroom
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Bedroom bedroom) {

        Result result = bedroomService.saveBedroom(bedroom);
        return result;
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result del(String ids) {
        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                bedroomService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
