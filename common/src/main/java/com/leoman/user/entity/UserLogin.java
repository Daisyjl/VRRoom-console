package com.leoman.user.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Daisy on 2016/11/7.
 */
@Table(name = "t_user_login")
@Entity
public class UserLogin extends BaseEntity{

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "login_ip")
    private String loginIp;

    @Column(name = "user_id")
    private Long userId;//用户

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

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
}
