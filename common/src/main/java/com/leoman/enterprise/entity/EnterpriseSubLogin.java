package com.leoman.enterprise.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.*;

/**
 * 子企业登录
 * Created by Daisy on 2016/10/11.
 */
@Entity
@Table(name = "t_enterprise_sub_login")
public class EnterpriseSubLogin extends BaseEntity{

    @Column(name = "username")
    private String username;//账号

    @Column(name = "password")
    private String password;//密码

    @Column(name = "login_ip")
    private String loginIp;//登录ip

    @Column(name = "enterprise_sub_id")
    private Long enterpriseSubId;//子企业id

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Long getEnterpriseSubId() {
        return enterpriseSubId;
    }

    public void setEnterpriseSubId(Long enterpriseSubId) {
        this.enterpriseSubId = enterpriseSubId;
    }
}
