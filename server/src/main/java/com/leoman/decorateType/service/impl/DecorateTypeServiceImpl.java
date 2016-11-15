package com.leoman.decorateType.service.impl;

import com.leoman.decorateType.dao.DecorateTypeDao;
import com.leoman.decorateType.entity.DecorateType;
import com.leoman.decorateType.service.DecorateTypeService;
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
public class DecorateTypeServiceImpl extends GenericManagerImpl<DecorateType,DecorateTypeDao> implements DecorateTypeService {

    @Autowired
    private DecorateTypeDao decorateTypeDao;

    /**
     * 保存
     * @param decorateType
     * @return
     */
    @Override
    @Transactional
    public Result saveDecorateType(DecorateType decorateType){
        if(decorateType.getId() == null){
            DecorateType direc = decorateTypeDao.findByName(decorateType.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00019);//此装修类型已存在
            }
        }else{
            DecorateType direc = decorateTypeDao.findByNameAndId(decorateType.getName(), decorateType.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00019);//此装修类型已存在
            }
        }
        decorateTypeDao.save(decorateType);

        return Result.success();
    }

}
