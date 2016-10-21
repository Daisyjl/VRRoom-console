package com.leoman.house.entity.vo;

import com.leoman.house.entity.HouseFloorType;
import com.leoman.image.entity.Image;

import java.math.BigInteger;

/**
 * 楼盘动态
 * Created by Daisy on 2016/10/12.
 */
public class RidgepoleFloorVo{

    private BigInteger floorTypeId;

    private BigInteger directionImageId;

    private String floorNos;

    private Image directionImage;

    private HouseFloorType floorType;

    public BigInteger getFloorTypeId() {
        return floorTypeId;
    }

    public void setFloorTypeId(BigInteger floorTypeId) {
        this.floorTypeId = floorTypeId;
    }

    public BigInteger getDirectionImageId() {
        return directionImageId;
    }

    public void setDirectionImageId(BigInteger directionImageId) {
        this.directionImageId = directionImageId;
    }

    public String getFloorNos() {
        return floorNos;
    }

    public void setFloorNos(String floorNos) {
        this.floorNos = floorNos;
    }

    public Image getDirectionImage() {
        return directionImage;
    }

    public void setDirectionImage(Image directionImage) {
        this.directionImage = directionImage;
    }

    public HouseFloorType getFloorType() {
        return floorType;
    }

    public void setFloorType(HouseFloorType floorType) {
        this.floorType = floorType;
    }
}
