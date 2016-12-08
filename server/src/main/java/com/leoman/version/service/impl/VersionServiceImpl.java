package com.leoman.version.service.impl;

import com.leoman.image.service.UploadImageService;
import com.leoman.utils.ClassUtil;
import com.leoman.version.dao.VersionDao;
import com.leoman.version.entity.Version;
import com.leoman.version.service.VersionService;
import com.leoman.common.core.ErrorType;
import com.leoman.common.core.Result;
import com.leoman.common.service.impl.GenericManagerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Daisy on 2016/10/11.
 */
@Service
public class VersionServiceImpl extends GenericManagerImpl<Version,VersionDao> implements VersionService {

    @Autowired
    private VersionDao versionDao;

    @Autowired
    private UploadImageService uploadImageService;

    /**
     * 保存
     * @param version
     * @return
     */
    @Override
    @Transactional
    public Result saveVersion(Version version, MultipartFile apkFile){

        String apkUrl = uploadImageService.uploadFile(apkFile);
        version.setApkUrl(apkUrl);

        if(version.getId() == null){
            Version v = versionDao.findByNo(version.getVersionNo());
            if(v != null){
                return Result.failure(ErrorType.ERROR_CODE_00024);//该版本号已存在
            }
            version.setIsUpdate(1);//默认每个版本都需要更新
        }else{
            Version org = versionDao.findOne(version.getId());
            ClassUtil.copyProperties(org, version);
            version = org;
        }

        versionDao.save(version);

        return Result.success();
    }

}
