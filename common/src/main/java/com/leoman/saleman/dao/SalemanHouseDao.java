package com.leoman.saleman.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.House;
import com.leoman.saleman.entity.Saleman;
import com.leoman.saleman.entity.SalemanHouse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 销售顾问与楼盘关系
 * Created by Daisy on 2016/10/20.
 */
public interface SalemanHouseDao extends IBaseJpaRepository<SalemanHouse> {
//
//    @Query("select a.house from SalemanHouse a where a.salemanId = ?1")
//    public List<House> findBySalemanId(Long salemanId);

    @Query("select a.house from SalemanHouse a where a.salemanId = ?1")
    public Page<House> findBySalemanId(Long salemanId, Pageable pageable);
}
