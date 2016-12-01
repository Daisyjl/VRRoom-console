package com.leoman.enterprise.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.enterprise.entity.EnterpriseSubLogin;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface EnterpriseSubLoginDao extends IBaseJpaRepository<EnterpriseSubLogin> {

    @Query("select a from EnterpriseSubLogin a where a.enterpriseSubId = ?1")
    public EnterpriseSubLogin findByEnterpriseSubId(Long enterpriseSubId);

}
