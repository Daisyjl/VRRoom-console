package com.leoman.area.region.dao;

import com.leoman.area.region.entity.Region;
import com.leoman.common.dao.IBaseJpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 区
 * Created by Administrator on 2016/10/18 0018 下午 3:04.
 */
public interface RegionDao extends IBaseJpaRepository<Region> {

    @Query("select a from Region a where a.city.id = ?1")
    public List<Region> findListByCityId(Long cityId);

    @Query("select a from Region a where a.name = ?1")
    public Region findByName(String name);
}