package com.leoman.state.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.state.entity.State;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface StateService extends GenericManager<State> {

    public Result saveState(State State);

}
