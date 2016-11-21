package com.leoman.timeRange.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 时间范围
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_time_range")
public class TimeRange extends BaseEntity{

    @Column(name = "type")
    private Integer type;//类型：1-月，2-周，3-年

    @Column(name = "name")
    private String name;//名称

    @Column(name = "time_num")
    private Integer timeNum;//时间长度

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTimeNum() {
        return timeNum;
    }

    public void setTimeNum(Integer timeNum) {
        this.timeNum = timeNum;
    }
}
