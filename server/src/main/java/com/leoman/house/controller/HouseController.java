package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.service.EnterpriseService;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseAlbum;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.service.HouseAlbumService;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.HouseUnitService;
import com.leoman.house.service.impl.HouseServiceImpl;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.province.entity.Province;
import com.leoman.province.service.ProvinceService;
import com.leoman.utils.JsonUtil;
import com.leoman.utils.Md5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.List;
import java.util.Map;

/**
 * 楼层管理
 * Created by Daisy on 2016/10/12.
 */
@Controller
@RequestMapping(value = "admin/house")
public class HouseController extends GenericEntityController<House,House,HouseServiceImpl> {

    @Autowired
    private HouseService houseService;

    @Autowired
    private EnterpriseService enterpriseService;

    @RequestMapping(value = "/index")
    public String index(){
        return "house/house_list_copy";
    }

    /**
     * 列表
     * @param draw
     * @param start
     * @param length
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(String name, Integer draw, Integer start, Integer length) {
        int pagenum = getPageNum(start, length);
        Query query = Query.forClass(House.class, houseService);
        query.setPagenum(pagenum);
        query.setPagesize(length);
        query.eq("status", 0);
        query.like("name", name);
        Page<House> page = houseService.queryPage(query);
        for (House house:page.getContent()) {
            houseService.setHouse(house);
        }

        return DataTableFactory.fitting(draw, page);
    }

    /**
     * 跳转新增页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(Long id, Model model){
        if(id != null){
            House house = houseService.queryByPK(id);
            model.addAttribute("house", house);
        }
        List<Enterprise> enterpriseList = enterpriseService.queryAll();
        model.addAttribute("enterpriseList", enterpriseList);
        return "house/house_add_copy";
    }

    /**
     * 跳转编辑基本信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public String editBasic(@PathVariable("id") Long id, Model model){
        if(id != null){
            House house = houseService.queryByPK(id);
            model.addAttribute("house", house);
        }
        List<Enterprise> enterpriseList = enterpriseService.queryAll();
        model.addAttribute("enterpriseList", enterpriseList);
        return "house/house_edit_copy";
    }


    /**
     * 保存楼盘的基本信息
     * @param house
     * @param multipartRequest
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(House house, MultipartRequest multipartRequest) {

        Result result = houseService.saveHouse(house, multipartRequest);
        return result;
    }

    /**
     * 删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Result del(String ids) {
        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                House house = houseService.queryByPK(Long.valueOf(id));
                house.setStatus(1);
                houseService.save(house);
            }
        }

        return Result.success();
    }

}
