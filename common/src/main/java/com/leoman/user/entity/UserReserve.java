package com.leoman.user.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.house.entity.House;
import com.leoman.saleman.entity.Saleman;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by Daisy on 2016/11/7.
 */
@Table(name = "t_user_reserve")
@Entity
public class UserReserve extends BaseEntity{

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "saleman_id")
    private Long salemanId;

    @Transient
    private House house;//预约楼盘

    @Transient
    private Saleman saleman;//预约的销售顾问

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

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

    public Saleman getSaleman() {
        return saleman;
    }

    public void setSaleman(Saleman saleman) {
        this.saleman = saleman;
    }
}
