package com.leoman.saleman.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.house.entity.House;

import javax.persistence.*;

/**
 * 销售顾问和楼盘关系
 * Created by Daisy on 2016/10/20.
 */
@Entity
@Table(name = "t_saleman_house")
public class SalemanHouse extends BaseEntity{

    @Column(name = "saleman_id")
    private Long salemanId;//销售顾问id

    @ManyToOne
    @JoinColumn(name= "house_id")
    private House house;//楼盘id

    public Long getSalemanId() {
        return salemanId;
    }

    public void setSalemanId(Long salemanId) {
        this.salemanId = salemanId;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }
}
