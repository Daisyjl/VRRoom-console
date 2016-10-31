<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <title>新增/编辑楼盘相册图片</title>
    <%@ include file="../inc/new2/css.jsp" %>
</head>

<body class="sticky-header">

<section>
    <%@ include file="../inc/new2/menu.jsp" %>
    <!-- main content start-->
    <div class="main-content">
        <%@ include file="../inc/new2/header.jsp" %>
        <!--body wrapper start-->
        <section class="wrapper">
            <!-- page start-->

            <!-- 户型信息 -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            楼盘相册图片
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form" id="formId" enctype="multipart/form-data">
                                <input name="houseId" type="hidden" value="${house.id}">
                                <input name="album.id" type="hidden" value="${album.id}">

                                <div class="form-group">
                                    <div class="col-sm-6">
                                        ${house.name}--${album.name}
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

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$houseAlbumImage.fn.save()" class="btn btn-primary"><i class="fa fa-check"></i> 保存</button>
                                        <button type="button" onclick="$houseAlbumImage.fn.back()" class="btn btn-primary"><i class="fa fa-reply"></i> 返回</button>
                                    </div>
                                </div>

                            </form>
                            <%--<form action="${contextPath}/static/html/js/dropzone/upload.php" class="dropzone" id="my-awesome-dropzone"></form>--%>
                        </div>
                    </section>
                </div>
            </div>

        </section>
    </div>
    <!-- main content end-->

    <form id="tempImageForm" method="post" action="${contextPath}/common/file/addTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
        <input type="file" name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$houseAlbumImage.fn.saveTempImage()"/>
    </form>

    <input type="hidden" id="curImageId" value="">
    <div class="col-sm-2" style="display: none;" id="imageTemplate">
        <%--<input type="file" name="file" style="display:none;"/>--%>
        <input type="hidden" name="imageId" value="">
        <a href="javascript:void(0);" onclick="$houseAlbumImage.fn.AddTempImg(this)">
            <img id="" name="path" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 10px;" border="1"/>
        </a>
        <a href="javascript:void(0);" style="z-index: 10; position: relative; bottom: 70px; left: -23px;" class="axx" onclick="$houseAlbumImage.fn.deleteImage(this)">
            <img src="${contextPath}/static/images/xx.png" style="height: 16px; width: 16px; display: inline;" border="1"/>
        </a>
    </div>



</section>
<%@ include file="../inc/new2/foot.jsp" %>
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
                        if (null != data.path && data.path != '') {
                            //新增一个图片模板
                            if($("#curImageId").val() == 'addImg'){
                                $houseAlbumImage.fn.addImgTemplate(data.path, data.id);
                            }
                            //修改当前图片
                            else{
                                var obj = $("#"+$("#curImageId").val());
                                obj.attr("src",data.path);
                                obj.parent().prev("input").val(data.id);
                            }
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },
            save : function() {
                if(!$("#formId").valid()) return;
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/album/saveImage",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.href = "${contextPath}/admin/house/album/edit/${house.id}";
                        }
                        else {
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
</body>
</html>
