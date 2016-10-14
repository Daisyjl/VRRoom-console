package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 楼盘相册
 * Created by Daisy on 2016/10/14.
 */
@Entity
@Table(name = "t_house_album_image")
public class HouseAlbumImage extends BaseEntity{

    @Column(name = "house_id")
    private Long houseId;//楼盘id

    @ManyToOne
    @JoinColumn(name = "album_id")
    private HouseAlbum album;

    @ManyToOne
    @JoinColumn(name = "image_id")
    private Image image;

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public HouseAlbum getAlbum() {
        return album;
    }

    public void setAlbum(HouseAlbum album) {
        this.album = album;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

}
