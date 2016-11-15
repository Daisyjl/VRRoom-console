package com.leoman.decorateType.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 居室
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_decorate_type")
public class DecorateType extends BaseEntity{

    @Column(name = "name")
    private String name;//装修类型名称

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
