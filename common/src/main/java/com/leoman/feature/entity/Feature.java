package com.leoman.feature.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 特色
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_feature")
public class Feature extends BaseEntity{

    @Column(name = "name")
    private String name;//名称

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
