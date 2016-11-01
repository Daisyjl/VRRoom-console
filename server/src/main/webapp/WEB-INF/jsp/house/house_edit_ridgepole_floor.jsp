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
    <title>编辑楼类型</title>
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

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">

                        <header class="panel-heading">
                            楼信息
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form" id="formId">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >楼栋编号：</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="name" name="name" value="${ridgepole.name}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >合计楼层：</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="floorNum" name="floorNum" value="${ridgepole.floorNum}" class="form-control" required number-0="true"/>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" class="btn btn-primary" onclick="$ridgepoleFloor.fn.saveFloorNum(this)">确定</button>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >最小楼间距：</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="minSpace" name="minSpace" value="${ridgepole.minSpace}" class="form-control" required number-2="true"/>
                                    </div>
                                    <label class="col-sm-1 control-label" style="text-align: left">米</label>
                                </div>

                            </form>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">

                        <header class="panel-heading">
                            楼层信息
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form">

                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary" onclick="$ridgepoleFloor.fn.addRow(this)"><i class="fa fa-plus"></i> 新增</button>
                                    </div>
                                </div>

                                <div id="ridgepoleDiv">

                                </div>



                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$ridgepoleFloor.fn.save()" class="btn btn-primary">保存</button>
                                        <button type="button" onclick="$ridgepoleFloor.fn.back()" class="btn btn-primary">返回</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </div>

        </section>

    </div>
    <!-- main content end-->

    <!-- 楼层类型 模板 -->
    <input type="hidden" id="currentRowId">
    <div class="form-group floor" style="display: none;" id="ridgepoleTemplate">

        <label class="col-sm-1 control-label">选择楼层类型：</label>
        <input type="hidden" name="floorTypeId" value="">
        <div class="col-sm-2">
            <a href="javascript:void(0);" onclick="$ridgepoleFloor.fn.openModal(this)">
                <img name="tranImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
            </a>
        </div>

        <label class="col-sm-1 control-label">选择方位图：</label>
        <div class="col-sm-2">
            <input type="hidden" name="directionImageId" value="">
            <a href="javascript:void(0);" onclick="$ridgepoleFloor.fn.AddTempImg(this)">
                <img src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
            </a>
        </div>

        <div class="col-sm-2">
            <input type="hidden" name="selectedFloorValue" value="">
            <div class="form-group" name="selectedFloor">

            </div>

            <div class="form-group">
                <button type="button" class="btn btn-primary" onclick="$ridgepoleFloor.fn.openFloorModal(this)">选择楼层</button>
            </div>

        </div>

        <div class="col-sm-2">
            <button type="button" class="btn btn-primary" onclick="$ridgepoleFloor.fn.removeRow(this)"><i class="fa fa-minus"></i> 移除</button>
        </div>

    </div>

    <!-- 图片上传form -->
    <form id="tempImageForm" method="post" action="${contextPath}/common/file/addTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
        <input type="file" name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$ridgepoleFloor.fn.saveTempImage()"/>
    </form>


    <!-- 选择楼层类型弹出框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">选择楼层类型</h4>
                </div>
                <div class="modal-body">
                    <form class="cmxform form-horizontal adminex-form" id="unitForm" enctype="multipart/form-data">
                        <input type="hidden" id="currentFloorTypeId" value="">

                        <div id="floorTypeDiv">

                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="$ridgepoleFloor.fn.selectFloorType()" class="btn btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <!-- 选择楼层弹出框 -->
    <div class="modal fade" id="floorModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">选择楼层</h4>
                </div>
                <div class="modal-body">
                    <form class="cmxform form-horizontal adminex-form" enctype="multipart/form-data">

                        <div class="form-group">
                            <div class="col-sm-9 icheck minimal" id="floorDiv">

                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="$ridgepoleFloor.fn.selectFloor()" class="btn btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <!-- 楼层类型 template -->
    <div class="form-group" style="display: none;" id="floorTypeTemplate">
        <%--<div class="col-sm-1">
            <input type="radio" name="floorTypeRadio">
        </div>--%>
        <div class="col-sm-1 icheck minimal" name="checkDiv">

        </div>
        <label class="col-sm-3 control-label">楼层类型：</label>
        <div class="col-sm-5">
            <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;" border="1"/>
        </div>
    </div>

