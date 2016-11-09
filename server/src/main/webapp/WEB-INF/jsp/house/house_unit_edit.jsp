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
    <title>添加/编辑 户型信息</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">添加/编辑 户型信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-heading">
                        <a href="admin/house/index" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-reply'></i> 返回</a>

                        <%--<a href="javascript:;" onclick="$houseUnit.fn.openModal()" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-plus'></i> 添加户型</a>--%>
                    </div>

                    <div class="panel-body">
                        <form id="unitForm" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${unit.id}">
                            <input type="hidden" name="houseId" value="${houseId}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>户型名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="name" value="${unit.name}" class="form-control"  data-rule="required" maxlength="30"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>户型类型：</label>
                                <div class="col-sm-6">
                                    <select class="form-control input-sm" name="typeName" data-rule="required">
                                        <option value="">---请选择---</option>
                                        <option value="一室一厅一卫">一室一厅一卫</option>
                                        <option value="两室一厅一卫">两室一厅一卫</option>
                                        <option value="三室两厅一卫">三室两厅一卫</option>
                                        <option value="三室两厅两卫">三室两厅两卫</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>面积：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="totalArea" value="${unit.totalArea}" class="form-control"
                                           data-rule="required; price" data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的面积']"/>
                                </div>
                                <label class="col-sm-3 control-label" style="text-align: left">平方</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >朝向：</label>
                                <div class="col-sm-6">
                                    <select class="form-control input-sm" id="directionSelect" name="direction.id">
                                        <option value="">---请选择---</option>
                                        <c:forEach items="${directionList}" var="direction">
                                            <option value="${direction.id}">${direction.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >参考总价：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="totalPrice" value="${unit.totalPrice}" class="form-control"
                                           data-rule="price" data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的参考总价']"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">万</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"><span style="color: red;">* </span>户型图上传：</label>
                                <div class="col-sm-5">
                                    <input type="file" name="planeFile" id="planeFile" style="display:none;"/>
                                    <a href="javascript:void(0);" onclick="$('#planeFile').click();">
                                        <img id="planeImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">3d户型图上传：</label>
                                <div id="imageDiv">

                                </div>

                                <div class="col-sm-2">
                                    <input type="file" style="display:none;"/>
                                    <a href="javascript:void(0);" onclick="$houseUnit.fn.AddTempImg(this)">
                                        <img id="addImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>

                            </div>

                            <%--<div class="form-group">
                                <label class="col-sm-1 control-label">3d户型图上传：</label>
                                <div class="col-sm-5">
                                    <input type="file" name="d3File" id="d3File" style="display:none;"/>
                                    <a href="javascript:void(0);" onclick="$('#d3File').click();">
                                        <img id="d3Img" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>
                            </div>--%>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >360全景：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="fullView" value="${unit.totalPrice}" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >3D模型识别图：</label>
                                <div class="col-sm-2">
                                    <input type="file" name="d3ModelRecogFile" class="default" />
                                </div>
                                <div class="col-sm-3">
                                    <a id="d3ModelRecogFileUrl" style="display: none;">下载模型</a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >3D模型：</label>
                                <div class="col-sm-2">
                                    <input type="file" name="d3ModelFile" class="default"/>
                                </div>
                                <div class="col-sm-1">
                                    <a id="d3ModelFileUrl" style="display: none;">下载模型</a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ></label>
                                <div class="col-sm-2">
                                    <button type="button" onclick="$houseUnit.fn.save()" class="btn btn-primary">保存</button>
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

<!-- 户型模板 -->
<div class="form-group" style="display: none;" id="unitTemplate">
    <label class="col-sm-1 control-label">户型：</label>
    <div class="col-sm-2">
        <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;" border="1"/>
    </div>
    <div class="col-sm-2">
        <div class="form-group">
            户型名称：
        </div>
        <div class="form-group">
            建筑面积：
        </div>
        <div class="form-group">
            参考总价：
        </div>
    </div>
    <div class="col-sm-2">
        <button type="button" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> 编辑</button>
        <button type="button" onclick="" class="btn btn-primary"><i class="fa fa-minus"></i> 删除</button>
    </div>
</div>

<form id="tempImageForm" method="post" action="${contextPath}/common/file/addMultiTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
    <input type="file" multiple name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$houseUnit.fn.saveTempImage()"/>
</form>

<input type="hidden" id="curImageId" value="">
<div class="col-sm-2" style="display: none;" id="imageTemplate">
    <%--<input type="file" name="file" style="display:none;"/>--%>
    <input type="hidden" name="d3ImageId" value="">
    <a href="javascript:void(0);">
        <img id="" name="path" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 10px;" border="1"/>
    </a>
    <a href="javascript:void(0);" style="z-index: 10; position: relative; bottom: 70px; left: -23px;" class="axx" onclick="$houseUnit.fn.deleteImage(this)">
        <img src="${contextPath}/static/images/xx.png" style="height: 16px; width: 16px; display: inline;" border="1"/>
    </a>
</div>

<%@ include file="../inc/footer.jsp" %>
<!-- 配置文件 -->

</body>

<script>
    $houseUnit = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {
                $("#planeFile").uploadPreview({
                    Img: "planeImg",
                });

                if("${unit.planeImage}" != ''){
                    $("#planeImg").attr("src", "${unit.planeImage.uploadUrl}");
                }

                //初始化值
                if("${unit.typeName}" != ''){
                    $("[name=typeName] option[value="+"${unit.typeName}"+"]").attr("selected", true);
                }

                if("${unit.direction}" != ''){
                    $("#directionSelect option[value="+"${unit.direction.id}"+"]").attr("selected", true);
                }

                if("${unit.d3ModelRecogUrl}" != ''){
                    $("#d3ModelRecogFileUrl").show();
                    $("#d3ModelRecogFileUrl").attr("href", "${unit.d3ModelRecogUrl}");
                }
                if("${unit.d3ModelUrl}" != ''){
                    $("#d3ModelUrl").show();
                    $("#d3ModelUrl").attr("href", "${unit.d3ModelUrl}");
                }

                $houseUnit.fn.init3dImageList();
            },
            //初始化图片列表
            init3dImageList : function(){
                var d3ImageArr = ${d3ImageList };
                for(var i=0; i<d3ImageArr.length; i++){
                    $houseUnit.fn.addImgTemplate(d3ImageArr[i].d3Image.path, d3ImageArr[i].d3Image.id);
                }
            },
            //新增一个图片模板
            addImgTemplate : function(path, id){
                var template = $("#imageTemplate").clone().removeAttr("id");
                if(path != "" && path != undefined){
                    template.find("img").eq(0).attr("src",path);
                }
                template.find("input[name=d3ImageId]").val(id);
                template.show();
                $("#imageDiv").append(template);

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
                                $houseUnit.fn.addImgTemplate(image.path, image.id);
                            }
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },
            //保存
            save : function (){
                if(!$("#unitForm").isValid()) return;

                if($("#planeImg").attr("src") == '' ||  $("#planeImg").attr("src").indexOf('static/images/add.jpg') > -1){
                    $leoman.alertMsg("户型图不能为空");
                    return ;
                }

                $leoman.showLoading();
                $("#unitForm").ajaxSubmit({
                    url : "${contextPath}/admin/house/unit/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $houseUnit.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            //返回
            back : function(){
                window.location.href = "${contextPath}/admin/house/unit/index/${unit.houseId}";
            }
        }
    };

    $(function () {
        $houseUnit.fn.init();
    });
</script>


</html>