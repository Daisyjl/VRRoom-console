package com.leoman.decorateType.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.decorateType.entity.DecorateType;
import com.leoman.decorateType.service.DecorateTypeService;
import com.leoman.decorateType.service.impl.DecorateTypeServiceImpl;
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
 * 系统设置-装修类型
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/decorateType")
public class DecorateTypeController extends GenericEntityController<DecorateType,DecorateType,DecorateTypeServiceImpl> {

    @Autowired
    private DecorateTypeService decorateTypeService;

    @RequestMapping(value = "/index")
    public String index(){
        return "decorateType/decorateType_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(DecorateType.class, decorateTypeService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<DecorateType> page = decorateTypeService.queryPage(query);
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
            DecorateType decorateType = decorateTypeService.queryByPK(id);
            model.addAttribute("decorateType", decorateType);
        }
        return "decorateType/decorateType_add";
    }

    /**
     * 保存
     * @param decorateType
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(DecorateType decorateType) {

        Result result = decorateTypeService.saveDecorateType(decorateType);
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
                decorateTypeService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
