package com.leoman.enterprise.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.enterprise.entity.Enterprise;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface EnterpriseService extends GenericManager<Enterprise> {

    public Result saveEnterprise(Enterprise enterprise);

}
