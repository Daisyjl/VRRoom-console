package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 楼盘户型
 * Created by Daisy on 2016/10/12.
 */
@Entity
@Table(name = "t_house_unit_image")
public class HouseUnitImage extends BaseEntity {

    @Column(name = "unit_id")
    private Long unitId;//户型id

    @ManyToOne
    @JoinColumn(name = "d3_image_id")
    private Image d3Image;//3d图

    public Long getUnitId() {
        return unitId;
    }

    public void setUnitId(Long unitId) {
        this.unitId = unitId;
    }

    public Image getD3Image() {
        return d3Image;
    }

    public void setD3Image(Image d3Image) {
        this.d3Image = d3Image;
    }
}


