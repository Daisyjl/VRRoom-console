package com.leoman.permissions.role.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.permissions.role.entity.Role;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2016/8/26.
 */
public interface RoleDao extends IBaseJpaRepository<Role>{

    //查询角色
    @Query("SELECT a.name FROM Role a WHERE a.name = ?1")
    public Role findName(String name);

    @Query("SELECT a.name FROM Role a WHERE a.name = ?1 and a.id != ?2")
    public Role findNameAndId(String name, Long id);

}
