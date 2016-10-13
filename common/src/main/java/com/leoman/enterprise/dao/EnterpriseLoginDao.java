package com.leoman.enterprise.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.entity.EnterpriseLogin;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface EnterpriseLoginDao extends IBaseJpaRepository<EnterpriseLogin> {

    @Query("select a from EnterpriseLogin a where a.enterprise.id = ?1")
    public EnterpriseLogin findByEnterpriseId(Long enterpriseId);

}
