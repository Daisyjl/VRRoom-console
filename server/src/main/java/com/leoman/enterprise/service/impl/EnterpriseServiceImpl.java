package com.leoman.enterprise.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.enterprise.dao.EnterpriseDao;
import com.leoman.enterprise.dao.EnterpriseLoginDao;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.entity.EnterpriseLogin;
import com.leoman.enterprise.service.EnterpriseService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class EnterpriseServiceImpl extends GenericManagerImpl<Enterprise,EnterpriseDao> implements EnterpriseService{

    @Autowired
    private EnterpriseDao enterpriseDao;

    @Autowired
    private EnterpriseLoginDao enterpriseLoginDao;

    /**
     * 保存
     * @param enterprise
     * @param password
     * @return
     */
    @Override
    @Transactional
    public Result save(Enterprise enterprise, String password) {
        Long id = enterprise.getId();

        EnterpriseLogin enterpriseLogin;

        //新增
        if(id == null){
            Enterprise en1 = enterpriseDao.findByName(enterprise.getName());
            if(en1 != null){
                return new Result().failure(ErrorType.ERROR_CODE_0008);//企业名称已存在
            }

            Enterprise en2 = enterpriseDao.findByUserName(enterprise.getUsername());
            if(en2 != null){
                return new Result().failure(ErrorType.ERROR_CODE_0009);//企业账号已存在
            }

            enterpriseLogin = new EnterpriseLogin();
        }else{
            Enterprise en1 = enterpriseDao.findByNameAndId(enterprise.getName(), id);
            if(en1 != null){
                return new Result().failure(ErrorType.ERROR_CODE_0008);//企业名称已存在
            }

            Enterprise en2 = enterpriseDao.findByUserNameAndId(enterprise.getUsername(), id);
            if(en2 != null){
                return new Result().failure(ErrorType.ERROR_CODE_0009);//企业账号已存在
            }
            enterpriseLogin = enterpriseLoginDao.findByEnterpriseId(enterprise.getId());
        }

        //保存企业
        if(enterprise.getCity().getId() == null){
            enterprise.setCity(null);
        }

        String intro = enterprise.getIntro();
        if(StringUtils.isNotBlank(intro)){
            intro = intro.replace("&lt", "<").replace("&gt", ">");
            enterprise.setIntro(intro);
        }

        enterpriseDao.save(enterprise);

        //保存企业登录
        if(enterpriseLogin != null){
            enterpriseLogin.setEnterprise(enterprise);
            enterpriseLogin.setUsername(enterprise.getUsername());
            enterpriseLogin.setPassword(password);
            enterpriseLoginDao.save(enterpriseLogin);
        }

        return new Result().success();
    }
}
