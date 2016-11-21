package com.leoman.timeRange.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.timeRange.entity.TimeRange;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface TimeRangeService extends GenericManager<TimeRange> {

    public Result saveTimeRange(TimeRange timeRange);

}
