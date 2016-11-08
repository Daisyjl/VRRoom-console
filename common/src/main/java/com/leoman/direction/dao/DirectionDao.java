package com.leoman.direction.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.direction.entity.Direction;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface DirectionDao extends IBaseJpaRepository<Direction> {

    @Query("select a from Direction a where a.name = ?1")
    public Direction findByName(String name);

    @Query("select a from Direction a where a.name = ?1 and a.id <> ?2")
    public Direction findByNameAndId(String name, Long id);

}
