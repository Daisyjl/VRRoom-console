package com.leoman.saleman.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.house.entity.House;
import com.leoman.image.entity.Image;

import javax.persistence.*;

/**
 * 销售顾问
 * Created by Daisy on 2016/10/20.
 */
@Entity
@Table(name = "t_saleman")
public class Saleman extends BaseEntity{

    @Column(name = "name")
    private String name;//姓名

    @Column(name = "account_no")
    private String accountNo;//账号

    @Column(name = "mobile")
    private String mobile;//手机号

    @Column(name = "enterprise_id")
    private Long enterpriseId;//企业id

    @Column(name = "house_id")
    private Long houseId;//对应楼盘id

    @Column(name = "remark")
    private String remark;//备注

    @ManyToOne
    @JoinColumn(name = "image_id")
    private Image image;//头像

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Long getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Long enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

}
