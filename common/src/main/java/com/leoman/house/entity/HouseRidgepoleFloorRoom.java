package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 楼盘的每一栋的每一层的每一个房间
 * Created by Daisy on 2016/10/18.
 */
@Entity
@Table(name = "t_house_ridgepole_floor_room")
public class HouseRidgepoleFloorRoom extends BaseEntity{

    /*@ManyToOne
    @JoinColumn(name = "ridgepole_floor_id")
    private HouseRidgepoleFloor ridgepoleFloor;//所在层*/

    @Column(name = "ridgepole_floor_id")
    private Long ridgepoleFloorId;

    @Column(name = "room_no")
    private String roomNo;//房间编号

    @Column(name = "is_sale")
    private Integer isSale;//是否已卖（1-是，0-否）

    @Transient
    private HouseFloorTypeUnit typeUnit;//此房间对应的户型关系

    @Column(name = "type_unit_id")
    private Long typeUnitId;

    public Long getRidgepoleFloorId() {
        return ridgepoleFloorId;
    }

    public void setRidgepoleFloorId(Long ridgepoleFloorId) {
        this.ridgepoleFloorId = ridgepoleFloorId;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public Integer getIsSale() {
        return isSale;
    }

    public void setIsSale(Integer isSale) {
        this.isSale = isSale;
    }

    public HouseFloorTypeUnit getTypeUnit() {
        return typeUnit;
    }

    public void setTypeUnit(HouseFloorTypeUnit typeUnit) {
        this.typeUnit = typeUnit;
    }

    public Long getTypeUnitId() {
        return typeUnitId;
    }

    public void setTypeUnitId(Long typeUnitId) {
        this.typeUnitId = typeUnitId;
    }
}
