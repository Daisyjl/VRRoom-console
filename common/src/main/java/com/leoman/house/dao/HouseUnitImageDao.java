package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.entity.HouseUnitImage;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 户型3d图片
 * Created by Daisy on 2016/10/11.
 */
public interface HouseUnitImageDao extends IBaseJpaRepository<HouseUnitImage> {

    @Query("select a from HouseUnitImage a where a.unitId = ?1")
    public List<HouseUnitImage> findByUnitId(Long unitId);

}
