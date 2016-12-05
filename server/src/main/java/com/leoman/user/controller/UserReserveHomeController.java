package com.leoman.user.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.house.entity.House;
import com.leoman.user.entity.UserReserveHome;
import com.leoman.user.service.UserReserveHomeService;
import com.leoman.user.service.impl.UserReserveHomeServiceImpl;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 预约管理(在家看房预约)
 * Created by Daisy on 2016/10/11.
 */
@Controller
@RequestMapping(value = "admin/user/reserve")
public class UserReserveHomeController extends GenericEntityController<UserReserveHome,UserReserveHome,UserReserveHomeServiceImpl> {

    @Autowired
    private UserReserveHomeService userReserveHomeService;

    @RequestMapping(value = "/index")
    public String index(){
        return "user/reserve_list";
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
    public Map<String, Object> list(String searchContent, String startDate, String endDate, Integer draw, Integer start, Integer length) throws ParseException {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(UserReserveHome.class, userReserveHomeService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        List<String> propertyName = Arrays.asList(new String[]{"user.nickname", "user.mobile", "house.name"});
        query.orLike(propertyName, searchContent);
        query.addOrder("id", "desc");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if(StringUtils.isNotBlank(startDate)){
            query.ge("createDate", format.parse(startDate).getTime());
        }
        if(StringUtils.isNotBlank(endDate)){
            query.le("endDate", format.parse(endDate).getTime());
        }
        Page<UserReserveHome> page = userReserveHomeService.queryPage(query);
        return DataTableFactory.fitting(draw, page);
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
                userReserveHomeService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
