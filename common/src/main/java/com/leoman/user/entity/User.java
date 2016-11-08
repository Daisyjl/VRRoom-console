package com.leoman.user.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 用户
 * Created by Daisy on 2016/11/7.
 */
@Table(name = "t_user")
@Entity
public class User extends BaseEntity {

    @Column(name = "mobile")
    private String mobile;

    @Column(name = "nickname")
    private String nickname;

    @Column(name = "sex")
    private Integer sex;//性别(0-男，1-女)

    @Column(name = "birthday")
    private Long birthday;//出生日期

    @ManyToOne
    @JoinColumn(name = "image_id")
    private Image image;

    @Column(name = "saleman_id")
    private Long salemanId;//绑定的销售顾问id

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Long getBirthday() {
        return birthday;
    }

    public void setBirthday(Long birthday) {
        this.birthday = birthday;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Long getSalemanId() {
        return salemanId;
    }

    public void setSalemanId(Long salemanId) {
        this.salemanId = salemanId;
    }
}
