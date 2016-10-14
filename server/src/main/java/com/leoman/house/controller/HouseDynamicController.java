package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.service.HouseAlbumImageService;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.impl.HouseDynamicServiceImpl;
import com.leoman.house.service.impl.HouseServiceImpl;
import com.leoman.utils.DateUtils;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

/**
 * 楼层动态管理
 * Created by Daisy on 2016/10/14.
 */
@Controller
@RequestMapping(value = "admin/house/dynamic")
public class HouseDynamicController extends GenericEntityController<HouseDynamic,HouseDynamic,HouseDynamicServiceImpl> {

    @Autowired
    private HouseDynamicService houseDynamicService;

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(String title, Long houseId,String startDate, String endDate, Integer draw, Integer start, Integer length) throws ParseException {
        int pageNum = getPageNum(start, length);
        Query query = Query.forClass(HouseDynamic.class, houseDynamicService);
        query.setPagenum(pageNum);
        query.setPagesize(length);
        query.like("title",title);
        query.eq("houseId",houseId);

        if(StringUtils.isNotBlank(startDate)){
            Date startTime = DateUtils.stringToDate(startDate,"yyyy-MM-dd HH:mm");
            query.ge("createDate",startTime.getTime());
        }
        if(StringUtils.isNotBlank(endDate)){
            Date endTime = DateUtils.stringToDate(endDate,"yyyy-MM-dd HH:mm");
            query.le("createDate",endTime.getTime());
        }

        query.addOrder("id","desc");
        Page<HouseDynamic> page = houseDynamicService.queryPage(query);
        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 保存新增的楼盘动态
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(HouseDynamic houseDynamic) {

        houseDynamicService.save(houseDynamic);
        return Result.success();
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(String ids) {

        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                houseDynamicService.deleteByPK(Long.valueOf(id));
            }
        }

        return new Result().success();
    }


}
