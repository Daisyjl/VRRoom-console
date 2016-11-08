package com.leoman.label.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.label.entity.Label;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by Administrator on 2016/3/10 0010 下午 3:09.
 */
public interface LabelDao extends IBaseJpaRepository<Label> {

    @Query("select a from Label a where a.objectId = ?1")
    public List<Label> findListByObjectId(Integer objectId);

    @Query("select a from Label a where a.objectId = ?1 and a.labelId = ?2")
    public Label findOneByObjectIdAndLabelId(Integer objectId, String labelId);

    @Query("select a from Label a where a.labelId = ?1")
    public Label findOneByLabelId(String labelId);
}