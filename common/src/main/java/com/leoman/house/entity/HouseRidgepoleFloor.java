package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.util.List;

/**
 * 楼盘的每一栋的每一层
 * Created by Daisy on 2016/10/18.
 */
@Entity
@Table(name = "t_house_ridgepole_floor")
public class HouseRidgepoleFloor extends BaseEntity{

    @ManyToOne
    @JoinColumn(name = "ridgepole_id")
    private HouseRidgepole ridgepole;//所在栋

    @Column(name = "floor_no")
    private Long floorNo;//楼层编号

    @ManyToOne
    @JoinColumn(name = "floor_type_id")
    private HouseFloorType floorType;//楼层类型

    @Transient
    private List<HouseRidgepoleFloorRoom> roomList;

    public HouseRidgepole getRidgepole() {
        return ridgepole;
    }

    public void setRidgepole(HouseRidgepole ridgepole) {
        this.ridgepole = ridgepole;
    }

    public Long getFloorNo() {
        return floorNo;
    }

    public void setFloorNo(Long floorNo) {
        this.floorNo = floorNo;
    }

    public HouseFloorType getFloorType() {
        return floorType;
    }

    public void setFloorType(HouseFloorType floorType) {
        this.floorType = floorType;
    }

    public List<HouseRidgepoleFloorRoom> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<HouseRidgepoleFloorRoom> roomList) {
        this.roomList = roomList;
    }
}
