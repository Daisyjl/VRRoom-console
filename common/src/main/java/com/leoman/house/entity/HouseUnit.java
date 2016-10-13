package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 楼盘户型
 * Created by Daisy on 2016/10/12.
 */
@Entity
@Table(name = "t_house_unit ")
public class HouseUnit extends BaseEntity {

    @Column(name = "name")
    private String name;//户型名称

    @Column(name = "type_name")
    private String typeName;//户型名称

    @Column(name = "total_price")
    private BigDecimal totalPrice;//参考总价

    @Column(name = "total_area")
    private BigDecimal totalArea;//面积

    @Column(name = "full_view")
    private String fullView;//360全景

    @Column(name = "3d_model_recog_url")
    private String d3ModelRecogUrl;//3D模型识别图

    @Column(name = "3d_model_url")
    private String d3ModelUrl;//3D模型

    @ManyToOne
    @JoinColumn(name = "plane_image_id")
    private Image planeImage;//平面图

    @ManyToOne
    @JoinColumn(name = "3d_image_id")
    private Image d3Image;//3d图

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getTotalArea() {
        return totalArea;
    }

    public void setTotalArea(BigDecimal totalArea) {
        this.totalArea = totalArea;
    }

    public String getFullView() {
        return fullView;
    }

    public void setFullView(String fullView) {
        this.fullView = fullView;
    }

    public String getD3ModelRecogUrl() {
        return d3ModelRecogUrl;
    }

    public void setD3ModelRecogUrl(String d3ModelRecogUrl) {
        this.d3ModelRecogUrl = d3ModelRecogUrl;
    }

    public String getD3ModelUrl() {
        return d3ModelUrl;
    }

    public void setD3ModelUrl(String d3ModelUrl) {
        this.d3ModelUrl = d3ModelUrl;
    }

    public Image getPlaneImage() {
        return planeImage;
    }

    public void setPlaneImage(Image planeImage) {
        this.planeImage = planeImage;
    }

    public Image getD3Image() {
        return d3Image;
    }

    public void setD3Image(Image d3Image) {
        this.d3Image = d3Image;
    }
}


