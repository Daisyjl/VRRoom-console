package com.leoman.version.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.version.entity.Version;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Daisy on 2016/10/11.
 */
public interface VersionDao extends IBaseJpaRepository<Version> {

    @Query("select a from Version a where a.versionNo = ?1")
    public Version findByNo(String versionNo);
}
