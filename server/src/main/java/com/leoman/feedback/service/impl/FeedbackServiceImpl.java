package com.leoman.feedback.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.feedback.dao.FeedbackDao;
import com.leoman.feedback.entity.Feedback;
import com.leoman.feedback.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class FeedbackServiceImpl extends GenericManagerImpl<Feedback,FeedbackDao> implements FeedbackService {

    @Autowired
    private FeedbackDao feedbackDao;

}
