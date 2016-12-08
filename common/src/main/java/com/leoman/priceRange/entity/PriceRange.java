package com.leoman.priceRange.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 时间范围
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_price_range")
public class PriceRange extends BaseEntity{

    @Column(name = "type")
    private Integer type;//类型：1-新房，2-租房，3-二手房

    @Column(name = "name")
    private String name;

    @Column(name = "price_from")
    private Long priceFrom;//价格从

    @Column(name = "price_to")
    private Long priceTo;//价格至

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getPriceFrom() {
        return priceFrom;
    }

    public void setPriceFrom(Long priceFrom) {
        this.priceFrom = priceFrom;
    }

    public Long getPriceTo() {
        return priceTo;
    }

    public void setPriceTo(Long priceTo) {
        this.priceTo = priceTo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
