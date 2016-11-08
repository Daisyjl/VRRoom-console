package com.leoman.direction.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.direction.dao.DirectionDao;
import com.leoman.direction.entity.Direction;
import com.leoman.direction.service.DirectionService;
import com.leoman.house.dao.HouseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class DirectionServiceImpl extends GenericManagerImpl<Direction,DirectionDao> implements DirectionService {

    @Autowired
    private DirectionDao directionDao;

    /**
     * 保存方位
     * @param direction
     * @return
     */
    @Override
    @Transactional
    public Result saveDirection(Direction direction){
        if(direction.getId() == null){
            Direction direc = directionDao.findByName(direction.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00015);//此方位已存在
            }
        }else{
            Direction direc = directionDao.findByNameAndId(direction.getName(), direction.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00015);//此方位已存在
            }
        }
        directionDao.save(direction);

        return Result.success();
    }

}
