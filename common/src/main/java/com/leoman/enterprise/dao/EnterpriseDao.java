package com.leoman.enterprise.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.enterprise.entity.Enterprise;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface EnterpriseDao extends IBaseJpaRepository<Enterprise> {

    @Query("select a from Enterprise a where a.name = ?1")
    public Enterprise findByName(String name);

    @Query("select a from Enterprise a where a.username = ?1")
    public Enterprise findByUserName(String username);

    @Query("select a from Enterprise a where a.name = ?1 and a.id != ?2")
    public Enterprise findByNameAndId(String name, Long id);

    @Query("select a from Enterprise a where a.username = ?1 and a.id != ?2")
    public Enterprise findByUserNameAndId(String username , Long id);

}
