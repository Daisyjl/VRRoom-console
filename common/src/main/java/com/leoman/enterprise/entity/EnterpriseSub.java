package com.leoman.enterprise.entity;

import com.leoman.area.city.entity.City;
import com.leoman.entity.BaseEntity;

import javax.persistence.*;

/**
 * 子企业
 * Created by Daisy on 2016/10/11.
 */
@Entity
@Table(name = "t_enterprise_sub")
public class EnterpriseSub extends BaseEntity{

    @Column(name = "enterprise_id")
    private Long enterpriseId;//所属企业

    @Column(name = "username")
    private String username;//账号

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;//城市

    @Transient
    private Enterprise enterprise;//所属企业

    public Long getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Long enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public City getCity() {
        return city;
    }

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }

    public void setCity(City city) {
        this.city = city;
    }
}
