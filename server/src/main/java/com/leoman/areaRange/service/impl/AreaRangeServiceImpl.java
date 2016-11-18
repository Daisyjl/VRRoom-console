package com.leoman.areaRange.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.areaRange.dao.AreaRangeDao;
import com.leoman.areaRange.entity.AreaRange;
import com.leoman.areaRange.service.AreaRangeService;
import org.apache.http.entity.mime.content.StringBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class AreaRangeServiceImpl extends GenericManagerImpl<AreaRange,AreaRangeDao> implements AreaRangeService {

    @Autowired
    private AreaRangeDao areaRangeDao;

    /**
     * 保存
     * @param areaRange
     * @return
     */
    @Override
    @Transactional
    public Result saveAreaRange(AreaRange areaRange){

        String str;
        //如果起始范围为空
        if(areaRange.getAreaFrom() == null || StringUtils.isEmpty(areaRange.getAreaFrom()) || areaRange.getAreaFrom().equals(0)){
            str = areaRange.getAreaTo() + "㎡以下";
        }else if(areaRange.getAreaTo() == null || StringUtils.isEmpty(areaRange.getAreaTo())){
            str = areaRange.getAreaFrom() + "㎡以上";
        }else{
            str = areaRange.getAreaFrom().floatValue() +"-"+ areaRange.getAreaTo().floatValue() + "㎡";
        }
        areaRange.setName(str);

        if(areaRange.getId() == null){
            AreaRange direc = areaRangeDao.findByName(areaRange.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00016);//此面积范围已存在
            }
        }else{
            AreaRange direc = areaRangeDao.findByNameAndId(areaRange.getName(), areaRange.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00016);//此面积范围已存在
            }
        }
        areaRangeDao.save(areaRange);

        return Result.success();
    }

}
