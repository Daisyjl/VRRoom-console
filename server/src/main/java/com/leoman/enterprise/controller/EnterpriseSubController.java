package com.leoman.enterprise.controller;

import com.leoman.area.province.entity.Province;
import com.leoman.area.province.service.ProvinceService;
import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.entity.EnterpriseSub;
import com.leoman.enterprise.service.EnterpriseService;
import com.leoman.enterprise.service.EnterpriseSubService;
import com.leoman.enterprise.service.impl.EnterpriseServiceImpl;
import com.leoman.enterprise.service.impl.EnterpriseSubLoginServiceImpl;
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
 * 企业账号管理
 * Created by Daisy on 2016/10/11.
 */
@Controller
@RequestMapping(value = "admin/enterprise/sub")
public class EnterpriseSubController extends GenericEntityController<EnterpriseSub,EnterpriseSub,EnterpriseSubLoginServiceImpl> {

    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private EnterpriseSubService enterpriseSubService;

    @Autowired
    private ProvinceService provinceService;

    @RequestMapping(value = "/index")
    public String index(){
        return "enterprise/enterprise_sub_list";
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
        Query query = Query.forClass(EnterpriseSub.class, enterpriseSubService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        query.addOrder("id", "desc");
        Page<EnterpriseSub> page = enterpriseSubService.queryPage(query);
        for (EnterpriseSub es:page.getContent()) {
            Enterprise enterprise = enterpriseService.queryByPK(es.getEnterpriseId());
            es.setEnterprise(enterprise);
        }

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
            EnterpriseSub enterpriseSub = enterpriseSubService.queryByPK(id);
            model.addAttribute("enterpriseSub", enterpriseSub);
        }
        List<Province> provinceList = provinceService.iFindList();
        List<Enterprise> enterpriseList = enterpriseService.queryAll();
        model.addAttribute("provinceList",provinceList);
        model.addAttribute("enterpriseList",enterpriseList);
        return "enterprise/enterprise_sub_add";

    }

    /**
     * 保存
     * @param enterpriseSub
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(EnterpriseSub enterpriseSub, String password) {
        Result result = enterpriseSubService.save(enterpriseSub, Md5Util.md5(password));
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
                enterpriseSubService.deleteById(Long.valueOf(id));
            }
        }
        return Result.success();
    }

}
