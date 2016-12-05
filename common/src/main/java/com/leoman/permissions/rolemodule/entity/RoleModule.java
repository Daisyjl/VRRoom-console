package com.leoman.permissions.rolemodule.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.permissions.module.entity.Module;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by Administrator on 2016/8/30.
 */
@Entity
@Table(name = "t_role_module")
public class RoleModule extends BaseEntity{

    @Column(name = "role_id")
    private Long roleId;

    @Column(name = "module_id")
    private Long moduleId;

    @Transient
    private Module module;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getModuleId() {
        return moduleId;
    }

    public void setModuleId(Long moduleId) {
        this.moduleId = moduleId;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }
}
