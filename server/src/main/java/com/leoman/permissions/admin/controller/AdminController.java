package com.leoman.permissions.admin.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.entity.Constant;
import com.leoman.permissions.admin.entity.Admin;
import com.leoman.permissions.admin.service.AdminService;
import com.leoman.permissions.admin.service.impl.AdminServiceImpl;
import com.leoman.permissions.role.entity.Role;
import com.leoman.permissions.role.service.RoleService;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/7/5 0005.
 */
@Controller
@RequestMapping(value = "/admin/admin")
public class AdminController extends GenericEntityController<Admin, Admin, AdminServiceImpl> {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RoleService roleService;

    /**
     * 列表页面
     */
    @RequestMapping(value = "/index")
    public String index(Model model,HttpServletRequest request) {
        Admin admin = adminService.findByUsername("admin");
        model.addAttribute("admin", admin);
        return "permissions/admin/list";
    }

    /**
     * 列表
     * @param username
     * @param draw
     * @param start
     * @param length
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(String username, Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);

        Query query = Query.forClass(Admin.class, adminService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        query.like("username", username);
        Page<Admin> page = adminService.queryPage(query);

        List<Admin> list = page.getContent();
        for(Admin admin : list){
            Role role = roleService.queryByPK(admin.getRoleId());
            admin.setRole(role);
        }
        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 编辑
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Long id, Model model,HttpServletRequest request) {
        if (id != null) {
            Admin admin = adminService.queryByPK(id);
            model.addAttribute("admin", admin);
        }
        //角色表
        model.addAttribute("roleList",roleService.queryAll());
        return "permissions/admin/add";
    }

    /**
     * 保存
     * @param admin
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Admin admin) {
        Result result = adminService.saveAdmin(admin);
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
                adminService.deleteByPK(Long.valueOf(id));
            }
        }
        return new Result().success();
    }

    /**
     * 修改密码
     * @param request
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
    @ResponseBody
    public Result updatePwd(HttpServletRequest request, String oldPwd, String newPwd) {

        Admin admin = getAdmin(request);
        Result result = adminService.updatePwd(admin.getId(), oldPwd, newPwd);
        return result;
    }

    public Admin getAdmin(HttpServletRequest request){
        Admin admin = (Admin) request.getSession().getAttribute(Constant.SESSION_MEMBER_GLOBLE);
        return admin;
    }

}
