package com.leoman.feature.controller;

import com.leoman.feature.entity.Feature;
import com.leoman.feature.service.FeatureService;
import com.leoman.feature.service.impl.FeatureServiceImpl;
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
 * 系统设置-特色
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/feature")
public class FeatureController extends GenericEntityController<Feature,Feature,FeatureServiceImpl> {

    @Autowired
    private FeatureService featureService;

    @RequestMapping(value = "/index")
    public String index(){
        return "feature/feature_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(Feature.class, featureService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<Feature> page = featureService.queryPage(query);
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
            Feature feature = featureService.queryByPK(id);
            model.addAttribute("feature", feature);
        }
        return "feature/feature_add";
    }

    /**
     * 保存
     * @param feature
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Feature feature) {

        Result result = featureService.saveFeature(feature);
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
                featureService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
