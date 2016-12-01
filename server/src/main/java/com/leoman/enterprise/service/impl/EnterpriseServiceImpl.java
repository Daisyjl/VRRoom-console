package com.leoman.enterprise.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.enterprise.dao.EnterpriseDao;
import com.leoman.enterprise.entity.Enterprise;
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

    /**
     * 保存
     * @param enterprise
     * @return
     */
    @Override
    @Transactional
    public Result saveEnterprise(Enterprise enterprise) {
        Long id = enterprise.getId();

        //新增
        if(id == null){
            Enterprise en1 = enterpriseDao.findByName(enterprise.getName());
            if(en1 != null){
                return new Result().failure(ErrorType.ERROR_CODE_0008);//企业名称已存在
            }
        }else{
            Enterprise en1 = enterpriseDao.findByNameAndId(enterprise.getName(), id);
            if(en1 != null){
                return new Result().failure(ErrorType.ERROR_CODE_0008);//企业名称已存在
            }
        }

        //简介
        String intro = enterprise.getIntro();
        if(StringUtils.isNotBlank(intro)){
            intro = intro.replace("&lt", "<").replace("&gt", ">");
            enterprise.setIntro(intro);
        }

        enterpriseDao.save(enterprise);

        return new Result().success();
    }
}
