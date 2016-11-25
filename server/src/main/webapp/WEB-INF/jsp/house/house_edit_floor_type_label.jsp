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
        /*模块拖拽*/
        .drag {
            position: absolute;
            width: 50px;
            height: 30px;
            border: 1px solid #ddd;
            background: #FBF2BD;
            text-align: center;
            padding: 5px;
            cursor: move;;
            opacity: 0.7;
            border-radius: 5px;
        }
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
                                <label class="col-sm-6 control-label" style="text-align: left">
                                    (提示：先上传楼层图和锚点图，点击生成锚点，生成楼层图和锚点对应关系之后，再保存楼层横切面信息。可通过移动替换楼层图上的锚点来改变房间号)</label>
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
                        <label class="col-sm-1 control-label" >楼层图：</label>
                        <div class="col-sm-2">
                            <input type="hidden" name="roomNum" value="">
                            <input type="hidden" name="bigImageId" value="">
                            <a href="javascript:void(0);" onclick="$houseFloor.fn.AddTempImg(this)">
                                <img src="static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                            </a>
                        </div>

                        <label class="col-sm-1 control-label" >锚点图：</label>
                        <div class="col-sm-1">
                            <input type="hidden"  name="smallImageId" value="">
                            <a href="javascript:void(0);" onclick="$houseFloor.fn.AddTempImg(this)">
                                <img src="static/images/add.jpg" style="height: 50px; width: 50px; display: inline; margin-bottom: 5px;" border="1"/>
                            </a>
                        </div>

                        <div class="col-sm-1">
                            <button type="button" onclick="$houseFloor.fn.getPoints(this)" class="btn btn-primary">生成锚点</button>
                        </div>

                        <div class="col-sm-2">
                            <div style="height: 300px; width: 600px; position: relative;">
                                <img src="" style="height: 100%; width: 100%; position: absolute;" border="1"/>
                                <div name="pointDiv"></div>
                            </div>
                            <%--<img src="" style="height: 250px; width: 500px; position: relative;" border="1"/>--%>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">楼层横切面图：</label>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> 新增横切面</button>
                        </div>
                    </div>

                    <div id="transverseDiv_" name="transverseDiv">

                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 隐藏区域--标签 -->
<div id="temp" style="display: none;" class="drag" draggable="true"
     ondrop="$houseFloor.fn.drop(event,this)"
     ondragover="$houseFloor.fn.allowDrop(event)"
     ondragstart="$houseFloor.fn.drag(event, this)">
    <div></div>
</div>

