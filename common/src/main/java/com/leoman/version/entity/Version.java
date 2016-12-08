package com.leoman.version.entity;

import com.leoman.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 版本
 * Created by Daisy on 2016/12/8.
 */
@Entity
@Table(name = "t_version")
public class Version extends BaseEntity{

    @Column(name = "version_no")
    private String versionNo;//版本号

    @Column(name = "apk_url")
    private String apkUrl;//安卓下载路径

    @Column(name = "appstore_url")
    private String appstoreUrl;//ios下载路径

    @Column(name = "is_update")
    private Integer isUpdate;//是否需要更新：1-是，0-否

    public String getVersionNo() {
        return versionNo;
    }

    public void setVersionNo(String versionNo) {
        this.versionNo = versionNo;
    }

    public String getAppstoreUrl() {
        return appstoreUrl;
    }

    public void setAppstoreUrl(String appstoreUrl) {
        this.appstoreUrl = appstoreUrl;
    }

    public String getApkUrl() {
        return apkUrl;
    }

    public void setApkUrl(String apkUrl) {
        this.apkUrl = apkUrl;
    }

    public Integer getIsUpdate() {
        return isUpdate;
    }

    public void setIsUpdate(Integer isUpdate) {
        this.isUpdate = isUpdate;
    }
}
