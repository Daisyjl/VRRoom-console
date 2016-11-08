package com.leoman.direction.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.house.entity.HouseAlbumImage;
import com.leoman.image.entity.Image;

import javax.persistence.*;
import java.util.List;

/**
 * 方向
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_direction")
public class Direction extends BaseEntity{

    @Column(name = "name")
    private String name;//方位名称

    @ManyToOne
    @JoinColumn(name = "image_id")
    private Image image;//方位图

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Direction(){}

    public Direction(Long id) {
        super.setId(id);
    }
}
