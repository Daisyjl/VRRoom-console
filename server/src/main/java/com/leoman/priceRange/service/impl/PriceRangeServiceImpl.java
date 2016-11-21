package com.leoman.priceRange.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.priceRange.dao.PriceRangeDao;
import com.leoman.priceRange.entity.PriceRange;
import com.leoman.priceRange.service.PriceRangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class PriceRangeServiceImpl extends GenericManagerImpl<PriceRange,PriceRangeDao> implements PriceRangeService {

    @Autowired
    private PriceRangeDao priceRangeDao;

    /**
     * 保存
     * @param priceRange
     * @return
     */
    @Override
    @Transactional
    public Result savePriceRange(PriceRange priceRange){

        String str;
        //如果起始范围为空
        if(priceRange.getPriceFrom() == null || StringUtils.isEmpty(priceRange.getPriceFrom()) || priceRange.getPriceFrom().equals(0)){
            str = priceRange.getPriceTo() + "元/㎡以下";
        }else if(priceRange.getPriceTo() == null || StringUtils.isEmpty(priceRange.getPriceTo())){
            str = priceRange.getPriceFrom() + "元/㎡以上";
        }else{
            str = priceRange.getPriceFrom() +"-"+ priceRange.getPriceTo() + "元/㎡";
        }
        priceRange.setName(str);

        if(priceRange.getId() == null){
            PriceRange direc = priceRangeDao.findByName(priceRange.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00020);//此价格范围已存在
            }
        }else{
            PriceRange direc = priceRangeDao.findByNameAndId(priceRange.getName(), priceRange.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00020);//此价格范围已存在
            }
        }
        priceRangeDao.save(priceRange);

        return Result.success();
    }

}
