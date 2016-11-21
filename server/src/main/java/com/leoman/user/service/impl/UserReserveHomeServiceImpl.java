package com.leoman.user.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.user.dao.UserReserveHomeDao;
import com.leoman.user.entity.UserReserveHome;
import com.leoman.user.service.UserReserveHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class UserReserveHomeServiceImpl extends GenericManagerImpl<UserReserveHome,UserReserveHomeDao> implements UserReserveHomeService{

    @Autowired
    private UserReserveHomeDao userReserveHomeDao;

}
