package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.house.entity.House;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface HouseDao extends IBaseJpaRepository<House> {

    @Query("select a from House a where a.name = ?1")
    public House findByName(String name);

    @Query("select a from House a where a.name = ?1 and a.id != ?2")
    public House findByNameAndId(String name, Long id);

}
