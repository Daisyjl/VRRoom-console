package com.leoman.priceRange.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.priceRange.entity.PriceRange;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface PriceRangeDao extends IBaseJpaRepository<PriceRange> {

    @Query("select a from PriceRange a where a.name = ?1")
    public PriceRange findByName(String name);

    @Query("select a from PriceRange a where a.name = ?1 and a.id <> ?2")
    public PriceRange findByNameAndId(String name, Long id);

}
