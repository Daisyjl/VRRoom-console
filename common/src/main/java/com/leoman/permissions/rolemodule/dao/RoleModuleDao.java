package com.leoman.permissions.rolemodule.dao;

import com.leoman.common.core.bean.Role;
import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.permissions.rolemodule.entity.RoleModule;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by yesong on 2016/8/30.
 */
public interface RoleModuleDao extends IBaseJpaRepository<RoleModule>{


    @Transactional
    @Modifying
    @Query("delete from RoleModule a where a.roleId = ?1")
    public void deleteByRoleId(Long roleId);

    @Query("select a from RoleModule a where a.roleId = ?1")
    public List<RoleModule> findByRoleId(Long roleId);
}
