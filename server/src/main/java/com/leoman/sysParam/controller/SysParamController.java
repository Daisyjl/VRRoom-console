package com.leoman.sysParam.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.sysParam.entity.SysParam;
import com.leoman.sysParam.service.SysParamService;
import com.leoman.sysParam.service.impl.SysParamServiceImpl;
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
 * 系统设置-系统参数
 * Created by Daisy on 2016/12/8.
 */
@Controller
@RequestMapping(value = "admin/sysParam")
public class SysParamController extends GenericEntityController<SysParam,SysParam,SysParamServiceImpl> {

    @Autowired
    private SysParamService sysParamService;

    @RequestMapping(value = "/index")
    public String index(){
        return "sysParam/sysParam_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(SysParam.class, sysParamService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<SysParam> page = sysParamService.queryPage(query);
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
            SysParam sysParam = sysParamService.queryByPK(id);
            model.addAttribute("sysParam", sysParam);
        }
        return "sysParam/sysParam_add";
    }

    /**
     * 保存
     * @param sysParam
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(SysParam sysParam) {

        Result result = sysParamService.saveSysParam(sysParam);
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
                sysParamService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
