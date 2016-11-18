package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 楼盘banner图
 * Created by Daisy on 2016/10/12.
 */
@Entity
@Table(name = "t_house_image")
public class HouseImage extends BaseEntity {

    @Column(name = "house_id")
    private Long houseId;//楼盘id

    @ManyToOne
    @JoinColumn(name = "image_id")
    private Image image;//封面图

    @Column(name = "seq")
    private Long seq;//序号

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }
}


