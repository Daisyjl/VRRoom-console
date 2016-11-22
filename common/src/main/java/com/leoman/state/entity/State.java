package com.leoman.state.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 文案
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_state")
public class State extends BaseEntity{

    @Column(name = "type")
    private Integer type;//类型：1-服务条款 2-注册协议

    @Column(name = "content")
    private String content;//内容

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
