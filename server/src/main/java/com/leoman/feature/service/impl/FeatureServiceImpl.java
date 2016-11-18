package com.leoman.feature.service.impl;

import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.feature.dao.FeatureDao;
import com.leoman.feature.entity.Feature;
import com.leoman.feature.service.FeatureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class FeatureServiceImpl extends GenericManagerImpl<Feature,FeatureDao> implements FeatureService {

    @Autowired
    private FeatureDao featureDao;

    /**
     * 保存
     * @param feature
     * @return
     */
    @Override
    @Transactional
    public Result saveFeature(Feature feature){
        if(feature.getId() == null){
            Feature direc = featureDao.findByName(feature.getName());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00017);//此特色已存在
            }
        }else{
            Feature direc = featureDao.findByNameAndId(feature.getName(), feature.getId());
            if(direc != null){
                return Result.failure(ErrorType.ERROR_CODE_00017);//此特色已存在
            }
        }
        featureDao.save(feature);

        return Result.success();
    }

    @Override
    public List<Feature> findByIds(List<Long> ids){
//        String sql = "select * from t_feature where FIND_IN_SET(id, '"+ids+"')";
//        List<Feature> list = queryBySql(sql, Feature.class);
//        List<Long> aa = Arrays.asList(new Long[]{1l,2l,3l});
        return featureDao.findByIds(ids);
    }

}
