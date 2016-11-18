package com.leoman.feature.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.direction.entity.Direction;
import com.leoman.feature.entity.Feature;

import java.util.List;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface FeatureService extends GenericManager<Feature> {

    public Result saveFeature(Feature feature);

    public List<Feature> findByIds(List<Long> ids);

}
