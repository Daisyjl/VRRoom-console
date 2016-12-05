package com.leoman.enterprise.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.entity.EnterpriseSub;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface EnterpriseSubService extends GenericManager<EnterpriseSub> {

    public Result save(EnterpriseSub enterpriseSub, String password);

    public Result deleteById(Long id);

}
