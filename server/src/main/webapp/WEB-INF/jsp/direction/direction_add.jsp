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
    <title>新增/编辑方位</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑方位</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">

                            <input id="id" name="id" type="hidden" value="${direction.id}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >方位名称</label>
                                <div class="col-sm-2">
                                    <input type="text" name="name" value="${direction.name}" class="form-control" data-rule="required" maxlength="30"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >选择方位图：</label>
                                <div class="col-sm-2">
                                    <input type="hidden" id="imageId" name="image.id" value="${direction.image.id}" data-rule="required">
                                    <a href="javascript:void(0);" onclick="$direction.fn.AddTempImg(this)">
                                        <img src="static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$direction.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$direction.fn.back()">返回</button>
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

<!-- 图片上传form -->
<form id="tempImageForm" method="post" action="${contextPath}/common/file/addTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
    <input type="file" name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$ridgepoleFloor.fn.saveTempImage()"/>
</form>

</body>

<%@ include file="../inc/footer.jsp" %>
<script>
    $direction = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {

                if("${direction.image}" != null){
                    $("img").attr("src","${direction.image.uploadUrl}");
                }

            },
            AddTempImg: function () {
                $('#tempImage').click();
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (data) {
                        if (null != data.path && data.path != '') {
                            $("form img").attr("src",data.path);
                            $("#imageId").val(data.id);
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },
            //保存
            save : function() {
                if(!$("#formId").isValid()) return;

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/direction/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $direction.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/direction/index";
            }
        }
    }
    $(function () {
        $direction.fn.init();
    })
</script>

</html>