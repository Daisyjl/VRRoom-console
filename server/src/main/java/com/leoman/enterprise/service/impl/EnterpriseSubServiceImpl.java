package com.leoman.enterprise.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.enterprise.dao.EnterpriseSubDao;
import com.leoman.enterprise.dao.EnterpriseSubLoginDao;
import com.leoman.enterprise.entity.EnterpriseSub;
import com.leoman.enterprise.entity.EnterpriseSubLogin;
import com.leoman.enterprise.service.EnterpriseSubService;
import com.leoman.utils.ClassUtil;
import com.leoman.utils.HttpRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class EnterpriseSubServiceImpl extends GenericManagerImpl<EnterpriseSub,EnterpriseSubDao> implements EnterpriseSubService{

    @Autowired
    private EnterpriseSubDao enterpriseSubDao;

    @Autowired
    private EnterpriseSubLoginDao enterpriseSubLoginDao;

    /**
     * 保存
     * @param enterpriseSub
     * @param password
     * @return
     */
    @Override
    @Transactional
    public Result save(EnterpriseSub enterpriseSub, String password) {
        Long id = enterpriseSub.getId();

        EnterpriseSubLogin enterpriseSubLogin;

        //新增
        if(id == null){
            EnterpriseSub es = enterpriseSubDao.findByEnterpriseAndCity(enterpriseSub.getEnterpriseId(), enterpriseSub.getCity().getId());
            if(es != null){
                return new Result().failure(ErrorType.ERROR_CODE_0009);//该企业账号已存在
            }
            enterpriseSubLogin = new EnterpriseSubLogin();
        }else{
            EnterpriseSub es = enterpriseSubDao.findByEnterpriseAndCityAndId(enterpriseSub.getEnterpriseId(), enterpriseSub.getCity().getId(), id);
            if(es != null){
                return new Result().failure(ErrorType.ERROR_CODE_0009);//该企业账号已存在
            }
            EnterpriseSub org = enterpriseSubDao.findOne(id);
            ClassUtil.copyProperties(org,enterpriseSub);
            enterpriseSub = org;

            //获取对应的企业账号登录
            enterpriseSubLogin = enterpriseSubLoginDao.findByEnterpriseSubId(id);
        }

        enterpriseSubDao.save(enterpriseSub);

        //保存企业登录
        if(enterpriseSubLogin != null){
            enterpriseSubLogin.setEnterpriseSubId(enterpriseSub.getId());
            enterpriseSubLogin.setUsername(enterpriseSub.getUsername());
            enterpriseSubLogin.setPassword(password);
            enterpriseSubLoginDao.save(enterpriseSubLogin);
        }

        return new Result().success();
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    @Transactional
    public Result deleteById(Long id){
        if(id != null){
            EnterpriseSub enterpriseSub = enterpriseSubDao.findOne(id);
            if(enterpriseSub != null){
                enterpriseSubDao.delete(enterpriseSub);
            }
            EnterpriseSubLogin enterpriseSubLogin = enterpriseSubLoginDao.findByEnterpriseSubId(id);
            if(enterpriseSubLogin != null){
                enterpriseSubLoginDao.delete(enterpriseSubLogin);
            }
        }
        return Result.success();
    }

}
