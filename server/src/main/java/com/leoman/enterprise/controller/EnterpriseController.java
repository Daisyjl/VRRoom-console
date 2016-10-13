package com.leoman.enterprise.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.entity.EnterpriseLogin;
import com.leoman.enterprise.service.EnterpriseLoginService;
import com.leoman.enterprise.service.EnterpriseService;
import com.leoman.enterprise.service.impl.EnterpriseServiceImpl;
import com.leoman.province.entity.Province;
import com.leoman.province.service.ProvinceService;
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

    @Autowired
    private ProvinceService provinceService;

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
        List<Province> provinceList = provinceService.iFindList();
        model.addAttribute("provinceList",provinceList);
        return "enterprise/enterprise_add";

    }

    /**
     * 保存
     * @param enterprise
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Enterprise enterprise, String password) {
        Result result = enterpriseService.save(enterprise, Md5Util.md5(password));
        return result;
    }

    /**
     * 删除
     * @param id
     * @param ids
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Integer del(Long id,String ids) {
        if (id==null && StringUtils.isBlank(ids)){
            return 1;
        }
        try {
            if(id!=null){
                enterpriseService.delete(enterpriseService.queryByPK(id));
            }else {
                Long[] ss = JsonUtil.json2Obj(ids,Long[].class);
                for (Long _id : ss) {
                    enterpriseService.delete(enterpriseService.queryByPK(_id));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }
        return 0;
    }


}
