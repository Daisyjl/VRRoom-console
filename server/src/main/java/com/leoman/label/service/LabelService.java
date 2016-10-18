package com.leoman.label.service;

import com.leoman.common.service.GenericManager;
import com.leoman.label.entity.Label;

import java.util.List;

/**
 * Created by Administrator on 2016/3/10 0010 下午 3:09.
 */
public interface LabelService extends GenericManager<Label> {

    // 根据目标id和目标类型查询标签列表
    public List<Label> findListByParams(Integer objectId, Integer objectType);

    // 根据目标id和标签id查询标签最后停留的位置
    public Label findLastPosition(Integer objectId, String labelId);

    // 根据目标id和标签id查询标签最后停留的位置
    public Label searchByLabelId(String labelId);
}