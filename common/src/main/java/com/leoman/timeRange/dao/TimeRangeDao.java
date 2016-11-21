package com.leoman.timeRange.dao;

import com.leoman.timeRange.entity.TimeRange;
import com.leoman.common.dao.IBaseJpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface TimeRangeDao extends IBaseJpaRepository<TimeRange> {

    @Query("select a from TimeRange a where a.name = ?1")
    public TimeRange findByName(String name);

    @Query("select a from TimeRange a where a.name = ?1 and a.id <> ?2")
    public TimeRange findByNameAndId(String name, Long id);

}
