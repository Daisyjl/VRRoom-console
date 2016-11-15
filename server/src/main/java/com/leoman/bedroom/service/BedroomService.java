package com.leoman.bedroom.service;

import com.leoman.bedroom.entity.Bedroom;
import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.direction.entity.Direction;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface BedroomService extends GenericManager<Bedroom> {

    public Result saveBedroom(Bedroom Bedroom);

}
