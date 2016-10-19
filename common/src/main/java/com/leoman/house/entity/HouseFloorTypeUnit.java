package com.leoman.house.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 楼盘楼层类型和户型关系
 * Created by Daisy on 2016/10/17.
 */
@Entity
@Table(name = "t_house_floor_type_unit")
public class HouseFloorTypeUnit extends BaseEntity{

    @ManyToOne
    @JoinColumn(name = "floor_type_id")
    private HouseFloorType floorType;//楼层类型

    @ManyToOne
    @JoinColumn(name = "unit_id")
    private HouseUnit unit;//户型

    @ManyToOne
    @JoinColumn(name = "transverse_image_id")
    private Image transverseImage;//横切面图

    @Column(name = "room_no")
    private Integer roomNo;//房间编号：1,2,3或者A,B,C等，只是为了把选择的户型和横切面图对应起来

    public HouseFloorType getFloorType() {
        return floorType;
    }

    public void setFloorType(HouseFloorType floorType) {
        this.floorType = floorType;
    }

    public HouseUnit getUnit() {
        return unit;
    }

    public void setUnit(HouseUnit unit) {
        this.unit = unit;
    }

    public Image getTransverseImage() {
        return transverseImage;
    }

    public void setTransverseImage(Image transverseImage) {
        this.transverseImage = transverseImage;
    }

    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }
}
