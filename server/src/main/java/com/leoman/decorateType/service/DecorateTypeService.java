package com.leoman.decorateType.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.decorateType.entity.DecorateType;
import com.leoman.direction.entity.Direction;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface DecorateTypeService extends GenericManager<DecorateType> {

    public Result saveDecorateType(DecorateType decorateType);

}
