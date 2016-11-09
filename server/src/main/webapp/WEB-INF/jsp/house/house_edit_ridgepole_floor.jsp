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
    <title>楼信息</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">楼信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>楼栋编号：</label>
                                <div class="col-sm-2">
                                    <input type="text" id="name" name="name" value="${ridgepole.name}" class="form-control" data-rule="required"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>合计楼层：</label>
                                <div class="col-sm-2">
                                    <input type="text" id="floorNum" name="floorNum" value="${ridgepole.floorNum}" class="form-control"
                                           data-rule="required" data-rule="integer(+0)"/>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary" onclick="$ridgepoleFloor.fn.saveFloorNum(this)">确定</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >最小楼间距：</label>
                                <div class="col-sm-2">
                                    <input type="text" id="minSpace" name="minSpace" value="${ridgepole.minSpace}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的最小楼间距']"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">米</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >选择方位：</label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" id="directionId">
                                        <c:forEach items="${directionList}" var="direction">
                                            <option value="${direction.id}">${direction.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form method="post" class="form-horizontal" role="form">

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
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

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

    <div class="col-sm-3">
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
                        <div class="col-sm-9 icheck minimal" id="selectAllChk">
                            <div class="checkbox"><input type="checkbox"><label>全选</label></div>
                        </div>
                    </div>

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
    <div class="col-sm-1 icheck minimal" name="checkDiv">

    </div>
    <label class="col-sm-3 control-label">楼层类型：</label>
    <div class="col-sm-5">
        <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;" border="1"/>
    </div>
</div>

<!-- 配置文件 -->

</body>

<%@ include file="../inc/footer.jsp" %>
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

                if("${ridgepole.direction}" != ''){
                    $("#directionId option[value="+"${ridgepole.direction.id}"+"]").attr("selected", true);
                }


            },
            //初始化楼层列表
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
                $leoman.alertConfirm("确定要移除该楼层类型信息吗？",function(){
                    $(self).parents(".form-group").remove();
                });
            },
            //设置当前行的值
            setRowValue : function(tempFloorTypeId, value){
                var obj = $(".floor[val="+tempFloorTypeId+"]");
                obj.find("[name=floorTypeId]").val(value.floorTypeId);
                if(value.typeUnit != null){
                    obj.find("[name=tranImg]").attr("src",value.typeUnit.transverseImage.uploadUrl);
                }
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

                    $ridgepoleFloor.fn.initCheckClick();
                }
            },
            //初始化checkbox的click事件
            initCheckClick : function(){
                $('.minimal input').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal',
                    increaseArea: '20%' // optional
                });

                $('#selectAllChk input').on('ifClicked', function(){
                    //如果点击之前是选中的，则点击全选为取消全选
                    if($(this).is(":checked")){
                        $("#floorDiv .icheckbox_minimal").removeClass("checked");
                    }
                    //如果点击之前不是选中的，则点击全选为全选
                    else{
                        $("#floorDiv .icheckbox_minimal").addClass("checked");
                    }
                });
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

                //当前选中的楼层类型的id
                var floorTypeId = $(".iradio_minimal.checked").parent().attr("val");
                if($("[name=floorTypeId][value="+floorTypeId+"]").length > 0){
                    $leoman.alertMsg("当前楼层类型已存在，可以在该楼层类型里修改对应的楼层");
                    return ;
                }

                var floorTypeObj = $(".iradio_minimal.checked").parents(".form-group");

                var divObj = $("#"+$("#currentFloorTypeId").val()).parents(".form-group");

                divObj.find("[name=floorTypeId]").val(floorTypeId);
                divObj.find("[name=tranImg]").attr("src",floorTypeObj.find("img").attr("src"));

                $("#myModal").modal("hide");
            },

            /* 图片 */
            AddTempImg: function (self) {
                $('#tempImage').click();
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (data) {
                        if (null != data.path && data.path != '') {
                            $("form img").attr("src",data.path);
                            $("#directionImageId").val(data.id);
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },

            //保存
            save : function() {

                if(!$("#formId").isValid()) return;

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
                    directionId : $("#directionId").val(),
                    floorArr : []
                };

                var floorNoArr = [];
                var floorArr = $("#ridgepoleDiv .floor");
                for(var i=0; i<floorArr.length; i++){

                    var floorTypeId = $(floorArr[i]).find("[name=floorTypeId]").val();
                    var floorNos = $(floorArr[i]).find("[name=selectedFloorValue]").val();

                    if(floorTypeId == '' || floorNos == ''){
                        $leoman.alertMsg("楼层类型和楼层都不能为空");
                        return ;
                    }

                    var perFloorNoArr = floorNos.split(",");
                    for(var j=0; j<perFloorNoArr.length; j++){
                        //如果楼层列表中包含新增的楼层，则说明重复，报错
                        if($.inArray(perFloorNoArr[j], floorNoArr) > -1){
                            $leoman.alertMsg("选择的楼层存在重复，请重新选择");
                            return ;
                        }
                        floorNoArr.push(perFloorNoArr[j]);
                    }

                    var floorType = {
                        floorTypeId : floorTypeId,
                        floorNos : floorNos
                    };
                    data.floorArr.push(floorType);
                }

                $leoman.showLoading();
                //保存
                $.post("${contextPath}/admin/house/ridgepole/save",{'data':JSON.stringify(data)},function(result){
                    if(result.status == 0){
                        $ridgepoleFloor.fn.back();
                    }else{
                        $leoman.hideLoading();
                        $leoman.alertMsg(result.msg);
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/ridgepole/edit/${houseId}";
            }
        }
    };

    $(function () {
        $ridgepoleFloor.fn.init();
    });
</script>

</html>