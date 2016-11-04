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
    <title>户型信息</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">户型信息</h1>
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

                        <a href="javascript:;" onclick="$houseUnit.fn.openModal()" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-plus'></i> 添加户型</a>
                    </div>

                    <div class="panel-body">
                        <form method="post" class="form-horizontal" role="form">
                            <input type="hidden" id="id" name="id" value="${product.id}">

                            <div id="unitDiv">

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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="lotteryModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="lotteryModalLabel">新增户型</h4>
            </div>
            <div class="modal-body" >
                <form id="unitForm" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="houseId" value="${houseId}">

                    <div class="form-group">
                        <label class="col-sm-3 control-label" ><span style="color: red;">* </span>户型名称：</label>
                        <div class="col-sm-6">
                            <input type="text" name="name" value="" class="form-control"  data-rule="required" maxlength="30"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" ><span style="color: red;">* </span>户型类型：</label>
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
                        <label class="col-sm-3 control-label" ><span style="color: red;">* </span>面积：</label>
                        <div class="col-sm-6">
                            <input type="text" name="totalArea" value="" class="form-control"
                                   data-rule="required; price" data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的面积']"/>
                        </div>
                        <label class="col-sm-3 control-label" style="text-align: left">平方</label>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" >朝向：</label>
                        <div class="col-sm-6">
                            <select class="form-control input-sm" name="towards">
                                <option value="">---请选择---</option>
                                <option value="正南">正南</option>
                                <option value="东南">东南</option>
                                <option value="东">东</option>
                                <option value="西南">西南</option>
                                <option value="北">北</option>
                                <option value="西">西</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" >参考总价：</label>
                        <div class="col-sm-6">
                            <input type="text" name="totalPrice" value="" class="form-control"
                                   data-rule="price" data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的参考总价']"/>
                        </div>
                        <label class="col-sm-3 control-label" style="text-align: left">万</label>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span style="color: red;">* </span>户型图上传：</label>
                        <div class="col-sm-5">
                            <input type="file" name="planeFile" id="planeFile" style="display:none;"/>
                            <a href="javascript:void(0);" onclick="$('#planeFile').click();">
                                <img id="planeImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                            </a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">3d户型图上传：</label>
                        <div class="col-sm-5">
                            <input type="file" name="d3File" id="d3File" style="display:none;"/>
                            <a href="javascript:void(0);" onclick="$('#d3File').click();">
                                <img id="d3Img" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                            </a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" >360全景：</label>
                        <div class="col-sm-6">
                            <input type="text" name="fullView" value="" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" >3D模型识别图：</label>
                        <div class="col-sm-6">
                            <input type="file" name="d3ModelRecogFile" class="default" />
                        </div>
                        <div class="col-sm-3">
                            <a id="d3ModelRecogFileUrl" style="display: none;">下载模型</a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" >3D模型：</label>
                        <div class="col-sm-6">
                            <input type="file" name="d3ModelFile" class="default"/>
                        </div>
                        <div class="col-sm-3">
                            <a id="d3ModelFileUrl" style="display: none;">下载模型</a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="$houseUnit.fn.save()" class="btn btn-primary">保存</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- Modal end -->

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

                $("#d3File").uploadPreview({
                    Img: "d3Img",
                });

                $("#unitDiv").empty();
                $.post("${contextPath}/admin/house/unit/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            var unitTemplate = $("#unitTemplate").clone().removeAttr("id");
                            unitTemplate.find("label").text("户型"+(i+1)+"：");
                            if(list[i].planeImage != null){
                                unitTemplate.find("img").prop("src",list[i].planeImage.uploadUrl);
                            }
                            unitTemplate.find(".form-group").eq(0).text("户型名称："+list[i].name);
                            unitTemplate.find(".form-group").eq(1).text("建筑面积："+list[i].totalArea);
                            unitTemplate.find(".form-group").eq(2).text("参考总价："+(list[i].totalPrice==null?"":list[i].totalPrice));
                            unitTemplate.find("button").eq(0).attr("onclick","$houseUnit.fn.openModal("+list[i].id+")");
                            unitTemplate.find("button").eq(1).attr("onclick","$houseUnit.fn.delete("+list[i].id+")");
                            unitTemplate.show();
                            $("#unitDiv").append(unitTemplate);
                        }
                    }
                });
            },
            openModal : function (id){
                if(id != '' && id != undefined){
                    $.post("${contextPath}/admin/house/unit/detail/"+id, function(result){
                        if(result.status == 0){
                            var obj = result.data.houseUnit;
                            $("#unitForm").find("[name=id]").val(obj.id);
                            $("#unitForm").find("[name=name]").val(obj.name);
                            $("#unitForm").find("[name=typeName]").val(obj.typeName);
                            $("#unitForm").find("[name=totalArea]").val(obj.totalArea);
                            $("#unitForm").find("[name=totalPrice]").val(obj.totalPrice);
                            if(obj.planeImage != null){
                                $("#unitForm").find("#planeImg").attr("src", obj.planeImage.uploadUrl);
                            }
                            if(obj.d3Image != null){
                                $("#unitForm").find("#d3Img").attr("src", obj.d3Image.uploadUrl);
                            }
                            $("#unitForm").find("[name=fullView]").val(obj.fullView);
                            if(obj.d3ModelRecogUrl != null && obj.d3ModelRecogUrl != ''){
                                $("#unitForm").find("#d3ModelRecogFileUrl").show();
                                $("#unitForm").find("#d3ModelRecogFileUrl").attr("href", obj.d3ModelRecogUrl);
                            }
                            if(obj.d3ModelUrl != null && obj.d3ModelUrl != ''){
                                $("#unitForm").find("#d3ModelFileUrl").show();
                                $("#unitForm").find("#d3ModelFileUrl").attr("href", obj.d3ModelUrl);
                            }

                            //设置户型类型和朝向的下拉框的值
                            $("[name=typeName]").find("option[value="+obj.typeName+"]").attr("selected", true);
                            $("[name=towards]").find("option[value="+obj.towards+"]").attr("selected", true);
                            $("#myModal").modal("show");
                        }else{
                            $leoman.alertMsg(result.msg);
                        }
                    });
                }else{
                    $("#unitForm").find("input, select").val("");
                    $("#unitForm").find("img").attr("src","static/images/add.jpg");
                    $("#unitForm").find("[name=houseId]").val("${houseId}");
                    $("#myModal").modal("show");
                }

            },
            //保存弹出的新增户型
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
                            window.location.reload();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            //删除
            delete : function (id){
                $leoman.alertConfirm("您确定要删除该户型吗？",function(){
                    $.post("${contextPath}/admin/house/unit/delete",{'id':id},function(result){
                        if(result.status != 0){
                            window.location.reload();
                        }else{
                            $leoman.alertMsg(result.msg);
                        }
                    });
                });
            },
            //返回
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    };

    $(function () {
        $houseUnit.fn.init();
    });
</script>


</html>