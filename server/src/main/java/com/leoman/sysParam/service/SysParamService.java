package com.leoman.sysParam.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.sysParam.entity.SysParam;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface SysParamService extends GenericManager<SysParam> {

    public Result saveSysParam(SysParam sysParam);
}
