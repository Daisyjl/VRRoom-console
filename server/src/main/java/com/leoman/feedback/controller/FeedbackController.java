package com.leoman.feedback.controller;

import com.leoman.feedback.entity.Feedback;
import com.leoman.feedback.service.FeedbackService;
import com.leoman.feedback.service.impl.FeedbackServiceImpl;
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
 * 系统设置-居室
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/feedback")
public class FeedbackController extends GenericEntityController<Feedback,Feedback,FeedbackServiceImpl> {

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value = "/index")
    public String index(){
        return "feedback/feedback_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(Feedback.class, feedbackService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<Feedback> page = feedbackService.queryPage(query);
        return DataTableFactory.fitting(draw, page);
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
                feedbackService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
