package com.leoman.house.entity;

import com.leoman.area.region.entity.Region;
import com.leoman.decorateType.entity.DecorateType;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 楼盘
 * Created by Daisy on 2016/10/12.
 */
@Entity
@Table(name = "t_house")
public class House extends BaseEntity{

    @Column(name = "name")
    private String name;//名称

    @Column(name = "label")
    private String label;//标签

    @Column(name = "open_time")
    private Long openTime;//开盘时间

    @Column(name = "is_open_wait")
    private Integer isOpenWait;//开盘时间是否待定（1-是，0-否）

    @Column(name = "developers")
    private String developers;//开发商

    @Column(name = "deal_time")
    private Long dealTime;//交房时间

    @Column(name = "is_deal_wait")
    private Integer isDealWait;//交房时间是否待定（1-是，0-否）

    @Column(name = "property_limit")
    private Integer propertyLimit;//产权年限

    @Column(name = "decorate_type_id")
    private Long decorateTypeId;//装修类型

    @Column(name = "plot_ratio")
    private BigDecimal plotTatio;//容积率

    @Column(name = "greening")
    private BigDecimal greening;//绿化比例

    @Column(name = "household_num")
    private Long householdNum;//总户数

    @Column(name = "property_company")
    private String propertyCompany;//物业公司

    @Column(name = "privilege")
    private String privilege;//购房优惠

    @Column(name = "unit_price")
    private BigDecimal unitPrice;//预估单价

    @Column(name = "address")
    private String address;//楼盘地址

    @Column(name = "address_detail")
    private String addressDetail;//详细地址

    @ManyToOne
    @JoinColumn(name = "big_image_id")
    private Image bigImage;//高清沙盘图，标图用

    @ManyToOne
    @JoinColumn(name = "enterprise_id")
    private Enterprise enterprise;//企业

    @Column(name = "lng")
    private Double lng;//经度

    @Column(name = "lat")
    private Double lat;//纬度

    @Column(name = "status")
    private Integer status;//数据状态：0-审核中，1-删除，2-审核通过，3-上架，4-下架

    @ManyToOne
    @JoinColumn(name = "region_id")
    private Region region;//区

    @Column(name = "is_door")
    private Integer isDoor;//是否上门（1-是，0-否）

    @Column(name = "is_live")
    private Integer isLive;//是否直播：1-是，0-否

    @Column(name = "feature")
    private String feature;//特色ids

    @Column(name = "intro")
    private String intro;//简介

    @Transient
    private Integer roomNum;//房间数

    @Transient
    private Integer housePercent;//资料完善百分比

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Long getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Long openTime) {
        this.openTime = openTime;
    }

    public Integer getIsOpenWait() {
        return isOpenWait;
    }

    public void setIsOpenWait(Integer isOpenWait) {
        this.isOpenWait = isOpenWait;
    }

    public String getDevelopers() {
        return developers;
    }

    public void setDevelopers(String developers) {
        this.developers = developers;
    }

    public Long getDealTime() {
        return dealTime;
    }

    public void setDealTime(Long dealTime) {
        this.dealTime = dealTime;
    }

    public Integer getIsDealWait() {
        return isDealWait;
    }

    public void setIsDealWait(Integer isDealWait) {
        this.isDealWait = isDealWait;
    }

    public Integer getPropertyLimit() {
        return propertyLimit;
    }

    public void setPropertyLimit(Integer propertyLimit) {
        this.propertyLimit = propertyLimit;
    }

    public Long getDecorateTypeId() {
        return decorateTypeId;
    }

    public void setDecorateTypeId(Long decorateTypeId) {
        this.decorateTypeId = decorateTypeId;
    }

    public BigDecimal getPlotTatio() {
        return plotTatio;
    }

    public void setPlotTatio(BigDecimal plotTatio) {
        this.plotTatio = plotTatio;
    }

    public BigDecimal getGreening() {
        return greening;
    }

    public void setGreening(BigDecimal greening) {
        this.greening = greening;
    }

    public Long getHouseholdNum() {
        return householdNum;
    }

    public void setHouseholdNum(Long householdNum) {
        this.householdNum = householdNum;
    }

    public String getPropertyCompany() {
        return propertyCompany;
    }

    public void setPropertyCompany(String propertyCompany) {
        this.propertyCompany = propertyCompany;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(Integer roomNum) {
        this.roomNum = roomNum;
    }

    public Integer getHousePercent() {
        return housePercent;
    }

    public void setHousePercent(Integer housePercent) {
        this.housePercent = housePercent;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public Image getBigImage() {
        return bigImage;
    }

    public void setBigImage(Image bigImage) {
        this.bigImage = bigImage;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Integer getIsDoor() {
        return isDoor;
    }

    public void setIsDoor(Integer isDoor) {
        this.isDoor = isDoor;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Integer getIsLive() {
        return isLive;
    }

    public void setIsLive(Integer isLive) {
        this.isLive = isLive;
    }
}
