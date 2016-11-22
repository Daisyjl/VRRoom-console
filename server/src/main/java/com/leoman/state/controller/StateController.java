package com.leoman.state.controller;

import com.leoman.state.entity.State;
import com.leoman.state.service.StateService;
import com.leoman.state.service.impl.StateServiceImpl;
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
 * 系统设置-文案编辑
 * Created by Daisy on 2016/11/8.
 */
@Controller
@RequestMapping(value = "admin/state")
public class StateController extends GenericEntityController<State,State,StateServiceImpl> {

    @Autowired
    private StateService stateService;

    @RequestMapping(value = "/index")
    public String index(){
        return "state/state_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(State.class, stateService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<State> page = stateService.queryPage(query);
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
            State state = stateService.queryByPK(id);
            model.addAttribute("state", state);
        }
        return "state/state_edit";
    }

    /**
     * 保存
     * @param state
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(State state) {

        Result result = stateService.saveState(state);
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
                stateService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
