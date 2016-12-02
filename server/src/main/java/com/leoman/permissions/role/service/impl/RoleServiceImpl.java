package com.leoman.permissions.role.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.permissions.role.dao.RoleDao;
import com.leoman.permissions.role.entity.Role;
import com.leoman.permissions.role.service.RoleService;
import com.leoman.permissions.rolemodule.dao.RoleModuleDao;
import com.leoman.permissions.rolemodule.entity.RoleModule;
import com.leoman.permissions.rolemodule.service.RoleModuleService;
import com.leoman.utils.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yesong on 2016/8/26.
 */
@Service
public class RoleServiceImpl extends GenericManagerImpl<Role,RoleDao> implements RoleService{

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private RoleModuleDao roleModuleDao;

    @Transactional
    @Override
    public Result saveRole(Role role, String moduleIds) {
        Long roleId = role.getId();

        if(roleId == null){
            Role r = roleDao.findName(role.getName());
            if(r != null){
                return Result.failure(ErrorType.ERROR_CODE_00022);//该角色已存在
            }
        }else{
            Role r = roleDao.findNameAndId(role.getName(), roleId);
            if(r != null){
                return Result.failure(ErrorType.ERROR_CODE_00022);//该角色已存在
            }
            Role org = roleDao.findOne(roleId);
            ClassUtil.copyProperties(org, role);
            role = org;

            //删除已存在的角色模块
            List<RoleModule> rmList = roleModuleDao.findByRoleId(roleId);
            for (RoleModule rm:rmList) {
                roleModuleDao.delete(rm);
            }
        }

        if(!StringUtils.isEmpty(moduleIds)){
            String [] moduleArr = moduleIds.split("\\,");
            for (String moduleId : moduleArr) {
                RoleModule roleModule = new RoleModule();
                roleModule.setModuleId(Long.parseLong(moduleId));
                roleModule.setRoleId(role.getId());
                roleModuleDao.save(roleModule);
            }

        }

        return Result.success();
    }

}
