package com.leoman.state.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.state.dao.StateDao;
import com.leoman.state.entity.State;
import com.leoman.state.service.StateService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class StateServiceImpl extends GenericManagerImpl<State,StateDao> implements StateService {

    @Autowired
    private StateDao stateDao;

    /**
     * 保存
     * @param state
     * @return
     */
    @Override
    @Transactional
    public Result saveState(State state){
        String content = state.getContent();
        if(StringUtils.isNotBlank(content)){
            content = content.replace("&lt", "<").replace("&gt", ">");
            state.setContent(content);
        }
        stateDao.save(state);
        return Result.success();
    }

}
