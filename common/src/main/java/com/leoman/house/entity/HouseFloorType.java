package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.util.List;

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

    @ManyToOne
    @JoinColumn(name = "big_image_id")
    private Image bigImage;//楼层图

    @ManyToOne
    @JoinColumn(name = "small_image_id")
    private Image smallImage;//楼层图锚点

    @Transient
    private List<HouseFloorTypeUnit> typeUnitList;

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

    public HouseFloorType(){}

    public HouseFloorType(Long id) {
        super.setId(id);
    }

    public List<HouseFloorTypeUnit> getTypeUnitList() {
        return typeUnitList;
    }

    public void setTypeUnitList(List<HouseFloorTypeUnit> typeUnitList) {
        this.typeUnitList = typeUnitList;
    }

    public Image getBigImage() {
        return bigImage;
    }

    public void setBigImage(Image bigImage) {
        this.bigImage = bigImage;
    }

    public Image getSmallImage() {
        return smallImage;
    }

    public void setSmallImage(Image smallImage) {
        this.smallImage = smallImage;
    }
}
