package com.leoman.house.service.impl;

import com.leoman.common.service.impl.GenericManagerImpl;
import com.leoman.house.dao.HouseDao;
import com.leoman.house.dao.HouseDynamicDao;
import com.leoman.house.dao.HouseUnitDao;
import com.leoman.house.entity.House;
import com.leoman.house.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class HouseServiceImpl extends GenericManagerImpl<House,HouseDao> implements HouseService {

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private HouseDynamicDao houseDynamicDao;

    @Autowired
    private HouseUnitDao houseUnitDao;

    /**
     * 保存新增
     */
    /*public Result saveAdd(House house, HouseDynamic houseDynamic, HouseUnit){
        House h = houseDao.findByName(house.getName());
        if(h != null){
            return new Result().failure(ErrorType.ERROR_CODE_00010);//楼盘名称已存在
        }

        //基本信息
        houseDao.save(house);

        //楼盘动态
        houseDynamicDao.save();
    }*/


}
