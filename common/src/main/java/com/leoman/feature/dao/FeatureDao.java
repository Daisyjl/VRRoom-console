package com.leoman.feature.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.feature.entity.Feature;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface FeatureDao extends IBaseJpaRepository<Feature> {

    @Query("select a from Feature a where a.name = ?1")
    public Feature findByName(String name);

    @Query("select a from Feature a where a.name = ?1 and a.id <> ?2")
    public Feature findByNameAndId(String name, Long id);

}
