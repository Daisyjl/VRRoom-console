package com.leoman.areaRange.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * 面积范围
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_area_range")
public class AreaRange extends BaseEntity{

    @Column(name = "name")
    private String name;//面积名称

    @Column(name = "area_from")
    private BigDecimal areaFrom;//面积开始

    @Column(name = "area_to")
    private BigDecimal areaTo;//面积结束

    public BigDecimal getAreaFrom() {
        return areaFrom;
    }

    public void setAreaFrom(BigDecimal areaFrom) {
        this.areaFrom = areaFrom;
    }

    public BigDecimal getAreaTo() {
        return areaTo;
    }

    public void setAreaTo(BigDecimal areaTo) {
        this.areaTo = areaTo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
