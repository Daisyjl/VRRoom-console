package com.leoman.areaRange.controller;

import com.leoman.areaRange.entity.AreaRange;
import com.leoman.areaRange.service.AreaRangeService;
import com.leoman.areaRange.service.impl.AreaRangeServiceImpl;
import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
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
 * 系统设置-面积范围
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/areaRange")
public class AreaRangeController extends GenericEntityController<AreaRange,AreaRange,AreaRangeServiceImpl> {

    @Autowired
    private AreaRangeService areaRangeService;

    @RequestMapping(value = "/index")
    public String index(){
        return "areaRange/areaRange_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(AreaRange.class, areaRangeService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<AreaRange> page = areaRangeService.queryPage(query);
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
            AreaRange areaRange = areaRangeService.queryByPK(id);
            model.addAttribute("areaRange", areaRange);
        }
        return "areaRange/areaRange_add";
    }

    /**
     * 保存
     * @param areaRange
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(AreaRange areaRange) {

        Result result = areaRangeService.saveAreaRange(areaRange);
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
                areaRangeService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
