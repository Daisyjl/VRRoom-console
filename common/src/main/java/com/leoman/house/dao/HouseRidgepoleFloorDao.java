package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseRidgepole;
import com.leoman.house.entity.HouseRidgepoleFloor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘的每一栋的每一层
 * Created by Daisy on 2016/10/18.
 */
public interface HouseRidgepoleFloorDao extends IBaseJpaRepository<HouseRidgepoleFloor> {

    @Query("select a from HouseRidgepoleFloor a where a.ridgepole.id = ?1")
    public List<HouseRidgepoleFloor> findByRidgepoleId(Long ridgepoleId);

    @Query("select a from HouseRidgepoleFloor a where a.floorType.id = ?1")
    public List<HouseRidgepoleFloor> findByFloorTypeId(Long floorTypeId);
}
