package com.leoman.label.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/3/10 0010.
 */
@Entity
@Table(name = "t_label")
public class Label extends BaseEntity{

    @Column(name = "name")
    private String name;

    @Column(name = "object_id")
    private Integer objectId;

    @Column(name = "ridgepole_id")
    private Long ridgepoleId;

    @Column(name = "height")
    private String height;

    @Column(name = "width")
    private String width;

    @Column(name = "label_id")
    private String labelId;

    @Column(name = "description")
    private String description;

    @Column(name = "left_point")
    private Double leftPoint;

    @Column(name = "top_point")
    private Double topPoint;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getObjectId() {
        return objectId;
    }

    public void setObjectId(Integer objectId) {
        this.objectId = objectId;
    }

    public Long getRidgepoleId() {
        return ridgepoleId;
    }

    public void setRidgepoleId(Long ridgepoleId) {
        this.ridgepoleId = ridgepoleId;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getLabelId() {
        return labelId;
    }

    public void setLabelId(String labelId) {
        this.labelId = labelId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getLeftPoint() {
        return leftPoint;
    }

    public void setLeftPoint(Double leftPoint) {
        this.leftPoint = leftPoint;
    }

    public Double getTopPoint() {
        return topPoint;
    }

    public void setTopPoint(Double topPoint) {
        this.topPoint = topPoint;
    }
}
