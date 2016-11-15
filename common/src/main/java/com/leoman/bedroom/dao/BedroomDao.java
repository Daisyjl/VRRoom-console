package com.leoman.bedroom.dao;

import com.leoman.bedroom.entity.Bedroom;
import com.leoman.common.dao.IBaseJpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface BedroomDao extends IBaseJpaRepository<Bedroom> {

    @Query("select a from Bedroom a where a.name = ?1")
    public Bedroom findByName(String name);

    @Query("select a from Bedroom a where a.name = ?1 and a.id <> ?2")
    public Bedroom findByNameAndId(String name, Long id);

}
