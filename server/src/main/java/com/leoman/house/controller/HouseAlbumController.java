package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.entity.Configue;
import com.leoman.house.entity.*;
import com.leoman.house.service.HouseAlbumImageService;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.impl.HouseAlbumServiceImpl;
import com.leoman.house.service.impl.HouseServiceImpl;
import com.leoman.utils.DateUtils;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 楼层相册管理
 * Created by Daisy on 2016/10/14.
 */
@Controller
@RequestMapping(value = "admin/house/album")
public class HouseAlbumController extends GenericEntityController<HouseAlbum,HouseAlbum,HouseAlbumServiceImpl> {

    @Autowired
    private HouseAlbumService houseAlbumService;

    @Autowired
    private HouseAlbumImageService houseAlbumImageService;

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Result list(Long houseId) {
        List<HouseAlbum> list = houseAlbumService.queryAll();
        for (HouseAlbum ha:list) {
            List<HouseAlbumImage> imageList = houseAlbumImageService.findImageNum(houseId, ha.getId());
            ha.setImageNum(imageList==null?0l:imageList.size());
        }

        return new Result().success(createMap("list",list));
    }

    /**
     * 保存楼盘相册
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(HouseAlbumImage albumImage) {

        houseAlbumImageService.save(albumImage);
        return Result.success();
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(String ids) {

        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                houseAlbumImageService.deleteByPK(Long.valueOf(id));
            }
        }

        return new Result().success();
    }


}
