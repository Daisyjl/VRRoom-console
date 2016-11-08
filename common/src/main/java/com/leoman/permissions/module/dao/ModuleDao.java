package com.leoman.permissions.module.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.permissions.module.entity.Module;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by yesong on 2016/8/29.
 */
public interface ModuleDao extends IBaseJpaRepository<Module>{

}
