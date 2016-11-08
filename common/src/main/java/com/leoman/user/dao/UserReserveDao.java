package com.leoman.user.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.user.entity.UserLogin;
import com.leoman.user.entity.UserReserve;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by Daisy on 2016/11/7.
 */
public interface UserReserveDao extends IBaseJpaRepository<UserReserve>{

    @Query("select a from UserReserve a where a.userId = ?1 and a.salemanId = ?2")
    public UserReserve findByUserIdAndSalemanId(Long userId, Long salemanId);

    @Query("select a from UserReserve a where a.userId = ?1")
    public Page<UserReserve> findByUserId(Long userId, Pageable pageable);

    @Query("select a from UserReserve a where a.salemanId = ?1")
    public Page<UserReserve> findBySalemanId(Long salemanId, Pageable pageable);

}
