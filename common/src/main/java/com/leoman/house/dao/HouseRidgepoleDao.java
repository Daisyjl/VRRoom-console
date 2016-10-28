package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.entity.HouseRidgepole;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘的每一栋
 * Created by Daisy on 2016/10/18.
 */
public interface HouseRidgepoleDao extends IBaseJpaRepository<HouseRidgepole> {

    @Query("select a from HouseRidgepole a where a.houseId = ?1")
    public List<HouseRidgepole> findByHouseId(Long houseId);

}
