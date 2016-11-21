package com.leoman.user.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.user.entity.UserReserveHome;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/11/7.
 */
public interface UserReserveHomeDao extends IBaseJpaRepository<UserReserveHome> {

    @Query("select a from UserReserveHome a where a.userId = ?1 and a.houseId = ?2")
    public UserReserveHome findByUserIdAndHouseId(Long userId, Long houseId);

}
