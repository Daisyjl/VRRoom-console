package com.leoman.user.controller;

import com.leoman.bus.entity.RouteOrder;
import com.leoman.bus.service.RouteOrderService;
import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.entity.Constant;
import com.leoman.permissions.admin.entity.Admin;
import com.leoman.enterprise.service.EnterpriseService;
import com.leoman.user.entity.UserInfo;
import com.leoman.user.service.CouponOrderService;
import com.leoman.user.service.UserCouponService;
import com.leoman.user.service.UserService;
import com.leoman.user.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 会员
 * Created by 史龙 on 2016/6/14 0014.
 */
@Controller
@RequestMapping(value = "admin/user")
public class UserController extends GenericEntityController<UserInfo, UserInfo, UserServiceImpl> {

    @Autowired
    private UserService userService;
    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private RouteOrderService routeOrderService;
    @Autowired
    private UserCouponService userCouponService;
    @Autowired
    private CouponOrderService couponOrderService;

    @RequestMapping(value = "/index")
    public String index(Model model,HttpServletRequest request){
        UserInfo userInfo = this.getUser(request);
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("enterprise",enterpriseService.queryByProperty("type",0));
        return "user/list";
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
    public Map<String, Object> list(Integer draw, Integer start, Integer length,UserInfo userInfo,Long enterpriseId) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(UserInfo.class, userService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        query.like("mobile",userInfo.getMobile());
        query.eq("enterprise.id",enterpriseId);
        query.eq("type",userInfo.getType());
        Page<UserInfo> page = userService.queryPage(query);
        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 跳转新增页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(Long id, Model model,HttpServletRequest request){
//        if(id != null){
//            model.addAttribute("user",userService.queryByPK(id));
//        }
        UserInfo userInfo = this.getUser(request);
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("enterprise",enterpriseService.queryByProperty("type",0));
        return "user/add";
    }


    /**
     * 保存
     * @param userInfo
     * @param id
     * @param ep
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Integer save(UserInfo userInfo, Long id,Long ep, @RequestParam(value = "password",required = false) String password) {
        try{
            return userService.save(userInfo,id,ep,password);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 详情页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail")
    public String detail(Long id,Model model){
        UserInfo userInfo = userService.queryByPK(id);
        model.addAttribute("userInfo",userInfo);

        List<RouteOrder> routeOrders = routeOrderService.findList(id);
        model.addAttribute("routeOrders",routeOrders);

        return "user/detail";
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
        return userService.del(id,ids);
    }

    @RequestMapping(value = "/departure",method = RequestMethod.POST)
    @ResponseBody
    public Integer departure(Long id){
        if(id==null) return 1;

        try{

            UserInfo userInfo = userService.queryByPK(id);
            if(userInfo.getType()==1){
                userInfo.setType(2);
                userInfo.setEnterprise(null);
                userService.save(userInfo);
            }else {
                return 2;
            }

        }catch (Exception e){
            e.printStackTrace();
            return 1;
        }
        return 0;

    }


    @RequestMapping(value = "/enterpriseSave")
    @ResponseBody
    public Result enterpriseSave(Long id,Long enterpriseId){
        try{
            UserInfo userInfo = userService.queryByPK(id);
            if(userInfo.getType()==2){
                userInfo.setEnterprise(enterpriseService.queryByPK(enterpriseId));
                userInfo.setType(1);
                userService.save(userInfo);
            }else {
                return Result.failure();
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.failure();
        }
        return Result.success();
    }

    public UserInfo getUser(HttpServletRequest request){
        Admin admin = (Admin) request.getSession().getAttribute(Constant.SESSION_MEMBER_GLOBLE);
        return userService.findByMobile(admin.getMobile());
    }

}
