package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseRidgepoleFloor;
import com.leoman.house.entity.HouseRidgepoleFloorRoom;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘的每一栋的每一层的每一个房间
 * Created by Daisy on 2016/10/18.
 */
public interface HouseRidgepoleFloorRoomDao extends IBaseJpaRepository<HouseRidgepoleFloorRoom> {

    @Query("select a from HouseRidgepoleFloorRoom a where a.ridgepoleFloorId = ?1")
    public List<HouseRidgepoleFloorRoom> findByRidgepoleId(Long ridgepoleId);

    @Query("select a from HouseRidgepoleFloorRoom a where a.ridgepoleFloorId = ?1")
    public List<HouseRidgepoleFloorRoom> findByRidgepoleFloorId(Long ridgepoleFloorId);

    @Query("select a from HouseRidgepoleFloorRoom a where a.typeUnitId = ?1")
    public List<HouseRidgepoleFloorRoom> findByTypeUnitId(Long typeUnitId);

    @Query("select count(a.id) from HouseRidgepoleFloorRoom a where a.ridgepoleFloorId in (select b.id from HouseRidgepoleFloor b where b.ridgepole.houseId = ?1)")
    public Integer findRoomNumByHouseId(Long houseId);

}
