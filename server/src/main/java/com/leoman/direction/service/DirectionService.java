package com.leoman.direction.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.direction.entity.Direction;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface DirectionService extends GenericManager<Direction> {

    public Result saveDirection(Direction direction);

}
