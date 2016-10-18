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

    @ManyToOne
    @JoinColumn(name = "ridgepole_id")
    private HouseRidgepoleFloor ridgepoleFloor;//所在层

    @Column(name = "room_no")
    private String roomNo;//房间编号

    @Column(name = "is_sale")
    private Integer isSale;//是否已卖（1-是，0-否）

    public HouseRidgepoleFloor getRidgepoleFloor() {
        return ridgepoleFloor;
    }

    public void setRidgepoleFloor(HouseRidgepoleFloor ridgepoleFloor) {
        this.ridgepoleFloor = ridgepoleFloor;
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
}
