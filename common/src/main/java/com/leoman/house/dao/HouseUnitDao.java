package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseUnit;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘户型
 * Created by Daisy on 2016/10/12.
 */
public interface HouseUnitDao extends IBaseJpaRepository<HouseUnit> {

    @Query("select a from HouseUnit a where a.houseId = ?1")
    public List<HouseUnit> findByHouseId(Long houseId);
}
