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
    <title>楼层类型</title>
    <%@ include file="../inc/css.jsp" %>
    <style type="text/css">
        #allmap {width: 600px;height: 400px;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">楼层类型</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="admin/house/index" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-reply'></i> 返回</a>

                        <a href="javascript:;" onclick="$houseFloor.fn.save()" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-check'></i> 保存</a>
                    </div>
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <div class="form-group">
                                <div class="col-sm-1">
                                    <button type="button" onclick="$houseFloor.fn.addFloorType()" class="btn btn-primary"><i class="fa fa-plus"></i> 新增楼层类型</button>
                                </div>
                                <label class="col-sm-4 control-label" style="text-align: left">(先保存楼层类型，再编辑该楼层类型，给每个类型的第一个横切面图添加锚点)</label>
                            </div>

                        </form>
                    </div>
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>

        <div id="floorDiv">

        </div>

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- 配置文件 -->

<!-- 楼层类型template -->
<div class="row" style="display: none;" id="floorTypeTemplate">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <label>楼层类型</label>
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                </span>
            </div>
            <div class="panel-body">
                <form class="cmxform form-horizontal adminex-form">

                    <div class="form-group">
                        <label class="col-sm-1 control-label">楼层横切面图：</label>
                        <div class="col-sm-6">
                            <button type="button" onclick="$houseFloor.fn.addTransverse()" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> 新增横切面</button>
                        </div>
                    </div>

                    <div id="transverseDiv_" name="transverseDiv">

                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 横切面template -->
<input type="hidden" id="currentTransverseId" value="">
<div class="form-group" style="display: none;" id="transverseTemplate" name="transverseGroup">

    <label class="col-sm-1 control-label">上传横切面图：</label>
    <div class="col-sm-2">
        <input type="hidden" name="transverseImageId" value="">
        <a href="javascript:void(0);" onclick="$houseFloor.fn.AddTempImg(this)">
            <img src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 200px; display: inline; margin-bottom: 5px;" border="1"/>
        </a>
        <a href="javascript:void(0)" target="_blank" class="btn btn-primary btn-sm" role="button" style="color: white; display: none;margin-bottom: 5px;">添加锚点</a>
    </div>

    <label class="col-sm-1 control-label">选择户型：</label>
    <input type="hidden" name="unitId" value="">
    <div class="col-sm-2">
        <a href="javascript:void(0);" onclick="$houseFloor.fn.openModal(this)">
            <img name="unitImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
        </a>
    </div>
    <div class="col-sm-2">
        <div class="form-group" name="unitName">
            户型名称：
        </div>
        <div class="form-group" name="unitArea">
            建筑面积：
        </div>
        <div class="form-group" name="unitPrice">
            参考总价：
        </div>
    </div>

    <label class="col-sm-1 control-label">选择房间号：</label>
    <div class="col-sm-1">
        <select class="form-control" name="roomNo">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
    </div>

    <div class="col-sm-2">
        <button type="button" class="btn btn-primary" onclick="$houseFloor.fn.removeTransverse(this)"><i class="fa fa-minus"></i> 移除</button>
    </div>

</div>

<form id="tempImageForm" method="post" action="${contextPath}/common/file/addTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
    <input type="file" name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$houseFloor.fn.saveTempImage()"/>
</form>


<!-- 选择户型弹出框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">选择户型</h4>
            </div>
            <div class="modal-body">
                <form class="cmxform form-horizontal adminex-form" id="unitForm" enctype="multipart/form-data">
                    <input type="hidden" id="currentUnitId" value="">

                    <div id="unitDiv">

                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="$houseFloor.fn.selectUnit()" class="btn btn-primary">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- 户型 template -->
<div class="form-group" style="display: none;" id="unitTemplate">
    <div class="col-sm-1 icheck minimal" name="checkDiv">

    </div>

    <label class="col-sm-2 control-label">户型：</label>
    <div class="col-sm-5">
        <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;" border="1"/>
    </div>
    <div class="col-sm-3">
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
</div>

</body>

