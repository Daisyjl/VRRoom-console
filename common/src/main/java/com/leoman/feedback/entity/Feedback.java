package com.leoman.feedback.entity;

import com.leoman.entity.BaseEntity;
import com.leoman.user.entity.User;

import javax.persistence.*;

/**
 * 居室
 * Created by Daisy on 2016/11/7.
 */
@Entity
@Table(name = "t_feedback")
public class Feedback extends BaseEntity{

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "contact")
    private String contact;

    @Column(name = "content")
    private String content;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
