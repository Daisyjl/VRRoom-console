package com.leoman.user.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.house.entity.House;
import com.leoman.saleman.entity.Saleman;

import javax.persistence.*;

/**
 * Created by Daisy on 2016/11/7.
 */
@Table(name = "t_user_reserve_home")
@Entity
public class UserReserveHome extends BaseEntity{

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;//用户

    @ManyToOne
    @JoinColumn(name = "house_id")
    private House house;//楼盘

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }
}
