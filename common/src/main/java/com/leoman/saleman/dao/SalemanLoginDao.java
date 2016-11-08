package com.leoman.saleman.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.saleman.entity.Saleman;
import com.leoman.saleman.entity.SalemanLogin;
import org.springframework.data.jpa.repository.Query;

/**
 * 销售顾问登录
 * Created by Daisy on 2016/10/20.
 */
public interface SalemanLoginDao extends IBaseJpaRepository<SalemanLogin> {

    @Query("select a from SalemanLogin a where a.saleman.id = ?1")
    public SalemanLogin findBySalemanId(Long salemanId);

}
