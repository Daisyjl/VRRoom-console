package com.leoman.house.service.impl;

import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseDao;
import com.leoman.house.dao.HouseDynamicDao;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseService;
import com.leoman.utils.ClassUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 楼盘动态
 * Created by Daisy on 2016/10/12.
 */
@Service
public class HouseDynamicServiceImpl extends GenericManagerImpl<HouseDynamic,HouseDynamicDao> implements HouseDynamicService {

    @Autowired
    protected HouseDynamicDao houseDynamicDao;

    @Override
    @Transactional
    public Result saveDynamic(HouseDynamic houseDynamic){
        Long dynamicId = houseDynamic.getId();

        String content = houseDynamic.getContent();
        if(StringUtils.isNotBlank(content)){
            content = content.replace("&lt", "<").replace("&gt", ">");
            houseDynamic.setContent(content);
        }

        if(dynamicId != null){
            HouseDynamic orgDynamic = houseDynamicDao.findOne(dynamicId);
            if(orgDynamic != null){
                houseDynamic.setHouseId(orgDynamic.getHouseId());
            }
        }

        houseDynamicDao.save(houseDynamic);

        return new Result().success();
    }

}
