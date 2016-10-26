package com.leoman.house.dao;

import com.leoman.common.dao.IBaseJpaRepository;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseAlbumImage;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 楼盘相册
 * Created by Daisy on 2016/10/11.
 */
public interface HouseAlbumImageDao extends IBaseJpaRepository<HouseAlbumImage> {

    @Query("select a from HouseAlbumImage a where a.houseId = ?1 and a.album.id = ?2")
    public List<HouseAlbumImage> findImage(Long houseId, Long albumId);

}
