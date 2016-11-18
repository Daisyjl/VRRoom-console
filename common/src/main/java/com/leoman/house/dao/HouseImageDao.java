package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseImage;
import com.leoman.image.entity.Image;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘封面图片
 * Created by Daisy on 2016/10/11.
 */
public interface HouseImageDao extends IBaseJpaRepository<HouseImage> {

    @Query("select a from HouseImage a where a.houseId = ?1")
    public List<HouseImage> findListByHouseId(Long houseId);

    @Query("select a.image from HouseImage a where a.houseId = ?1")
    public List<Image> findByHouseId(Long houseId);

}
