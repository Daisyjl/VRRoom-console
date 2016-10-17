package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 楼盘类型
 * Created by Daisy on 2016/10/17.
 */
@Entity
@Table(name = "t_house_floor_type")
public class HouseFloorType extends BaseEntity{

    @Column(name = "house_id")
    private Long houseId;//所在楼盘

    @Column(name = "name")
    private String name;//楼层类型名称

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
