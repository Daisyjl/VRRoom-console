package com.leoman.sysParam.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.sysParam.dao.SysParamDao;
import com.leoman.sysParam.entity.SysParam;
import com.leoman.sysParam.service.SysParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class SysParamServiceImpl extends GenericManagerImpl<SysParam,SysParamDao> implements SysParamService {

    @Autowired
    private SysParamDao sysParamDao;

    /**
     * 保存
     * @param sysParam
     * @return
     */
    @Override
    @Transactional
    public Result saveSysParam(SysParam sysParam){

        sysParamDao.save(sysParam);

        return Result.success();
    }

}
