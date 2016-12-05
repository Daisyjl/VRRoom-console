package com.leoman.permissions.admin.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.permissions.admin.dao.AdminDao;
import com.leoman.permissions.admin.entity.Admin;
import com.leoman.permissions.admin.service.AdminService;
import com.leoman.utils.ClassUtil;
import com.leoman.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2016/3/8.
 */
@Service
public class AdminServiceImpl extends GenericManagerImpl<Admin, AdminDao> implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findByUsername(String username) {
        return adminDao.findByUsername(username);
    }


    @Override
    @Transactional
    public Result saveAdmin(Admin admin) {
        Long adminId = admin.getId();
        admin.setPassword(Md5Util.md5(admin.getPassword()));

        if(adminId == null){
            Admin a = adminDao.findByUsername(admin.getUsername());
            if(a != null){
                return Result.failure(ErrorType.ERROR_CODE_00023);//该管理员账号已存在
            }
            admin.setLastLoginDate(System.currentTimeMillis());
        }else{
            Admin a = adminDao.findByUsernameAndId(admin.getUsername(), adminId);
            if(a != null){
                return Result.failure(ErrorType.ERROR_CODE_00023);//该管理员账号已存在
            }
            Admin org = adminDao.findOne(adminId);
            ClassUtil.copyProperties(org, admin);
            admin = org;
        }

        adminDao.save(admin);

        return Result.success();
    }

    @Override
    @Transactional
    public Result updatePwd(Long adminId, String oldPwd, String newPwd) {
        Admin admin = adminDao.findOne(adminId);
        if(admin != null){
            if(!admin.getPassword().equals(Md5Util.md5(oldPwd))){
                return Result.failure(ErrorType.ERROR_CODE_0005);//旧密码错误
            }
            admin.setPassword(Md5Util.md5(newPwd));
        }
        return Result.success();
    }


}
