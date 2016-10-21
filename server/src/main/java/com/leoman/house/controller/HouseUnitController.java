package com.leoman.house.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.entity.Configue;
import com.leoman.house.entity.House;
import com.leoman.house.entity.HouseUnit;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.HouseService;
import com.leoman.house.service.HouseUnitService;
import com.leoman.house.service.impl.HouseServiceImpl;
import com.leoman.image.entity.Image;
import com.leoman.image.service.UploadImageService;
import com.leoman.utils.JsonUtil;
import com.leoman.utils.UploadUtil;
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
 * 楼层户型管理
 * Created by Daisy on 2016/10/13.
 */
@Controller
@RequestMapping(value = "admin/house/unit")
public class HouseUnitController extends GenericEntityController<House,House,HouseServiceImpl> {

    @Autowired
    private HouseService houseService;

    @Autowired
    private HouseUnitService houseUnitService;

    @Autowired
    private UploadImageService uploadImageService;

    /**
     * 跳转编辑楼盘户型页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public String editUnit(@PathVariable("id") Long id, Model model){
        if(id != null){
            House house = houseService.queryByPK(id);
            model.addAttribute("house", house);
        }
        model.addAttribute("houseId", id);
        return "house/house_edit_unit";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Result list(Long houseId) {
        List<HouseUnit> list = houseUnitService.findByHouseId(houseId);
        for (HouseUnit hu:list) {
            if(hu.getPlaneImage() != null){
                hu.getPlaneImage().setPath(Configue.getUploadUrl()+hu.getPlaneImage().getPath());
            }
        }

        return new Result().success(createMap("list",list));
    }

    /**
     * 保存新增的楼盘户型
     * @param houseUnit
     * @return
     */
    @RequestMapping(value = "/saveAdd", method = RequestMethod.POST)
    @ResponseBody
    public Result saveUnit(HouseUnit houseUnit, MultipartRequest multipartRequest) {

        MultipartFile planeFile = multipartRequest.getFile("planeFile");
        if (null != planeFile) {
            Image planeImage = uploadImageService.uploadImage(planeFile);
            houseUnit.setPlaneImage(planeImage);//平面图
        }

        MultipartFile d3File = multipartRequest.getFile("d3File");
        if (null != d3File) {
            Image d3Image = uploadImageService.uploadImage(d3File);
            houseUnit.setD3Image(d3Image);//3d图片
        }

        MultipartFile d3ModelRecogFile = multipartRequest.getFile("d3ModelRecogFile");
        if (null != d3ModelRecogFile) {
            String d3ModelRecogUrl = uploadImageService.uploadFile(d3ModelRecogFile);
            houseUnit.setD3ModelRecogUrl(d3ModelRecogUrl);//3D模型识别图
        }

        MultipartFile d3ModelFile = multipartRequest.getFile("d3ModelFile");
        if (null != d3ModelFile) {
            String d3ModelUrl = uploadImageService.uploadFile(d3ModelFile);
            houseUnit.setD3ModelUrl(d3ModelUrl);//3D模型
        }

        houseUnitService.save(houseUnit);
        return Result.success();
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(Long id) {

        /*String[] idArr = JsonUtil.json2Obj(ids,String[].class);
        for (String id : idArr) {
            if(StringUtils.isNotEmpty(id)){
                houseUnitService.deleteByPK(Long.valueOf(id));
            }
        }*/
        HouseUnit hu = houseUnitService.queryByPK(id);
        if(hu != null){
            houseUnitService.delete(hu);
        }
        return new Result().success();
    }


}
