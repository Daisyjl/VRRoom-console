package com.leoman.enterprise.service;

import com.leoman.common.service.GenericManager;
import com.leoman.enterprise.entity.EnterpriseLogin;

/**
 * Created by Daisy on 2016/10/12.
 */
public interface EnterpriseLoginService extends GenericManager<EnterpriseLogin> {

    public EnterpriseLogin findByEnterpriseId(Long enterpriseId);

}


