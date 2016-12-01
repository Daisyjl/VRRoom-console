package com.leoman.enterprise.service;

import com.leoman.common.service.GenericManager;
import com.leoman.enterprise.entity.EnterpriseSubLogin;

/**
 * Created by Daisy on 2016/10/12.
 */
public interface EnterpriseSubLoginService extends GenericManager<EnterpriseSubLogin> {

    public EnterpriseSubLogin findByEnterpriseSubId(Long enterpriseId);

}


