package com.leoman.saleman.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.saleman.entity.Saleman;
import org.springframework.data.jpa.repository.Query;

/**
 * 销售顾问
 * Created by Daisy on 2016/10/20.
 */
public interface SalemanDao extends IBaseJpaRepository<Saleman> {

    @Query("select a from Saleman a where a.mobile = ?1")
    public Saleman findByMobile(String mobile);

    @Query("select a from Saleman a where a.accountNo = ?1")
    public Saleman findByAccountNo(String accountNo);

    @Query("select a from Saleman a where a.mobile = ?1 and a.id != ?2")
    public Saleman findByMobileAndId(String mobile, Long id);

    @Query("select a from Saleman a where a.accountNo = ?1 and a.id != ?2")
    public Saleman findByAccountNoAndId(String accountNo, Long id);

}
