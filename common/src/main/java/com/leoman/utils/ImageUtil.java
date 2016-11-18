package com.leoman.utils;

import com.leoman.entity.Configue;
import com.leoman.house.entity.House;
import com.leoman.image.entity.Image;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Page;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Created by wangbin on 2014/12/6.
 */
public class ImageUtil {

    private static Object getFieldValueByName(String fieldName, Object o) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = o.getClass().getMethod(getter, new Class[] {});
            Object value = method.invoke(o, new Object[] {});
            return value;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void setImagePath(Page page) throws Exception{
        if(page != null && page.getContent() != null && page.getContent().size() > 0){
            for (Object obj:page.getContent()) {
                setImagePath(obj);
            }
        }
    }

    public static void setImagePath(List list) throws Exception{
        if(list != null && list.size() > 0){
            for (Object obj:list) {
                setImagePath(obj);
            }
        }
    }


    public static void setImagePath(Object obj) throws Exception{
        //如果本身是图片类，则给path字段赋值
        if(obj.getClass().equals(Image.class)){
            Field[] fields = obj.getClass().getDeclaredFields();
            for(int i=0;i<fields.length;i++){

                Field f = fields[i];

                Image image = (Image)obj;
                if(f.getName().equals("path") && StringUtils.isNotBlank(image.getPath())){
//                    System.out.println("path before -- "+image.getPath());
                    f.setAccessible(true);
                    f.set(obj, Configue.getUploadUrl() + image.getPath());
//                    System.out.println("path after -- "+image.getPath());
                }
            }
        }
        //如果此对象中有image对象，则给image对象的path字段赋值
        else{
            Field[] fields = obj.getClass().getDeclaredFields();
            for(int i=0;i<fields.length;i++){

                Field field = fields[i];

                //获取image字段
                if(field.getType().equals(Image.class)){
                    Object value = ImageUtil.getFieldValueByName(field.getName(), obj);
                    Image image = (Image) value;
//                    System.out.println("path before -- "+image.getPath());
                    field.setAccessible(true);

                    Field[] imgFields = image.getClass().getDeclaredFields();
                    for(int j=0; j<imgFields.length; j++) {
                        Field f = imgFields[j];
                        if(f.getName().equals("path") && StringUtils.isNotBlank(image.getPath())){
                            f.setAccessible(true);
                            f.set(image, Configue.getUploadUrl() + image.getPath());
                        }
                    }
//                    System.out.println("path after -- "+image.getPath());
                }
            }
        }

    }


}
