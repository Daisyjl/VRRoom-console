package com.leoman.area.region.entity;

import com.leoman.area.city.entity.City;

import javax.persistence.*;

/**
 * 区
 */
@Entity
@Table(name = "t_region")
public class Region {

    @Id
    private Integer id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }
}
