package com.leoman.priceRange.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.priceRange.entity.PriceRange;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface PriceRangeService extends GenericManager<PriceRange> {

    public Result savePriceRange(PriceRange priceRange);
}
