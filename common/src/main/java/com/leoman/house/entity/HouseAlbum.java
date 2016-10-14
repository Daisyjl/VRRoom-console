package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 楼盘相册
 * Created by Daisy on 2016/10/14.
 */
@Entity
@Table(name = "t_house_album")
public class HouseAlbum extends BaseEntity{

    @Column(name = "name")
    private String name;//相册名称

    @Transient
    private Long imageNum;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getImageNum() {
        return imageNum;
    }

    public void setImageNum(Long imageNum) {
        this.imageNum = imageNum;
    }
}
