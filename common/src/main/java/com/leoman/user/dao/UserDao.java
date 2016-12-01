package com.leoman.user.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.user.entity.User;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/11/7.
 */
public interface UserDao extends IBaseJpaRepository<User> {

    @Query("select a from User a where a.mobile = ?1 and a.status != 1")
    public User findByMobile(String mobile);

}
