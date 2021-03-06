package com.leoman.priceRange.controller;

import com.leoman.priceRange.entity.PriceRange;
import com.leoman.priceRange.service.PriceRangeService;
import com.leoman.priceRange.service.impl.PriceRangeServiceImpl;
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
@RequestMapping(value = "admin/priceRange")
public class PriceRangeController extends GenericEntityController<PriceRange,PriceRange,PriceRangeServiceImpl> {

    @Autowired
    private PriceRangeService priceRangeService;

    @RequestMapping(value = "/index")
    public String index(){
        return "priceRange/priceRange_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(PriceRange.class, priceRangeService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<PriceRange> page = priceRangeService.queryPage(query);
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
            PriceRange priceRange = priceRangeService.queryByPK(id);
            model.addAttribute("priceRange", priceRange);
        }
        return "priceRange/priceRange_add";
    }

    /**
     * 保存
     * @param priceRange
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(PriceRange priceRange) {

        Result result = priceRangeService.savePriceRange(priceRange);
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
                priceRangeService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
