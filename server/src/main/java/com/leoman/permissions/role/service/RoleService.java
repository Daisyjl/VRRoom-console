package com.leoman.permissions.role.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.permissions.role.entity.Role;

/**
 * Created by yesong on 2016/8/26.
 */
public interface RoleService extends GenericManager<Role>{

    public Result saveRole(Role role, String moduleIds);

//    public String findName(Long adminId);

}
