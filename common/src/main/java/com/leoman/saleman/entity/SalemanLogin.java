package com.leoman.saleman.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.*;

/**
 * 销售顾问登录表
 * Created by Daisy on 2016/10/20.
 */
@Entity
@Table(name = "t_saleman_login")
public class SalemanLogin extends BaseEntity{

    @Column(name = "username")
    private String username;//账号

    @Column(name = "password")
    private String password;//密码

    @ManyToOne
    @JoinColumn(name= "saleman_id")
    private Saleman saleman;//销售顾问

    @Column(name = "login_ip")
    private String loginIp;//登录ip

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

    public Saleman getSaleman() {
        return saleman;
    }

    public void setSaleman(Saleman saleman) {
        this.saleman = saleman;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }
}
