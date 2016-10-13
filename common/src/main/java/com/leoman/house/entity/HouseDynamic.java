package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 楼盘动态
 * Created by Daisy on 2016/10/12.
 */
@Entity
@Table(name = "t_house_dynamic")
public class HouseDynamic extends BaseEntity{

    @Column(name = "title")
    private String title;//标题

    @Column(name = "content")
    private String content;//内容

    @Column(name = "house_id")
    private Long houseId;//楼盘id

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }
}
