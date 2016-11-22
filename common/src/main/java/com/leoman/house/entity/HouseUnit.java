package com.leoman.house.entity;

import com.alibaba.druid.util.StringUtils;
import com.leoman.bedroom.entity.Bedroom;
import com.leoman.direction.entity.Direction;
import com.leoman.entity.BaseEntity;
import com.leoman.entity.Configue;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * 楼盘户型
 * Created by Daisy on 2016/10/12.
 */
@Entity
@Table(name = "t_house_unit ")
public class HouseUnit extends BaseEntity {

    @Column(name = "house_id")
    private Long houseId;//所在楼盘

    @Column(name = "name")
    private String name;//户型名称

    @Column(name = "bedroom_id")
    private Long bedroomId;//居室

    @Column(name = "total_price")
    private BigDecimal totalPrice;//参考总价

    @Column(name = "total_area")
    private BigDecimal totalArea;//面积

    @Column(name = "full_view")
    private String fullView;//360全景

    @Column(name = "direction_id")
    private Long directionId;//方位id

    @Column(name = "d3_model_recog_url")
    private String d3ModelRecogUrl;//3D模型识别图

    @Column(name = "d3_model_url")
    private String d3ModelUrl;//3D模型

    @ManyToOne
    @JoinColumn(name = "plane_image_id")
    private Image planeImage;//平面图

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "unit_id")
    private List<HouseUnitImage> d3ImageList;//3d户型图列表

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getBedroomId() {
        return bedroomId;
    }

    public void setBedroomId(Long bedroomId) {
        this.bedroomId = bedroomId;
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
        if(!StringUtils.isEmpty(this.d3ModelRecogUrl)){
            return Configue.getUploadUrl() + d3ModelRecogUrl;
        }
        return d3ModelRecogUrl;
    }

    public void setD3ModelRecogUrl(String d3ModelRecogUrl) {
        this.d3ModelRecogUrl = d3ModelRecogUrl;
    }

    public String getD3ModelUrl() {
        if(!StringUtils.isEmpty(this.d3ModelUrl)){
            return Configue.getUploadUrl() + d3ModelUrl;
        }
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

    public List<HouseUnitImage> getD3ImageList() {
        return d3ImageList;
    }

    public void setD3ImageList(List<HouseUnitImage> d3ImageList) {
        this.d3ImageList = d3ImageList;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public HouseUnit(){}

    public HouseUnit(Long id) {
        super.setId(id);
    }

    public Long getDirectionId() {
        return directionId;
    }

    public void setDirectionId(Long directionId) {
        this.directionId = directionId;
    }
}


