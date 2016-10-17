package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseFloorType;
import org.springframework.data.jpa.repository.Query;

/**
 * 楼盘楼层类型
 * Created by Daisy on 2016/10/17.
 */
public interface HouseFloorTypeDao extends IBaseJpaRepository<HouseFloorType> {

    @Query("select a from HouseFloorType a where a.houseId = ?1")
    public HouseFloorType findByHouseId(Long houseId);
}
