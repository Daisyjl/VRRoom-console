package com.leoman.bedroom.service.impl;

import com.leoman.bedroom.dao.BedroomDao;
import com.leoman.bedroom.entity.Bedroom;
import com.leoman.bedroom.service.BedroomService;
import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class BedroomServiceImpl extends GenericManagerImpl<Bedroom,BedroomDao> implements BedroomService {

    @Autowired
    private BedroomDao bedroomDao;

    /**
     * 保存
     * @param bedroom
     * @return
     */
    @Override
    @Transactional
    public Result saveBedroom(Bedroom bedroom){
        if(bedroom.getId() == null){
            Bedroom direc = bedroomDao.findByName(bedroom.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00018);//此居室已存在
            }
        }else{
            Bedroom direc = bedroomDao.findByNameAndId(bedroom.getName(), bedroom.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00018);//此居室已存在
            }
        }
        bedroomDao.save(bedroom);

        return Result.success();
    }

}
