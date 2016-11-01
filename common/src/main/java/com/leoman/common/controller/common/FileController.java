package com.leoman.common.controller.common;

import com.leoman.common.core.bean.Result;
import com.leoman.entity.Configue;
import com.leoman.exception.GeneralExceptionHandler;
import com.leoman.image.entity.Image;
import com.leoman.image.service.ImageService;
import com.leoman.image.service.UploadImageService;
import com.leoman.utils.WebUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangbin on 2014/12/6.
 */
@Controller
@RequestMapping(value = "common/file")
public class FileController extends CommonController {


    @Autowired
    private UploadImageService uploadImageService;
    @Autowired
    private ImageService imageService;

    @RequestMapping(value = "index")
    public void index(HttpServletRequest request,
                      HttpServletResponse response){
        WebUtil.print(response, new Result(true));
    }


    @RequestMapping(value = "/save/image")
    public void saveImage(HttpServletRequest request,
                          HttpServletResponse response,
                          String thumbSizes,
                          @RequestParam(required=false) MultipartFile file){
        Image image = null;
        try {
            if(StringUtils.isBlank(thumbSizes)){
                image = uploadImageService.uploadImage(file);
            }else{
                image = uploadImageService.uploadImage(file,thumbSizes.split(","));
            }
            imageService.create(image);
            image.setPath(Configue.getUploadUrl()+image.getPath());
            WebUtil.print(response, new Result(true).data(image).msg("上传图片成功!"));
        }catch (Exception e){
            GeneralExceptionHandler.log(e);
            WebUtil.print(response, new Result(false).msg(e.getMessage()));
        }
    }

    @RequestMapping(value = "/save/images")
    public void saveImage(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestParam(required = false) MultipartFile[] files){

        try {
            List<Image> imageList =uploadImageService.uploadImages(files);
            for(Image image : imageList){
                image.setPath(Configue.getUploadUrl()+image.getPath());
            }
            WebUtil.print(response, new Result(true).data(imageList).msg("上传图片成功!"));
        }catch (Exception e){
            GeneralExceptionHandler.log(e);
            WebUtil.print(response, new Result(false).msg(e.getMessage()));
        }
    }

    @RequestMapping("/addTempImage")
    @ResponseBody
    public Image addTempImage(ServletRequest request, MultipartRequest multipartRequest) {
        Image image = new Image();

        try {
            MultipartFile file = multipartRequest.getFile("tempImage");


            // 验证图片格式
            String originalFileName = file.getOriginalFilename().toLowerCase();
            String fileType = originalFileName.substring(originalFileName.lastIndexOf("."));

            List<String> list = new ArrayList<String>();
            list.add(".jpg");
            list.add(".gif");
            list.add(".jpeg");
            list.add(".png");
            list.add(".bmp");

            if (!list.contains(fileType)) {
                return image;
            }

            image = uploadImageService.uploadImage(file);
            imageService.create(image);
            image.setPath(Configue.getUploadUrl()+image.getPath());


            /* 以下是上传到其他服务器的做法，先保留 */
            /*String url = uploadImageService.uploadFile(multipartFile);
            image.setPath(url);

            imageService.create(image);
            image.setPath(Configue.getUploadUrl()+url);*/

                // 使用线程更新图片的宽高信息
            /*GetImageInfo getImageInfo = new GetImageInfo();
            getImageInfo.setImage(image);
            getImageInfo.setKey(url);
            getImageInfo.run();*/

        } catch (Exception e) {
            e.printStackTrace();
        }

        return image;
    }

    /**
     * 多图上传
     * @param request
     * @param multipartRequest
     * @return
     */
    @RequestMapping("/addMultiTempImage")
    @ResponseBody
    public List<Image> addMultiTempImage(ServletRequest request, MultipartRequest multipartRequest) {
        List<Image> imageList = new ArrayList<>();

        try {
            List<MultipartFile> files = multipartRequest.getFiles("tempImage");

            for (MultipartFile file:files) {

                // 验证图片格式
                String originalFileName = file.getOriginalFilename().toLowerCase();
                String fileType = originalFileName.substring(originalFileName.lastIndexOf("."));

                List<String> list = new ArrayList<String>();
                list.add(".jpg");
                list.add(".gif");
                list.add(".jpeg");
                list.add(".png");
                list.add(".bmp");

                if (!list.contains(fileType)) {
                    return imageList;
                }

                Image image = uploadImageService.uploadImage(file);
                imageService.create(image);
                image.setPath(Configue.getUploadUrl()+image.getPath());

                imageList.add(image);

                /* 以下是上传到其他服务器的做法，先保留 */
                /*String url = uploadImageService.uploadFile(multipartFile);
                image.setPath(url);

                imageService.create(image);
                image.setPath(Configue.getUploadUrl()+url);*/

                // 使用线程更新图片的宽高信息
                /*GetImageInfo getImageInfo = new GetImageInfo();
                getImageInfo.setImage(image);
                getImageInfo.setKey(url);
                getImageInfo.run();*/
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return imageList;
    }


}
