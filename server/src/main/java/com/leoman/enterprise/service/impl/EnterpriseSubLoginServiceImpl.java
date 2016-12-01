package com.leoman.enterprise.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.enterprise.dao.EnterpriseDao;
import com.leoman.enterprise.dao.EnterpriseSubLoginDao;
import com.leoman.enterprise.entity.EnterpriseSubLogin;
import com.leoman.enterprise.service.EnterpriseSubLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class EnterpriseSubLoginServiceImpl extends GenericManagerImpl<EnterpriseSubLogin,EnterpriseSubLoginDao> implements EnterpriseSubLoginService{

    @Autowired
    private EnterpriseSubLoginDao enterpriseLoginDao;

    @Override
    public EnterpriseSubLogin findByEnterpriseSubId(Long enterpriseId) {
        return enterpriseLoginDao.findByEnterpriseSubId(enterpriseId);
    }

}