<!-- 横切面template -->
<input type="hidden" id="currentImgId" value="">
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
            tempTransverseId : 0,
            tempFloorId : 0,
            tempImageId : 0,
            srcdiv : null
        },
        fn: {
            init: function () {

                //初始化加载楼层类型列表
                $houseFloor.fn.initFloorList();

                //初始化加载弹出框的户型列表
                $houseFloor.fn.initUnitList();
            },
            /* 拖拽替换元素 */
            allowDrop : function(ev){
                ev.preventDefault();
            },
            drag : function(ev,divdom){
                $houseFloor.v.srcdiv = divdom;
                ev.dataTransfer.setData("text/html",divdom.innerHTML);
            },
            drop : function(ev,divdom){
                ev.preventDefault();
                if($houseFloor.v.srcdiv != divdom) {
                    $houseFloor.v.srcdiv.innerHTML = divdom.innerHTML;
                    divdom.innerHTML = ev.dataTransfer.getData("text/html");
                }
            },
            /* 楼层 */
            initFloorList:function(){
                $.post("${contextPath}/admin/house/floor/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            $houseFloor.fn.addFloorType(list[i]);

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
            addFloorType:function(obj){

                var template = $("#floorTypeTemplate").clone().removeAttr("id");
                template.find("header label").text("楼层类型"+($houseFloor.v.tempFloorId+1));
                template.find("[name=transverseDiv]").attr("id","transverseDiv_"+$houseFloor.v.tempFloorId);
                template.find("button").eq(1).attr("onclick","$houseFloor.fn.addTransverse("+$houseFloor.v.tempFloorId+")");
                template.find("img").eq(0).attr("id", "img_"+$houseFloor.v.tempImageId);//楼层图
                $houseFloor.v.tempImageId++;
                template.find("img").eq(1).attr("id", "img_"+$houseFloor.v.tempImageId);//锚点图
                template.attr("id", "row_"+$houseFloor.v.tempFloorId);
                template.show();
                $("#floorDiv").append(template);

                //若楼层类型不为空，则加载楼层类型的信息
                if(obj != '' && obj != undefined){
                    var floorTypeId = obj.id;
                    template.attr("val", floorTypeId);
                    template.find("[name=roomNum]").val(obj.roomNum);//房间数
                    template.find("[name=bigImageId]").val(obj.bigImage.id);//楼层图
                    template.find("img").eq(0).attr("src", obj.bigImage.uploadUrl);

                    template.find("[name=smallImageId]").val(obj.smallImage.id);//锚点图
                    template.find("img").eq(1).attr("src", obj.smallImage.uploadUrl);

                    //加载楼层图和对应锚点
                    template.find("img").eq(2).attr("src", obj.bigImage.uploadUrl);
                    var imgAttr = eval('('+obj.bigImage.attribute+')');
                    template.find("img").eq(0).attr("realWidth", imgAttr.width);
                    template.find("img").eq(0).attr("realHeight", imgAttr.height);
                    var widthPercent = parseInt(template.find("img").eq(2).css("width"))/imgAttr.width;//楼层图固定宽/楼层图原图宽比
                    var heightPercent = parseInt(template.find("img").eq(2).css("height"))/imgAttr.height;//楼层图固定高/楼层图原图高比
                    template.find("img").eq(2).attr("widthPercent", widthPercent);
                    template.find("img").eq(2).attr("heightPercent", heightPercent);
                    var list = obj.bigImage.labelList;
                    for(var i=0; i<list.length; i++){
                        $houseFloor.fn.insertLabel(template.find("[name=pointDiv]"),
                                list[i].newLeftPoint*widthPercent, list[i].newTopPoint*heightPercent, list[i].name, list[i].labelId);
                    }
                }else{
                    //添加楼层后滚动到指定楼层
                    $('html, body').animate({
                        scrollTop: $("#row_"+$houseFloor.v.tempFloorId).offset().top
                    }, 500);
                }

                var obj = $("#transverseDiv_"+$houseFloor.v.tempFloorId).parents(".row");

                //初始化楼层右上角的收缩和删除楼层块的事件
                obj.find('.panel .tools .fa-times').click(function () {
                    var deleteObj = $(this);
                    $leoman.alertConfirm("确定要删除该楼层类型吗？若删除，则其相关数据都删除",function(){
                        if(floorTypeId != '' && floorTypeId != undefined){
                            $.post("${contextPath}/admin/house/floor/delFloorType", {floorTypeId:floorTypeId}, function(result){
                                if(result.status == 0){
                                    deleteObj.parents(".row").remove();
                                }else{
                                    $leoman.alertMsg(result.msg);
                                }
                            });
                        }else{
                            deleteObj.parents(".row").remove();
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
                $houseFloor.v.tempImageId++;

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
            //插入标签
            insertLabel:function (obj, left, top, name, labelId){
                var tempDiv = $("#temp").clone();
                var labelId = (labelId != '' && labelId != undefined)?labelId:("tempDiv" + (new Date()).getTime()+$leoman.getRandomStr(3));
                tempDiv.attr("id", labelId);
                tempDiv.css("display", "block");
                tempDiv.css("left", left + "px");
                tempDiv.css("top", top + "px");
                tempDiv.css("background", "#ABF2BD");
                tempDiv.children(":first").html(name);
                $(obj).append(tempDiv);
            },
            //根据楼层图和锚点生成点的坐标列表
            getPoints : function(self){
                var obj = $(self).parents(".form-group");
                var bigImageId = obj.find("[name=bigImageId]").val();
                var smallImageId = obj.find("[name=smallImageId]").val();
                if(bigImageId == '' || bigImageId == undefined || smallImageId == '' || smallImageId == undefined){
                    $leoman.alertMsg("请上传楼层图和锚点图");
                    return ;
                }
                $.post("${contextPath}/admin/house/floor/findPoints", {bigImageId:bigImageId,smallImageId:smallImageId}, function(result){
                    if(result.status == 0){

                        obj.find("img").eq(2).attr("src", obj.find("img").eq(0).attr("src"));
                        var widthPercent = parseInt(obj.find("img").eq(2).css("width"))/obj.find("img").eq(0).attr("realWidth");
                        var heightPercent = parseInt(obj.find("img").eq(2).css("height"))/obj.find("img").eq(0).attr("realHeight");
                        obj.find("img").eq(2).attr("widthPercent", widthPercent);
                        obj.find("img").eq(2).attr("heightPercent", heightPercent);
                        //把5个锚点放在图片的对应位置上
                        obj.find("[name=pointDiv]").empty();
                        var list = result.data.list;
                        obj.find("[name=roomNum]").val(list.length);
                        for(var i=0; i<list.length; i++){
                            $houseFloor.fn.insertLabel(obj.find("[name=pointDiv]"), list[i].left*widthPercent, list[i].top*heightPercent, (i+1));
                        }

                    }
                });
            },
            //新增横切面
            addTransverse : function (tempFloorId, typeUnitId){
                var curTempTransverseId = $houseFloor.v.tempTransverseId;
                var template = $("#transverseTemplate").clone().removeAttr("id");

                var obj = $("#transverseDiv_"+tempFloorId).parents(".row");//当前楼层类型
                //获取该楼层类型的房间数，生成对应数量的房间号
                var roomNum = obj.find("[name=roomNum]").val();
                if(roomNum == '' || roomNum == undefined){
                    $leoman.alertMsg("请先上传楼层图和锚点图生成锚点之后，再编辑横切面");
                    return ;
                }
                template.find("select").empty();
                for(var i=0; i<roomNum; i++){
                    template.find("select").append('<option value="'+(i+1)+'">'+(i+1)+'</option>');
                }

                template.attr("val",curTempTransverseId);
                template.find("[name=unitId]").attr("id","unitId_"+curTempTransverseId);
                if(typeUnitId != undefined && typeUnitId != ''){
                    template.attr("typeUnitId", typeUnitId);
                }else{
                    //如果没有生成锚点，则无法编辑横切面
                    if(obj.find("[name=bigImageId]").val() == '' ||
                            obj.find("[name=smallImageId]").val() == '' ||
                            obj.find(".drag").length == 0){
                        $leoman.alertMsg("请先上传楼层图和锚点图生成锚点之后，再编辑横切面");
                        return ;
                    }
                }
                template.find("img").eq(0).attr("id", "img_"+$houseFloor.v.tempImageId);
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
                $houseFloor.v.tempImageId++;

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
                $("#currentImgId").val($(self).find("img").attr("id"));
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (data) {
                        if (null != data.path && data.path != '') {
                            /*var obj = $("div.form-group[val="+$("#currentTransverseId").val()+"]");
                            obj.find("img").eq(0).attr("src",data.path);
                            obj.find("[name=transverseImageId]").val(data.id);*/

                            $("#"+$("#currentImgId").val()).attr("src",data.path);
                            $("#"+$("#currentImgId").val()).parent().prev("input").val(data.id);
                            var imgAttr = eval('('+data.attribute+')');
                            $("#"+$("#currentImgId").val()).attr("realHeight",imgAttr.height);
                            $("#"+$("#currentImgId").val()).attr("realWidth",imgAttr.width);
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
                        bigImageId : $(floorArr[i]).find("[name=bigImageId]").val(),
                        smallImageId : $(floorArr[i]).find("[name=smallImageId]").val(),
                        roomNum : $(floorArr[i]).find("[name=roomNum]").val(),
                        labelArr : [],
                        tranArr : []
                    };

                    //获取楼层图对应的点坐标
                    var widthPercent = $(floorArr[i]).find("img").eq(2).attr("widthPercent");
                    var heightPercent = $(floorArr[i]).find("img").eq(2).attr("heightPercent");
                    var pointArr = $(floorArr[i]).find(".drag");
                    for(var k=0; k<pointArr.length; k++){
                        var newLeftPoint = parseFloat($(pointArr[k]).css("left"))/widthPercent;
                        var newTopPoint = parseFloat($(pointArr[k]).css("top"))/heightPercent;
                        var name = $(pointArr[k]).find("div").text();
                        var label = {
                            objectId : floorJson.bigImageId,
                            labelId : $(pointArr[k]).attr("id"),
                            name : name,
                            newLeftPoint : newLeftPoint.toFixed(0),
                            newTopPoint : newTopPoint.toFixed(0)
                        };
                        floorJson.labelArr.push(label);
                    }
                    console.info(floorJson.labelArr);

                    if(floorJson.bigImageId == '' || floorJson.smallImageId == '' || floorJson.labelArr.length == 0){
                        $leoman.alertMsg("楼层图和锚点信息不能为空");
                        return ;
                    }

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

                console.info(data);

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