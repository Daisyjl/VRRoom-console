package com.leoman.timeRange.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.timeRange.dao.TimeRangeDao;
import com.leoman.timeRange.entity.TimeRange;
import com.leoman.timeRange.service.TimeRangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class TimeRangeServiceImpl extends GenericManagerImpl<TimeRange,TimeRangeDao> implements TimeRangeService {

    @Autowired
    private TimeRangeDao timeRangeDao;

    /**
     * 保存
     * @param timeRange
     * @return
     */
    @Override
    @Transactional
    public Result saveTimeRange(TimeRange timeRange){

        /*if(timeRange.getId() == null){
            TimeRange direc = timeRangeDao.findByName(timeRange.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00021);//此时间范围已存在
            }
        }else{
            TimeRange direc = timeRangeDao.findByNameAndId(timeRange.getName(), timeRange.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00021);//此时间范围已存在
            }
        }*/
        timeRangeDao.save(timeRange);

        return Result.success();
    }

}
