package com.leoman.label.service.impl;


import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.label.dao.LabelDao;
import com.leoman.label.entity.Label;
import com.leoman.label.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * Created by Administrator on 2016/3/10 0010 下午 3:09.
 */
@Service
public class LabelServiceImpl  extends GenericManagerImpl<Label,LabelDao> implements LabelService {

    @Autowired
    private LabelDao labelDao;


    @Override
    public List<Label> findListByParams(Integer objectId) {
        List<Label> list = labelDao.findListByParams(objectId);

        return list;
    }

    @Override
    public Label findLastPosition(Integer objectId, String labelId) {
        return labelDao.findOneByObjectIdAndLabelId(objectId, labelId);
    }

    @Override
    public Label searchByLabelId(String labelId) {
        return labelDao.findOneByLabelId(labelId);
    }
}