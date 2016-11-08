<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 2015/3/3
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>楼盘相册</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">楼盘相册</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-heading">
                        <a href="admin/house/album/edit/${house.id}" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-reply'></i> 返回</a>

                        <a href="javascript:;" onclick="$houseAlbumImage.fn.save()" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-check'></i> 保存</a>
                    </div>

                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">
                            <input name="houseId" type="hidden" value="${house.id}">
                            <input name="album.id" type="hidden" value="${album.id}">

                            <div class="form-group">
                                <div class="col-sm-6">
                                    ${house.name} -- ${album.name}
                                </div>
                            </div>

                            <div class="form-group">

                                <div id="imageDiv">

                                </div>

                                <div class="col-sm-2">
                                    <input type="file" style="display:none;"/>
                                    <a href="javascript:void(0);" onclick="$houseAlbumImage.fn.AddTempImg(this)">
                                        <img id="addImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>

                            </div>

                        </form>
                    </div>
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<form id="tempImageForm" method="post" action="${contextPath}/common/file/addMultiTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
    <input type="file" multiple name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$houseAlbumImage.fn.saveTempImage()"/>
</form>

<input type="hidden" id="curImageId" value="">
<div class="col-sm-2" style="display: none;" id="imageTemplate">
    <%--<input type="file" name="file" style="display:none;"/>--%>
    <input type="hidden" name="imageId" value="">
    <a href="javascript:void(0);">
        <img id="" name="path" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 10px;" border="1"/>
    </a>
    <a href="javascript:void(0);" style="z-index: 10; position: relative; bottom: 70px; left: -23px;" class="axx" onclick="$houseAlbumImage.fn.deleteImage(this)">
        <img src="${contextPath}/static/images/xx.png" style="height: 16px; width: 16px; display: inline;" border="1"/>
    </a>
</div>

<%@ include file="../inc/footer.jsp" %>
<!-- 配置文件 -->

</body>

<script>
    $houseAlbumImage = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
            tempImageId:null
        },
        fn: {
            init: function () {

                $houseAlbumImage.v.tempImageId = 0;

                $houseAlbumImage.fn.initList();
            },
            //初始化图片列表
            initList : function(){
                $("#imageDiv").empty();
                $.post("${contextPath}/admin/house/album/imageList",{'houseId':"${house.id}",'albumId':"${album.id}"},function(result){
                    if(result.status == 0){
                        var list = result.data.object.list;
                        for(var i=0; i < list.length; i++){
                            $houseAlbumImage.fn.addImgTemplate(list[i].image.uploadUrl, list[i].image.id);
                        }
                    }
                });
            },
            //新增一个图片模板
            addImgTemplate : function(path, id){
                var template = $("#imageTemplate").clone().removeAttr("id");
                if(path != "" && path != undefined){
                    template.find("img").eq(0).attr("src",path);
                }
                template.find("img").eq(0).attr("id","albumImg_"+$houseAlbumImage.v.tempImageId);
                template.find("input[name=imageId]").val(id);
                template.show();
                $("#imageDiv").append(template);

                $houseAlbumImage.v.tempImageId++;
            },
            //删除图片
            deleteImage: function (self) {
                $(self).parents(".col-sm-2").remove();
            },
            /* 图片 */
            AddTempImg: function (self) {
                $('#tempImage').click();
                $("#curImageId").val($(self).find("img").attr("id"));
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (data) {
                        if (null != data && data.length > 0) {

                            for(var i=0; i<data.length; i++){
                                var image = data[i];
                                $houseAlbumImage.fn.addImgTemplate(image.path, image.id);
                            }
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },
            save : function() {
                if(!$("#formId").valid()) return;

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/album/saveImage",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.href = "${contextPath}/admin/house/album/edit/${house.id}";
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/album/edit/${house.id}";
            }
        }
    }
    $(function () {
        $houseAlbumImage.fn.init();
    })
</script>


</html>