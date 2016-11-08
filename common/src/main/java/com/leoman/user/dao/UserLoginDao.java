package com.leoman.user.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.user.entity.UserLogin;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/6/12.
 */
public interface UserLoginDao extends IBaseJpaRepository<UserLogin>{

    @Query("select a from UserLogin a where a.userId = ?1")
    public UserLogin findByUserId(Long userId);

}
