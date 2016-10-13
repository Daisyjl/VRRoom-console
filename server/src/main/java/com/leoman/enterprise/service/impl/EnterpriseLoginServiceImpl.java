package com.leoman.enterprise.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.enterprise.dao.EnterpriseDao;
import com.leoman.enterprise.dao.EnterpriseLoginDao;
import com.leoman.enterprise.entity.EnterpriseLogin;
import com.leoman.enterprise.service.EnterpriseLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class EnterpriseLoginServiceImpl extends GenericManagerImpl<EnterpriseLogin,EnterpriseLoginDao> implements EnterpriseLoginService{

    @Autowired
    private EnterpriseLoginDao enterpriseLoginDao;

    @Override
    public EnterpriseLogin findByEnterpriseId(Long enterpriseId) {
        return enterpriseLoginDao.findByEnterpriseId(enterpriseId);
    }
}
