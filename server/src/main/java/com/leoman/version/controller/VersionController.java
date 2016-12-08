package com.leoman.version.controller;

import com.leoman.entity.Configue;
import com.leoman.version.entity.Version;
import com.leoman.version.service.VersionService;
import com.leoman.version.service.impl.VersionServiceImpl;
import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.Map;

/**
 * 版本管理
 * Created by Daisy on 2016/12/8.
 */
@Controller
@RequestMapping(value = "admin/version")
public class VersionController extends GenericEntityController<Version,Version,VersionServiceImpl> {

    @Autowired
    private VersionService versionService;

    @RequestMapping(value = "/index")
    public String index(){
        return "version/version_list";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(Version.class, versionService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        Page<Version> page = versionService.queryPage(query);
        for (Version version:page.getContent()) {
            if(StringUtils.isNotBlank(version.getApkUrl())){
                version.setApkUrl(Configue.getUploadUrl() + version.getApkUrl());
            }
        }
        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 编辑
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(Long id, Model model){

        if(id != null){
            Version version = versionService.queryByPK(id);
            model.addAttribute("version", version);
        }
        return "version/version_add";
    }

    /**
     * 保存
     * @param version
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Version version, MultipartRequest multipartRequest) {

        MultipartFile apkFile = multipartRequest.getFile("apkFile");
        Result result = versionService.saveVersion(version, apkFile);
        return result;
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result del(String ids) {
        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                versionService.deleteByPK(Long.valueOf(id));
            }
        }

        return Result.success();
    }


}