<%@ include file="../inc/footer.jsp" %>
<script>
    $houseFloor = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            tempTransverseId : null,
            tempFloorId : null,
        },
        fn: {
            init: function () {

                $houseFloor.v.tempTransverseId = 0;

                $houseFloor.v.tempFloorId = 0;

                //初始化加载楼层类型列表
                $houseFloor.fn.initFloorList();

                //初始化加载弹出框的户型列表
                $houseFloor.fn.initUnitList();
            },
            /* 楼层 */
            initFloorList:function(){
                $.post("${contextPath}/admin/house/floor/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            $houseFloor.fn.addFloorType(list[i].id);

                            var typeUnitList = list[i].typeUnitList;
                            for(var j=0; j<typeUnitList.length; j++){
                                var curTempTransverseId = $houseFloor.fn.addTransverse(i, typeUnitList[j].id);//新增一个横切面和户型关系
                                $houseFloor.fn.setTransverse(curTempTransverseId, typeUnitList[j]);//给该行数据赋值
                            }
                        }
                    }
                });
            },
            //新增楼层类型
            addFloorType:function(floorTypeId){
                var template = $("#floorTypeTemplate").clone().removeAttr("id");
                template.find("header label").text("楼层类型"+($houseFloor.v.tempFloorId+1));
                template.find("[name=transverseDiv]").attr("id","transverseDiv_"+$houseFloor.v.tempFloorId);
                template.find("button").attr("onclick","$houseFloor.fn.addTransverse("+$houseFloor.v.tempFloorId+")");
                template.show();
                $("#floorDiv").append(template);

                if(floorTypeId != '' && floorTypeId != undefined){
                    template.attr("val", floorTypeId);
                }

                var obj = $("#transverseDiv_"+$houseFloor.v.tempFloorId).parents(".row");

                //初始化楼层右上角的收缩和删除楼层块的事件
                obj.find('.panel .tools .fa-times').click(function () {
                    var deleteObj = $(this);
                    $leoman.alertConfirm("确定要删除该楼层类型吗？若删除，则其相关数据都删除",function(){
                        if(floorTypeId != '' && floorTypeId != undefined){
                            $.post("${contextPath}/admin/house/floor/delFloorType", {floorTypeId:floorTypeId}, function(result){
                                if(result.status == 0){
                                    deleteObj.parents(".panel").parent().remove();
                                }else{
                                    $leoman.alertMsg(result.msg);
                                }
                            });
                        }else{
                            deleteObj.parents(".panel").parent().remove();
                        }
                    });
                });


                //按钮展开收缩事件
                obj.find('.panel .tools').find(".fa-chevron-down,fa-chevron-up").click(function () {
                    var el = $(this).parents(".panel").children(".panel-body");
                    if ($(this).hasClass("fa-chevron-down")) {
                        $(this).removeClass("fa-chevron-down").addClass("fa-chevron-up");
                        el.slideUp(200);
                    } else {
                        $(this).removeClass("fa-chevron-up").addClass("fa-chevron-down");
                        el.slideDown(200); }
                });

                $houseFloor.v.tempFloorId++;

            },
            //初始化弹出框的户型列表
            initUnitList : function(){
                $("#unitDiv").empty();
                $.post("${contextPath}/admin/house/unit/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            var unitTemplate = $("#unitTemplate").clone().removeAttr("id");
                            unitTemplate.find("label").text((i+1)+". ");
                            if(list[i].planeImage != null){
                                unitTemplate.find("img").prop("src",list[i].planeImage.uploadUrl);
                            }
                            unitTemplate.find(".form-group").eq(0).text("户型名称："+list[i].name);
                            unitTemplate.find(".form-group").eq(1).text("建筑面积："+(list[i].totalArea==null?'':list[i].totalArea));
                            unitTemplate.find(".form-group").eq(2).text("参考总价："+(list[i].totalPrice==null?'':list[i].totalPrice));
                            unitTemplate.find("[name=checkDiv]").append('<div class="radio" val="'+list[i].id+'"><input type="radio" name="unitRadio"></div>');
                            unitTemplate.show();
                            $("#unitDiv").append(unitTemplate);
                        }

                        $('.minimal input').iCheck({
                            checkboxClass: 'icheckbox_minimal',
                            radioClass: 'iradio_minimal',
                            increaseArea: '20%' // optional
                        });

                        $(".radio .iradio_minimal").first().addClass("checked");

                    }
                });
            },
            //打开选择户型对话框
            openModal : function (self){
                $("#myModal").modal("show");
                var unitObj = $(self).parents(".form-group").find("[name=unitId]");
                $("#currentUnitId").val(unitObj.attr("id"));

                if(unitObj.val() == ''){
                    $(".radio .iradio_minimal").first().addClass("checked");
                }else{
                    $(".radio .iradio_minimal").removeClass("checked");
                    $(".radio[val="+unitObj.val()+"]").find(".iradio_minimal").addClass("checked");
                }
            },
            //选择户型
            selectUnit : function (){
                var unitId = $(".iradio_minimal.checked").parent().attr("val");
                var unitObj = $(".iradio_minimal.checked").parents(".form-group");

                var divObj = $("#"+$("#currentUnitId").val()).parents(".form-group");

                divObj.find("[name=unitId]").val(unitId);
                divObj.find("[name=unitImg]").attr("src",unitObj.find("img").attr("src"));
                divObj.find("[name=unitName]").text(unitObj.find(".col-sm-3 .form-group").eq(0).text());
                divObj.find("[name=unitArea]").text(unitObj.find(".col-sm-3 .form-group").eq(1).text());
                divObj.find("[name=unitPrice]").text(unitObj.find(".col-sm-3 .form-group").eq(2).text());

                $("#myModal").modal("hide");
            },
            //新增横切面
            addTransverse : function (tempFloorId, typeUnitId){
                var curTempTransverseId = $houseFloor.v.tempTransverseId;
                var template = $("#transverseTemplate").clone().removeAttr("id");
                template.attr("val",curTempTransverseId);
                template.find("[name=unitId]").attr("id","unitId_"+curTempTransverseId);
                if(typeUnitId != undefined && typeUnitId != ''){
                    template.attr("typeUnitId", typeUnitId);
                }
                template.show();
                $("#transverseDiv_"+tempFloorId).append(template);

                //给第一张图片加锚点
                if($("#transverseDiv_"+tempFloorId).find("[name=transverseGroup]").length == 1){
                    template.find(".btn-sm").attr("onclick","$houseFloor.fn.editLabel(this)");
                    //已存在的横切面才可以打锚点
                    if(typeUnitId != null && typeUnitId != undefined){
                        template.find(".btn-sm").show();
                    }
                }

                $houseFloor.v.tempTransverseId++;

                return curTempTransverseId;
            },
            //给当前横切面赋值
            setTransverse : function (curTempTransverseId, typeUnit){
                var obj = $("[name=transverseGroup][val="+curTempTransverseId+"]");

                obj.find("[name=transverseImageId]").val(typeUnit.transverseImage.id);
                if(typeUnit.transverseImage != null){
                    obj.find("img").eq(0).attr("src",typeUnit.transverseImage.uploadUrl);
                }
                obj.find("[name=unitId]").val(typeUnit.unit.id);
                if(typeUnit.unit.planeImage != null){
                    obj.find("[name=unitImg]").attr("src", typeUnit.unit.planeImage.uploadUrl);
                }
                obj.find("[name=unitName]").text("户型名称："+typeUnit.unit.name);
                obj.find("[name=unitArea]").text("建筑面积："+(typeUnit.unit.totalArea==null?'':typeUnit.unit.totalArea));
                obj.find("[name=unitPrice]").text("参考总价："+(typeUnit.unit.totalPrice==null?'':typeUnit.unit.totalPrice));
                obj.find("select option[value="+typeUnit.roomNo+"]").attr("selected",true);
            },
            //删除横切面
            removeTransverse : function(self){
                var typeUnitId = $(self).parents(".form-group").attr("typeunitid");
                $leoman.alertConfirm("确定要删除该户型吗？若删除，则相关数据都删除",function(){
                    if(typeUnitId != '' && typeUnitId != undefined){
                        $.post("${contextPath}/admin/house/floor/delTypeUnit", {typeUnitId:typeUnitId}, function(result){
                            if(result.status == 0){
                                $(self).parents(".form-group").remove();
                            }
                        });
                    }else{
                        $(self).parents(".form-group").remove();
                    }
                });

            },
            /* 图片 */
            AddTempImg: function (self) {
                $('#tempImage').click();
                $("#currentTransverseId").val($(self).parents(".form-group").attr("val"));
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (data) {
                        if (null != data.path && data.path != '') {
                            var obj = $("div.form-group[val="+$("#currentTransverseId").val()+"]");
                            obj.find("img").eq(0).attr("src",data.path);
                            obj.find("[name=transverseImageId]").val(data.id);
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },
            //保存
            save : function() {

                var data = [];

                var floorArr = $("#floorDiv .row");
                for(var i=0; i<floorArr.length; i++){

                    var floorJson = {
                        houseId : "${houseId}",
                        name : "楼层类型"+(i+1),
                        floorTypeId : $(floorArr[i]).attr("val"),
                        tranArr : []
                    };

                    var roomArr = [];

                    var transverseArr = $(floorArr[i]).find("[name=transverseGroup]");
                    for(var j=0; j<transverseArr.length; j++){
                        var imageId = $(transverseArr[j]).find("[name=transverseImageId]").val();
                        var unitId = $(transverseArr[j]).find("[name=unitId]").val();
                        var roomNo = $(transverseArr[j]).find("[name=roomNo]").val();

                        if(imageId == '' || unitId == ''){
                            $leoman.alertMsg("横切面图和户型都不能为空");
                            return ;
                        }
                        var typeUnitId = $(transverseArr[j]).attr("typeUnitId");
                        var transverseJson = {
                            imageId : imageId,
                            unitId : unitId,
                            roomNo : roomNo,
                            typeUnitId : typeUnitId
                        };
                        floorJson.tranArr.push(transverseJson);

                        //如果房间中已存在该房间号，则报错
                        if($.inArray(roomNo, roomArr) > -1){
                            $leoman.alertMsg(floorJson.name+"中存在相同的房间号，请修改");
                            return ;
                        }
                        roomArr.push(roomNo);
                    }

                    data.push(floorJson);
                }

                if(floorArr.length == 0 || $("[name=transverseDiv]").find("[name=transverseGroup]").length == 0){
                    $leoman.alertMsg("请至少添加一种楼层类型");
                    return ;
                }

                $leoman.showLoading();
                $.post("${contextPath}/admin/house/floor/save",{'data':JSON.stringify(data)},function(result){
                    if(result.status == 0){
                        window.location.href = "${contextPath}/admin/house/index";
                    }else{
                        $leoman.hideLoading();
                        $leoman.alertMsg(result.msg);
                    }
                });
            },
            //添加锚点
            editLabel : function(self){
                var imageId = $(self).parent().find("[name=transverseImageId]").val();
                window.location.href = "${contextPath}/admin/label/edit/${houseId}_"+imageId;
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }
    $(function () {
        $houseFloor.fn.init();
    })
</script>
</html>