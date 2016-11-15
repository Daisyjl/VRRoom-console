package com.leoman.decorateType.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.decorateType.entity.DecorateType;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface DecorateTypeDao extends IBaseJpaRepository<DecorateType> {

    @Query("select a from DecorateType a where a.name = ?1")
    public DecorateType findByName(String name);

    @Query("select a from DecorateType a where a.name = ?1 and a.id <> ?2")
    public DecorateType findByNameAndId(String name, Long id);

}
