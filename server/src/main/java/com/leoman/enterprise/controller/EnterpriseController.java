package com.leoman.enterprise.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.service.EnterpriseService;
import com.leoman.enterprise.service.impl.EnterpriseServiceImpl;
import com.leoman.area.province.entity.Province;
import com.leoman.area.province.service.ProvinceService;
import com.leoman.utils.JsonUtil;
import com.leoman.utils.Md5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 企业管理
 * Created by Daisy on 2016/10/11.
 */
@Controller
@RequestMapping(value = "admin/enterprise")
public class EnterpriseController extends GenericEntityController<Enterprise,Enterprise,EnterpriseServiceImpl> {

    @Autowired
    private EnterpriseService enterpriseService;

    @RequestMapping(value = "/index")
    public String index(){
        return "enterprise/enterprise_list";
    }

    /**
     * 列表
     * @param draw
     * @param start
     * @param length
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(Enterprise.class, enterpriseService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        query.addOrder("id", "desc");
        Page<Enterprise> page = enterpriseService.queryPage(query);
        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 跳转新增页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(Long id, Model model){
        if(id != null){
            Enterprise enterprise = enterpriseService.queryByPK(id);
            model.addAttribute("enterprise", enterprise);
        }
        return "enterprise/enterprise_add";

    }

    /**
     * 保存
     * @param enterprise
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Enterprise enterprise) {
        Result result = enterpriseService.saveEnterprise(enterprise);
        return result;
    }

    /**
     * 删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Result del(String ids) {
        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                enterpriseService.deleteByPK(Long.valueOf(id));
            }
        }
        return Result.success();
    }

}
