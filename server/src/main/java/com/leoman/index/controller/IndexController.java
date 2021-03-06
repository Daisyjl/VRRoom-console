package com.leoman.index.controller;


import com.leoman.common.controller.common.CommonController;
import com.leoman.common.core.ErrorType;
import com.leoman.common.log.entity.Log;
import com.leoman.entity.Constant;
import com.leoman.index.service.LoginService;
import com.leoman.permissions.admin.entity.Admin;
import com.leoman.permissions.module.entity.Module;
import com.leoman.permissions.module.service.ModuleService;
import com.leoman.utils.CookiesUtils;
import com.leoman.utils.Md5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by wangbin on 2015/7/29.
 */
@Controller
@RequestMapping(value = "admin")
public class IndexController extends CommonController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private ModuleService moduleService;

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request,
                        HttpServletResponse response,
                        String error,
                        ModelMap model) {
        try {
            if (StringUtils.isNotBlank(error)) {
                model.addAttribute("error", ErrorType.ERROR_CODE_0007.getName());
            }
            // 先读取cookies，如果存在，则将用户名回写到输入框
            Map<String, Object> params = CookiesUtils.ReadCookieMap(request);
            if (params != null && params.size() != 0) {
                String username = (String) params.get("username");
                model.put("username", username);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "login";
    }

    @Log(message = "{0}登录了系统")
    @RequestMapping(value = "/login/check")
    public String checkLogin(String username,
                             String password,
                             HttpServletRequest request,
                             HttpServletResponse response,
                             String remark,
                             ModelMap model) {
        response.setCharacterEncoding("UTF-8");
        Boolean success = loginService.login(request, username, Md5Util.md5(password), Constant.MEMBER_TYPE_GLOBLE,remark);
        if (success) {
            // 登录成功后，将用户名放入cookies
            int loginMaxAge = 30 * 24 * 60 * 60; // 定义cookies的生命周期，这里是一个月。单位为秒
            CookiesUtils.addCookie(response, "username", username, loginMaxAge);

            return "redirect:/admin/dashboard";
        }
        model.addAttribute("error", ErrorType.ERROR_CODE_0007.getCode());
        return "redirect:/admin/login";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request,
                         HttpServletResponse response,
                         ModelMap model) {
        loginService.logOut(request, Constant.MEMBER_TYPE_GLOBLE);
        return "login";
    }

    @RequestMapping(value = "/")
    public String index() {
        return "redirect:/admin/dashboard";
    }


    @RequestMapping(value = "/dashboard")
    public String dashboard(HttpServletRequest request,
                            HttpServletResponse response,
                            ModelMap model) {

        Admin admin = (Admin) request.getSession().getAttribute(Constant.SESSION_MEMBER_GLOBLE);
        List<Module> list = moduleService.findListByRoleId(admin.getRoleId());
        request.getSession().setAttribute("moduleList", list);
        return "index";
    }

}
