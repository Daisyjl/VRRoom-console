package com.leoman.enterprise.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 企业
 * Created by Daisy on 2016/10/11.
 */
@Entity
@Table(name = "t_enterprise")
public class Enterprise extends BaseEntity{

    @Column(name = "name")
    private String name;//名称

    @Column(name = "intro")
    private String intro;//简介

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

}
