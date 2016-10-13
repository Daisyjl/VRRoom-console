package com.leoman.enterprise.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.*;

/**
 * Created by Daisy on 2016/10/11.
 */
@Entity
@Table(name = "t_enterprise_login")
public class EnterpriseLogin extends BaseEntity{

    @Column(name = "username")
    private String username;//账号

    @Column(name = "password")
    private String password;//密码

    @Column(name = "login_ip")
    private String loginIp;//登录ip

    @ManyToOne
    @JoinColumn(name = "enterprise_id")
    private Enterprise enterprise;//企业

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

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }
}
