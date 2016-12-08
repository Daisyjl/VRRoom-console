package com.leoman.sysParam.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * 系统参数
 * Created by Daisy on 2016/12/8.
 */
@Entity
@Table(name = "t_sys_param")
public class SysParam extends BaseEntity{

    @Column(name = "type")
    private Integer type;//类型：1-贷款利率，2-首付百分比

    @Column(name = "sys_value")
    private BigDecimal sysValue;//值

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getSysValue() {
        return sysValue;
    }

    public void setSysValue(BigDecimal sysValue) {
        this.sysValue = sysValue;
    }
}
