package com.leoman.bedroom.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 居室
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_bedroom")
public class Bedroom extends BaseEntity{

    @Column(name = "name")
    private String name;//居室名称

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
