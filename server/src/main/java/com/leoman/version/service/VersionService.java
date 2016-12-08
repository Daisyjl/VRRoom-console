package com.leoman.version.service;

import com.leoman.common.core.Result;
import com.leoman.common.service.GenericManager;
import com.leoman.version.entity.Version;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2016/9/6.
 */
public interface VersionService extends GenericManager<Version> {

    public Result saveVersion(Version version, MultipartFile apkFile);

}
