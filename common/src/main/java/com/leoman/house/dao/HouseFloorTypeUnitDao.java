package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseFloorType;
import com.leoman.house.entity.HouseFloorTypeUnit;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘楼层类型和户型关系
 * Created by Daisy on 2016/10/17.
 */
public interface HouseFloorTypeUnitDao extends IBaseJpaRepository<HouseFloorTypeUnit> {

    @Query("select a from HouseFloorTypeUnit a where a.floorType.id = ?1")
    public List<HouseFloorTypeUnit> findByFloorTypeId(Long floorTypeId);

}
