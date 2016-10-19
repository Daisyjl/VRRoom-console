package com.leoman.label.controller;

import com.leoman.common.controller.common.GenericEntityController;
import com.leoman.common.core.Result;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.common.service.Query;
import com.leoman.house.entity.HouseDynamic;
import com.leoman.house.service.HouseDynamicService;
import com.leoman.house.service.impl.HouseDynamicServiceImpl;
import com.leoman.label.entity.Label;
import com.leoman.label.service.LabelService;
import com.leoman.utils.DateUtils;
import com.leoman.utils.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

/**
 * 楼层动态管理
 * Created by Daisy on 2016/10/14.
 */
@Controller
@RequestMapping(value = "admin/label")
public class LabelController extends GenericEntityController<HouseDynamic,HouseDynamic,HouseDynamicServiceImpl> {

    @Autowired
    private LabelService labelService;

    /**
     * 根据标签id查询标签最后停留的位置
     *
     * @param objectId
     * @param labelId
     * @return
     */
    @RequestMapping("/queryLastPosition")
    @ResponseBody
    public Label queryLastPosition(Integer objectId, String labelId) {
        try {
            Label label = labelService.findLastPosition(objectId, labelId);

            return label;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 保存标签信息
     *
     * @param objectId
     * @param labelId
     * @param name
     * @param objectType
     * @param height
     * @param width
     * @param leftPoint
     * @param topPoint
     * @param productId
     * @return
     */
    @RequestMapping("/saveLabelInfo")
    @ResponseBody
    public Integer saveLabelInfo(Integer objectId,
                                 String labelId,
                                 String name,
                                 Integer objectType,
                                 String height,
                                 String width,
                                 Double leftPoint,
                                 Double topPoint,
                                 Integer productId) {
        try {
            Label label = new Label();
            Label tempLabel = null;
            if (null != labelId && !labelId.equals("")) {
                tempLabel = labelService.findLastPosition(objectId, labelId);
                if (null != tempLabel) {
                    label = tempLabel;
                }
            }

            label.setName(name);
            label.setObjectId(objectId);
//            label.setObjectType(objectType);
            label.setHeight(height);
            label.setWidth(width);
            label.setLabelId(labelId);
            label.setLeftPoint(leftPoint);
            label.setTopPoint(topPoint);

            if (null == tempLabel) {
                labelService.save(label);
            } else {
                labelService.save(label);
            }

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @RequestMapping("/deleteLabel")
    @ResponseBody
    public Integer deleteLabel(String labelId) {
        try {
            Label label = labelService.searchByLabelId(labelId);
            if(label != null){
                labelService.delete(label);
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }


}