</section>
<%@ include file="../inc/new2/foot.jsp" %>
<script>
    $ridgepoleFloor = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            tempFloorTypeId : null,
            tempFloorId : null,
        },
        fn: {
            init: function () {

                $ridgepoleFloor.v.tempFloorTypeId = 0;
                $ridgepoleFloor.v.tempFloorId = 0;

                //初始化加载楼层类型列表
                $ridgepoleFloor.fn.initFloorList();

                //初始化加载弹出框的户型列表
                $ridgepoleFloor.fn.initFloorTypeList();

                if("${ridgepole.floorNum}" != ''){
                    $ridgepoleFloor.fn.initFloorNumList("${ridgepole.floorNum}");

                    $("#floorNum").attr("readonly",true);
                    $("#floorNum").parent().next().find("button").text("编辑");

                }
            },
            initFloorList : function(){
                $.post("${contextPath}/admin/house/ridgepole/floorList",{'ridgepoleId':"${ridgepole.id}"},function(result){
                    if(result != null){
                        var list = result;
                        for(var i=0; i < list.length; i++){
                            var tempFloorTypeId = $ridgepoleFloor.fn.addRow();
                            $ridgepoleFloor.fn.setRowValue(tempFloorTypeId, list[i]);
                        }
                    }
                });
            },
            //新增楼层类型行
            addRow : function(){
                if($("#floorNum").attr("readonly") == "readonly"){
                    var template = $("#ridgepoleTemplate").clone().removeAttr("id");
                    var tempFloorTypeId = $ridgepoleFloor.v.tempFloorTypeId;
                    template.find("label").eq(0).text("楼层类型"+(tempFloorTypeId+1));
                    template.attr("val",tempFloorTypeId);

                    template.find("[name=floorTypeId]").attr("id","floorTypeId_"+tempFloorTypeId);
                    template.show();
                    $("#ridgepoleDiv").append(template);

                    $ridgepoleFloor.v.tempFloorTypeId++;

                    return tempFloorTypeId;
                }else{
                    $leoman.alertMsg("请先确定楼层数量")
                }
            },
            //删除横切面
            removeRow : function(self){
                $(self).parents(".form-group").remove();
            },
            //设置当前行的值
            setRowValue : function(tempFloorTypeId, value){
                var obj = $(".floor[val="+tempFloorTypeId+"]");
                obj.find("[name=floorTypeId]").val(value.floorTypeId);
                if(value.typeUnit != null){
                    obj.find("[name=tranImg]").attr("src",value.typeUnit.transverseImage.uploadUrl);
                }
                obj.find("[name=directionImageId]").val(value.directionImageId);
                obj.find("img").eq(1).attr("src",value.directionImage.uploadUrl);
                obj.find("[name=selectedFloorValue]").val(value.floorNos);
                obj.find("[name=selectedFloor]").text(value.floorNos.split(",").join("楼，")+"楼");
            },
            //保存输入的楼层值
            saveFloorNum:function(self){
                var btnTxt = $(self).text();
                if(btnTxt == '编辑'){
                    $leoman.alertConfirm("确定要编辑吗？若编辑，则之前的楼层信息将清空，需重新编辑楼层信息",function(){
                        $(self).parents(".form-group").find("input").attr("readonly",false);
                        $(self).text("确定");
                    })
                }else if(btnTxt == '确定'){
                    var floorNum = $(self).parents(".form-group").find("input").val();

                    if(floorNum == '' || floorNum == 0 || !/^[0-9]*$/.test(floorNum)){
                        $leoman.alertMsg("请输入正确的楼层数量");
                        return ;
                    }
                    $(self).parents(".form-group").find("input").attr("readonly",true);
                    $(self).text("编辑");
                    $ridgepoleFloor.fn.initFloorNumList(floorNum);
                    $("#ridgepoleDiv").empty();//清空楼层信息
                }
            },
            //根据输入的楼层数量，初始化弹出框的楼层复选框
            initFloorNumList :function (floorNum){
                if(floorNum != '' && floorNum != undefined && floorNum >= 0){
                    for(var i=0; i<floorNum; i++){
                        $("#floorDiv").append('<div class="checkbox" val="'+(i+1)+'"><input type="checkbox"><label>'+(i+1)+'楼</label></div>');
                    }

                    $('.minimal input').iCheck({
                        checkboxClass: 'icheckbox_minimal',
                        radioClass: 'iradio_minimal',
                        increaseArea: '20%' // optional
                    });
                }
            },
            //打开选择楼层弹出框
            openFloorModal : function(self){
                $("#floorModal").modal("show");
                $("#currentRowId").val($(self).parents(".floor").attr("val"));
                var value = $(self).parent().prev().prev("[name=selectedFloorValue]").val();//已选中的楼层值
                $ridgepoleFloor.fn.setFloorChecked(value);
            },
            //根据当前楼层的选中值，设置复选框的选中
            setFloorChecked : function(value){
                var arr = value.split(",");
                $(".checkbox").find(".icheckbox_minimal").removeClass("checked");
                for(var i=0; i<arr.length; i++){
                    $(".checkbox[val="+arr[i]+"]").find(".icheckbox_minimal").addClass("checked");
                }
            },
            //确定选择的楼层
            selectFloor:function(){
                var arr = [];
                $("#floorDiv").find("div.checked").each(function(){
                    arr.push($(this).parents(".checkbox").attr("val"));
                });

                var obj = $("#ridgepoleDiv").find("div.form-group[val="+$("#currentRowId").val()+"]");
                obj.find("[name=selectedFloor]").text(arr.join("楼，")+"楼");
                obj.find("[name=selectedFloorValue]").val(arr.join(","));

                $("#floorModal").modal("hide");

            },
            //初始化弹出框的楼层类型
            initFloorTypeList : function(){
                $("#floorTypeDiv").empty();
                $.post("${contextPath}/admin/house/floor/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            var floorTypeTemplate = $("#floorTypeTemplate").clone().removeAttr("id");
                            floorTypeTemplate.find("label").text("楼层类型"+(i+1)+"：");
                            var path = list[i].typeUnitList[0].transverseImage.uploadUrl;
                            floorTypeTemplate.find("img").prop("src",path);
//                            floorTypeTemplate.find("input[type=radio]").val(list[i].id);
                            floorTypeTemplate.find("[name=checkDiv]").append('<div class="radio" val="'+list[i].id+'"><input type="radio" name="unitRadio"></div>');

                            floorTypeTemplate.show();
                            $("#floorTypeDiv").append(floorTypeTemplate);

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
            //打开选择楼层类型对话框
            openModal : function (self){
                $("#myModal").modal("show");
//                $("#currentFloorTypeId").val($(self).parents(".form-group").find("[name=floorTypeId]").attr("id"));

                var unitObj = $(self).parents(".form-group").find("[name=floorTypeId]");
                $("#currentFloorTypeId").val(unitObj.attr("id"));

                if(unitObj.val() == ''){
                    $(".radio .iradio_minimal").first().addClass("checked");
                }else{
                    $(".radio .iradio_minimal").removeClass("checked");
                    $(".radio[val="+unitObj.val()+"]").find(".iradio_minimal").addClass("checked");
                }
            },
            //选择楼层类型
            selectFloorType : function (){

                var floorTypeId = $(".iradio_minimal.checked").parent().attr("val");
                var floorTypeObj = $(".iradio_minimal.checked").parents(".form-group");

                var divObj = $("#"+$("#currentFloorTypeId").val()).parents(".form-group");

                divObj.find("[name=floorTypeId]").val(floorTypeId);
                divObj.find("[name=tranImg]").attr("src",floorTypeObj.find("img").attr("src"));

                $("#myModal").modal("hide");
            },

            /* 图片 */
            AddTempImg: function (self) {
                $('#tempImage').click();
                $("#currentFloorTypeId").val($(self).parents(".form-group").attr("val"));
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (data) {
                        if (null != data.path && data.path != '') {
                            var obj = $("div.form-group[val="+$("#currentFloorTypeId").val()+"]");
                            obj.find("img").eq(1).attr("src",data.path);
                            obj.find("[name=directionImageId]").val(data.id);
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },

            //保存
            save : function() {

                if(!$("#formId").valid()) return;

                if($("#ridgepoleDiv .floor").length == 0){
                    $leoman.alertMsg("请至少保存一条楼层信息");
                    return ;
                }

                var data = {
                    ridgepoleId : "${ridgepole.id}",
                    houseId : "${houseId}",
                    labelId : "${labelId}",
                    name : $("#name").val(),
                    floorNum : $("#floorNum").val(),
                    minSpace : $("#minSpace").val(),
                    floorArr : []
                };

                var floorArr = $("#ridgepoleDiv .floor");
                for(var i=0; i<floorArr.length; i++){

                    var floorTypeId = $(floorArr[i]).find("[name=floorTypeId]").val();
                    var imageId = $(floorArr[i]).find("[name=directionImageId]").val();
                    var floorNos = $(floorArr[i]).find("[name=selectedFloorValue]").val();

                    var floorType = {
                        imageId : imageId,
                        floorTypeId : floorTypeId,
                        floorNos : floorNos
                    };
                    data.floorArr.push(floorType);
                }

                $.post("${contextPath}/admin/house/ridgepole/save",{'data':JSON.stringify(data)},function(result){
                    if(result.status == 0){
                        $ridgepoleFloor.fn.back();
                    }else{
                        $leoman.alertMsg(result.msg);
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/ridgepole/edit/${houseId}";
            }
        }
    }
    $(function () {
        $ridgepoleFloor.fn.init();
    })
</script>
</body>
</html>
