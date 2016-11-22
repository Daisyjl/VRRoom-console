package com.leoman.house.entity;

import com.leoman.direction.entity.Direction;
import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * 楼盘的每一栋
 * Created by Daisy on 2016/10/18.
 */
@Entity
@Table(name = "t_house_ridgepole")
public class HouseRidgepole extends BaseEntity{

    @Column(name = "house_id")
    private Long houseId;//所在楼盘

    @Column(name = "name")
    private String name;//该栋楼名称

    @Column(name = "floor_num")
    private Long floorNum;//该栋楼楼层总数

    @Column(name = "min_space")
    private String minSpace;//最小楼间距

    @Column(name = "direction_id")
    private Long directionId;//方位id

    @Transient
    private List<HouseRidgepoleFloor> floorList;

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

    public Long getFloorNum() {
        return floorNum;
    }

    public void setFloorNum(Long floorNum) {
        this.floorNum = floorNum;
    }

    public String getMinSpace() {
        return minSpace;
    }

    public void setMinSpace(String minSpace) {
        this.minSpace = minSpace;
    }

    public List<HouseRidgepoleFloor> getFloorList() {
        return floorList;
    }

    public void setFloorList(List<HouseRidgepoleFloor> floorList) {
        this.floorList = floorList;
    }

    public Long getDirectionId() {
        return directionId;
    }

    public void setDirectionId(Long directionId) {
        this.directionId = directionId;
    }
}
