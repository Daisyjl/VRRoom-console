package com.leoman.house.util;
/*
* Author: pancheng Email:gdpancheng@gmail.com
* Created Date:2016年11月4日
* Copyright @ 2016 BU
* Description: 类描述
*
* History:
*/

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
/**
 * 屏幕上查找指定图片
 * @author Jeby Sun
 * @date 2014-09-13
 * @website http://www.jebysun.com
 */
public class ImageFindUtil {
    
    BufferedImage screenShotImage;    //屏幕截图
    BufferedImage keyImage;           //查找目标图片
    
    int scrShotImgWidth;              //屏幕截图宽度
    int scrShotImgHeight;             //屏幕截图高度
    
    int keyImgWidth;                  //查找目标图片宽度
    int keyImgHeight;                 //查找目标图片高度
    
    int[][] screenShotImageRGBData;   //屏幕截图RGB数据
    int[][] keyImageRGBData;          //查找目标图片RGB数据
    
    
    
    public ImageFindUtil(String keyImagePath,String bigImage) {
        screenShotImage = this.getBigImage(bigImage);
        keyImage = this.getBfImageFromPath(keyImagePath);
        screenShotImageRGBData = this.getImageGRB(screenShotImage);
        keyImageRGBData = this.getImageGRB(keyImage);
        scrShotImgWidth = screenShotImage.getWidth();
        scrShotImgHeight = screenShotImage.getHeight();
        keyImgWidth = keyImage.getWidth();
        keyImgHeight = keyImage.getHeight();
        //开始查找
        this.findImage();
    }
    
    /**
     * 全屏截图
     * @return 返回BufferedImage
     */
    public BufferedImage getBigImage(String pic) {
    	BufferedImage bfImage = this.getBfImageFromPath(pic);
        return bfImage;
    }
    
    /**
     * 从本地文件读取目标图片
     * @param keyImagePath - 图片绝对路径
     * @return 本地图片的BufferedImage对象
     */
    public BufferedImage getBfImageFromPath(String keyImagePath) {
        BufferedImage bfImage = null;
        try {
            bfImage = ImageIO.read(new File(keyImagePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bfImage;
    }
    
    /**
     * 根据BufferedImage获取图片RGB数组
     * @param bfImage
     * @return
     */
    public int[][] getImageGRB(BufferedImage bfImage) {
        int width = bfImage.getWidth();
        int height = bfImage.getHeight();
        int[][] result = new int[height][width];
        for (int h = 0; h < height; h++) {
            for (int w = 0; w < width; w++) {
                //使用getRGB(w, h)获取该点的颜色值是ARGB，而在实际应用中使用的是RGB，所以需要将ARGB转化成RGB，即bufImg.getRGB(w, h) & 0xFFFFFF。
                result[h][w] = bfImage.getRGB(w, h) & 0xFFFFFF;
            }
        }
        return result;
    }
    
    
    /**
     * 查找图片
     */
    public void findImage() {
        //遍历屏幕截图像素点数据
        int i = 0;
        int count = 1;
        for(int y=0; y<scrShotImgHeight-keyImgHeight; y++) {
            for(int x=0; x<scrShotImgWidth-keyImgWidth; x++) {
            	 i ++;
                //根据目标图的尺寸，得到目标图四个角映射到屏幕截图上的四个点，
                //判断截图上对应的四个点与图B的四个角像素点的值是否相同，
                //如果相同就将屏幕截图上映射范围内的所有的点与目标图的所有的点进行比较。
//                if((keyImageRGBData[0][0]^screenShotImageRGBData[y][x])==0
//                        && (keyImageRGBData[0][keyImgWidth-1]^screenShotImageRGBData[y][x+keyImgWidth-1])==0
//                        && (keyImageRGBData[keyImgHeight-1][keyImgWidth-1]^screenShotImageRGBData[y+keyImgHeight-1][x+keyImgWidth-1])==0
//                        && (keyImageRGBData[keyImgHeight-1][0]^screenShotImageRGBData[y+keyImgHeight-1][x])==0) {
                    
                	

                    boolean isFinded = isMatchAll(y, x);
//                    System.out.println(isFinded);
                    //如果比较结果完全相同，则说明图片找到，填充查找到的位置坐标数据到查找结果数组。
                    if(isFinded) {
                    	System.out.println(count+" -- X坐标:"+(x+keyImgWidth)+","+"Y坐标:"+(y+keyImgHeight/2));
                        count++;
//                    	x= x+keyImgWidth;
//                    	y = y +keyImgHeight;
//                        for(int h=0; h<keyImgHeight; h++) {
//                            for(int w=0; w<keyImgWidth; w++) {
//                                findImgData[h][w][0] = y+h; 
//                                findImgData[h][w][1] = x+w;
//                            }
//                        }
//                        return;
//                    }
                }
            }
        }
        System.out.println("比较了多少次："+i);
    }
    
    /**
     * 判断屏幕截图上目标图映射范围内的全部点是否全部和小图的点一一对应。
     * @param y - 与目标图左上角像素点想匹配的屏幕截图y坐标
     * @param x - 与目标图左上角像素点想匹配的屏幕截图x坐标
     * @return
     */
    public boolean isMatchAll(int y, int x) {
        int biggerY = 0;
        int biggerX = 0;
        int xor = 0;
        for(int smallerY=0; smallerY<keyImgHeight; smallerY++) {
            biggerY = y+smallerY;
            for(int smallerX=0; smallerX<keyImgWidth; smallerX++) {
                biggerX = x+smallerX;
                if(biggerY>=scrShotImgHeight || biggerX>=scrShotImgWidth) {
                    return false;
                }
                xor = keyImageRGBData[smallerY][smallerX]^screenShotImageRGBData[biggerY][biggerX];
                if(xor!=0) {
                    return false;
                }
            }
            biggerX = x;
        }
        return true;
    }
    

    
    public static void main(String[] args) {
        String keyImagePath = "E:/项目/看房/findpic/assert/123.png";//小圆球
        String bigImage = "E:/项目/看房/findpic/assert/Group 5.png";//大图
       new ImageFindUtil(keyImagePath,bigImage);
    }

}
