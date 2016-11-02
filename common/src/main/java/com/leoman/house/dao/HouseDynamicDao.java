package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseDynamic;
import org.springframework.data.jpa.repository.Query;

/**
 * 楼盘动态
 * Created by Daisy on 2016/10/11.
 */
public interface HouseDynamicDao extends IBaseJpaRepository<HouseDynamic> {

    @Query("select count(a.id) from HouseDynamic a where a.houseId = ?1")
    public Integer findNumByHouseId(Long houseId);

}
