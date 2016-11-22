package com.leoman.state.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.state.entity.State;
import com.leoman.timeRange.entity.TimeRange;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface StateDao extends IBaseJpaRepository<State> {

    @Query("select a from State a where a.type = ?1")
    public State findByType(Integer type);

}
