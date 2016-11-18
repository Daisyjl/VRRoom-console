package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.decorateType.entity.DecorateType;
import com.leoman.decorateType.service.DecorateTypeService;
import com.leoman.enterprise.entity.Enterprise;
import com.leoman.enterprise.service.EnterpriseService;
import com.leoman.feature.entity.Feature;
import com.leoman.feature.service.FeatureService;
import com.leoman.house.entity.House;
import com.leoman.house.service.HouseImageService;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.impl.HouseServiceImpl;
import com.leoman.image.entity.Image;
import com.leoman.utils.ImageUtil;
import com.leoman.utils.JsonUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.LongRange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import java.util.ArrayList;
import java.util.Arrays;
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

    @Autowired
    private HouseImageService houseImageService;

    @Autowired
    private FeatureService featureService;

    @Autowired
    private DecorateTypeService decorateTypeService;

    @RequestMapping(value = "/index")
    public String index(){
        return "house/house_list";
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
        query.notEq("status", 1);
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
            if(house != null){
                List<Image> imageList = houseImageService.findByHouseId(house.getId());
                model.addAttribute("house", house);
                model.addAttribute("imageList", JSONArray.fromObject(imageList));
            }
        }
        List<Enterprise> enterpriseList = enterpriseService.queryAll();
        List<DecorateType> decorateTypeList = decorateTypeService.queryAll();
        model.addAttribute("enterpriseList", enterpriseList);
        model.addAttribute("decorateTypeList", decorateTypeList);
        return "house/house_add";
    }

    /**
     * 跳转编辑基本信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit")
    public String editBasic(Long id, Model model) throws Exception {
        List<Feature> selectedFeatureList = new ArrayList<>();
        if(id != null){
            House house = houseService.queryByPK(id);
            if(house != null){
                //楼盘的特色列表
                List<Long> ids = new ArrayList<>();
                if(StringUtils.isNotEmpty(house.getFeature())){
                    String[] idArr = house.getFeature().split(",");
                    for (String idStr:idArr) {
                        ids.add(Long.valueOf(idStr));
                    }
                    selectedFeatureList = featureService.findByIds(ids);
                }
                model.addAttribute("house", house);
            }
        }
        //企业列表
        List<Enterprise> enterpriseList = enterpriseService.queryAll();
        //装修类型
        List<DecorateType> decorateTypeList = decorateTypeService.queryAll();
        //特色列表
        List<Feature> featureList = featureService.queryAll();
        model.addAttribute("enterpriseList", enterpriseList);
        model.addAttribute("decorateTypeList", decorateTypeList);
        model.addAttribute("featureList", JSONArray.fromObject(featureList));
        model.addAttribute("selectedFeatureList", JSONArray.fromObject(selectedFeatureList));
        return "house/house_edit";
    }

    /**
     * 获取图片列表
     * @param houseId
     * @return
     */
    @RequestMapping(value = "/imageList", method = RequestMethod.POST)
    @ResponseBody
    public Result imageList(Long houseId) {
        List<Image> imageList = houseImageService.findByHouseId(houseId);
        return Result.success(imageList);
    }


    /**
     * 保存楼盘的基本信息
     * @param house
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(House house, String imageIds, String district) {

        Result result = houseService.saveHouse(house, imageIds, district);
        return result;
    }

    /**
     * 删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
    @ResponseBody
    public Result updateStatus(String ids, Integer status) {
        String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                House house = houseService.queryByPK(Long.valueOf(id));
                house.setStatus(status);
                houseService.save(house);
            }
        }

        return Result.success();
    }

    /**
     * 保存大图
     * @param houseId
     * @param multipartRequest
     * @return
     */
    @RequestMapping(value = "/saveBigImage", method = RequestMethod.POST)
    @ResponseBody
    public Result saveBigImage(Long houseId, MultipartRequest multipartRequest) {

        Result result = houseService.saveBigImage(houseId, multipartRequest);
        return result;
    }

}
