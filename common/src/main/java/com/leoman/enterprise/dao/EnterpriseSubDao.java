package com.leoman.enterprise.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.enterprise.entity.EnterpriseSub;
import org.springframework.data.jpa.repository.Query;

/**
 * 子企业
 * Created by Daisy on 2016/10/11.
 */
public interface EnterpriseSubDao extends IBaseJpaRepository<EnterpriseSub> {

    @Query("select a from EnterpriseSub a where a.username = ?1")
    public EnterpriseSub findByUsername(String username);

    @Query("select a from EnterpriseSub a where a.enterpriseId = ?1 and a.city.id = ?2")
    public EnterpriseSub findByEnterpriseAndCity(Long enterpriseId, Long cityId);

    @Query("select a from EnterpriseSub a where a.enterpriseId = ?1 and a.city.id = ?2 and a.id != ?3")
    public EnterpriseSub findByEnterpriseAndCityAndId(Long enterpriseId, Long cityId, Long enterpriseSubId);

}
