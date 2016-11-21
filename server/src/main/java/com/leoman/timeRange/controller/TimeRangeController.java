package com.leoman.timeRange.controller;

import com.leoman.timeRange.entity.TimeRange;
import com.leoman.timeRange.service.TimeRangeService;
import com.leoman.timeRange.service.impl.TimeRangeServiceImpl;
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
 * 系统设置-时间范围
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/timeRange")
public class TimeRangeController extends GenericEntityController<TimeRange,TimeRange,TimeRangeServiceImpl> {

    @Autowired
    private TimeRangeService timeRangeService;

    @RequestMapping(value = "/index")
    public String index(){
        return "timeRange/timeRange_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(TimeRange.class, timeRangeService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<TimeRange> page = timeRangeService.queryPage(query);
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
            TimeRange timeRange = timeRangeService.queryByPK(id);
            model.addAttribute("timeRange", timeRange);
        }
        return "timeRange/timeRange_add";
    }

    /**
     * 保存
     * @param timeRange
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(TimeRange timeRange) {

        Result result = timeRangeService.saveTimeRange(timeRange);
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
                timeRangeService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
