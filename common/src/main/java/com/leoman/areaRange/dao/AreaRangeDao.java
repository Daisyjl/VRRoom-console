package com.leoman.areaRange.dao;

import com.leoman.areaRange.entity.AreaRange;
import com.leoman.common.dao.IBaseJpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface AreaRangeDao extends IBaseJpaRepository<AreaRange> {

    @Query("select a from AreaRange a where a.name = ?1")
    public AreaRange findByName(String name);

    @Query("select a from AreaRange a where a.name = ?1 and a.id <> ?2")
    public AreaRange findByNameAndId(String name, Long id);

}
