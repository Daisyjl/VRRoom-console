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
    <title>新增/编辑户型</title>
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
                            户型信息
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form">
                                <input name="id" type="hidden" value="${enterprise.id}">

                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$houseUnit.fn.openModal()" class="btn btn-primary"><i class="fa fa-plus"></i> 添加户型</button>
                                        <button type="button" onclick="$houseUnit.fn.back()" class="btn btn-primary"><i class="fa fa-reply"></i> 返回</button>
                                    </div>
                                </div>

                                <div id="unitDiv">

                                </div>


                            </form>
                        </div>
                    </section>
                </div>
            </div>

        </section>
    </div>
    <!-- main content end-->

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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增户型</h4>
                </div>
                <div class="modal-body">
                    <form class="cmxform form-horizontal adminex-form" id="unitForm" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="">
                        <input type="hidden" name="houseId" value="${houseId}">

                        <div class="form-group">
                            <label class="col-sm-3 control-label" ><span style="color: red;">* </span>户型名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="name" value="" class="form-control" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" ><span style="color: red;">* </span>户型类型：</label>
                            <div class="col-sm-6">
                                <input type="text" name="typeName" value="" class="form-control" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" ><span style="color: red;">* </span>面积：</label>
                            <div class="col-sm-6">
                                <input type="text" name="totalArea" value="" class="form-control" number-2="true" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" >朝向：</label>
                            <div class="col-sm-6">
                                <input type="text" name="towards" value="" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" >参考总价：</label>
                            <div class="col-sm-6">
                                <input type="text" name="totalPrice" value="" class="form-control" number-2="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">户型图上传：</label>
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
                                <a id="d3ModelRecogFileUrl" style="display: none;">下载地址</a>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" >3D模型：</label>
                            <div class="col-sm-6">
                                <input type="file" name="d3ModelFile" class="default"/>
                            </div>
                            <div class="col-sm-3">
                                <a id="d3ModelFileUrl" style="display: none;">下载地址</a>
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

</section>
<%@ include file="../inc/new2/foot.jsp" %>
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
                            $("#unitForm").find("[name=towards]").val(obj.towards);
                            $("#unitForm").find("#planeImg").attr("src", obj.planeImage.uploadUrl);
                            $("#unitForm").find("#d3Img").attr("src", obj.d3Image.uploadUrl);
                            $("#unitForm").find("[name=fullView]").val(obj.fullView);
                            if(obj.d3ModelRecogUrl != null && obj.d3ModelRecogUrl != ''){
                                $("#unitForm").find("#d3ModelRecogFileUrl").show();
                                $("#unitForm").find("#d3ModelRecogFileUrl").attr("href", obj.d3ModelRecogUrl);
                            }
                            if(obj.d3ModelUrl != null && obj.d3ModelUrl != ''){
                                $("#unitForm").find("#d3ModelFileUrl").show();
                                $("#unitForm").find("#d3ModelFileUrl").attr("href", obj.d3ModelUrl);
                            }
                            $("#myModal").modal("show");
                        }else{
                            $leoman.alertMsg(result.msg);
                        }
                    });
                }else{
                    $("#myModal").modal("show");
                }
            },
            //保存弹出的新增户型
            save : function (){
                if(!$("#unitForm").valid()) return;
                $("#unitForm").ajaxSubmit({
                    url : "${contextPath}/admin/house/unit/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.reload();
                        }
                        else {
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
</body>
</html>
