package com.leoman.enterprise.entity;

import com.leoman.area.city.entity.City;
import com.leoman.entity.BaseEntity;

import javax.persistence.*;

/**
 * Created by Daisy on 2016/10/11.
 */
@Entity
@Table(name = "t_enterprise")
public class Enterprise extends BaseEntity{

    @Column(name = "name")
    private String name;//名称

    @Column(name = "username")
    private String username;//账号

    @Column(name = "intro")
    private String intro;//简介

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;//城市

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
