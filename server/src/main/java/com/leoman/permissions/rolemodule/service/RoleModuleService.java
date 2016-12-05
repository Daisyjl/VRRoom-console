package com.leoman.permissions.rolemodule.service;

import com.leoman.common.service.GenericManager;
import com.leoman.permissions.module.entity.Module;
import com.leoman.permissions.rolemodule.entity.RoleModule;

import java.util.List;

/**
 * Created by Administrator on 2016/8/30.
 */
public interface RoleModuleService extends GenericManager<RoleModule>{

    public void deleteByRoleId(Long roleId);

}
