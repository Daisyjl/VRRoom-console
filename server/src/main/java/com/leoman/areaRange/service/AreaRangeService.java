package com.leoman.areaRange.service;

import com.leoman.areaRange.entity.AreaRange;
import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.direction.entity.Direction;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface AreaRangeService extends GenericManager<AreaRange> {

    public Result saveAreaRange(AreaRange areaRange);

}
