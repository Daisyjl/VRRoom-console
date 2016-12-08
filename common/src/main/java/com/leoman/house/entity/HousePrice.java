package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * 楼盘价格
 * Created by Daisy on 2016/12/8.
 */
@Entity
@Table(name = "t_house_price")
public class HousePrice extends BaseEntity{

    @Column(name = "house_id")
    private Long houseId;//楼盘id

    @Column(name = "price")
    private BigDecimal price;//价格

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
