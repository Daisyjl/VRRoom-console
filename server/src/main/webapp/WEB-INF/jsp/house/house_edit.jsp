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
    <title>编辑楼盘</title>
    <%@ include file="../inc/css.jsp" %>
    <style type="text/css">
        #allmap {width: 600px;height: 400px;overflow: hidden;margin:0;font-family:"微软雅黑";}
        .radio label, .checkbox label {
            padding-left: 0px;
            margin-bottom: 0;
            font-weight: 400;
            cursor: pointer
        }
        div.checkbox{
            margin-right: 50px;
        }
    </style>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑楼盘</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input type="hidden" name="id" value="${house.id}">
                            <input type="hidden" name="status" value="${house.status}">
                            <input type="hidden" name="bigImage.id" value="${house.bigImage.id}">
                            <input type="hidden" name="openTime" value="">
                            <input type="hidden" name="dealTime" value="">
                            <input type="hidden" name="privilege" value="">

                            <div class="form-group">
                                <label class="col-sm-1 control-label"><span style="color: red;">* </span>楼盘封面：</label>
                                <div id="imageDiv">

                                </div>

                                <div class="col-sm-2">
                                    <input type="file" style="display:none;"/>
                                    <a href="javascript:void(0);" onclick="$house.fn.AddTempImg(this)">
                                        <img id="addImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>楼盘名称：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="name" value="${house.name}" class="form-control" data-rule="required" maxlength="30"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>所属企业：</label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="enterprise.id"  data-rule="required">
                                        <option value="">---请选择---</option>
                                        <c:forEach items="${enterpriseList}" var="enterprise">
                                            <option value="${enterprise.id}">${enterprise.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">楼盘特色：</label>
                                <%--<div class="col-sm-3">
                                    <input id="tags_1" type="text" name="label" class="tags" value="${house.label}" />
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left">(每输入一个标签，按回车键即可)</label>--%>

                                <div class="col-sm-2">
                                    <button type="button" onclick="$house.fn.openFeature()" class="btn btn-primary">选择特色</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <%--<div class="col-sm-3">
                                    <input id="tags_1" type="text" name="label" class="tags" value="${house.label}" />
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left">(每输入一个标签，按回车键即可)</label>--%>
                                <div class="col-sm-6" id="featureDiv">

                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >开盘时间：</label>

                                <%--<div class="col-sm-2 icheck minimal">
                                    <div class="radio" val="0">
                                        <input type="radio" name="isOpenWait" value="0">
                                        <label>待定</label>
                                    </div>

                                    <div class="radio" val="1">
                                        <input type="radio" name="isOpenWait" value="1">
                                        <label>指定开盘时间</label>
                                    </div>
                                </div>--%>

                                <div class="col-sm-2">
                                    <input type="text" id="openTime" class="form-control input-append date form_datetime" style="width: 180px;" readonly  value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >开发商：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="developers" value="${house.developers}" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >交房时间：</label>

                                <%--<div class="col-sm-2 icheck minimal">
                                    <div class="radio" val="0">
                                        <input type="radio" name="isDealWait" value="0">
                                        <label>待定</label>
                                    </div>

                                    <div class="radio" val="1">
                                        <input type="radio" name="isDealWait" value="1">
                                        <label>指定交房时间</label>
                                    </div>
                                </div>--%>

                                <div class="col-sm-2">
                                    <input type="text" id="dealTime" class="form-control input-append date form_datetime" style="width: 180px;" readonly  value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >产权年限：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="propertyLimit" value="${house.propertyLimit}" class="form-control"
                                           data-rule="integer(+0)"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">年</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >装修类型：</label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="decorateTypeId">
                                        <c:forEach items="${decorateTypeList}" var="decorateType">
                                        <option value="${decorateType.id}">${decorateType.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >容积率：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="plotTatio" value="${house.plotTatio}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的容积率']" />
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">%</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >绿化比例：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="greening" value="${house.greening}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的绿化比例']"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">%</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >总户数：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="householdNum" value="${house.householdNum}" class="form-control"
                                           data-rule="integer(+0)"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">户</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >物业公司：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="propertyCompany" value="${house.propertyCompany}" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >是否上门：</label>

                                <div class="col-sm-1 icheck minimal" name="checkDiv">
                                    <div class="checkbox"><input type="checkbox" id="isDoor"></div>
                                    <input type="hidden" value="" name="isDoor">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >购房优惠：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="privil" value="" class="form-control"/>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" onclick="$house.fn.addRow()" class="btn btn-primary btn-circle"><i class='fa fa-plus'></i> </button>
                                </div>
                            </div>

                            <div id="privilegeDiv">

                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >预估单价：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="unitPrice" value="${house.unitPrice}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的绿化比例']"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">￥</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>楼盘地址：</label>
                                <div class="col-sm-3">
                                    <div id="allmap"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ></label>
                                <label class="col-sm-1 control-label" >关键字搜索：</label>
                                <div class="col-sm-3">
                                    <input type="text" id="suggestId" placeholder="请输入关键字搜索地址" class="form-control"/>
                                    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ></label>
                                <label class="col-sm-1 control-label" >楼盘地址：</label>
                                <div class="col-sm-3">
                                    <input type="text" name="address" value="${house.address}" class="form-control" data-rule="required" readonly/>
                                    <input type="hidden" id="longitude" name="lng" value="${house.lng}">
                                    <input type="hidden" id="latitude" name="lat" value="${house.lat}">
                                    <input type="hidden" id="district" name="district" value="${house.region.name}" data-rule="required">
                                </div>
                                <label class="col-sm-1 control-label" >详细地址：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="addressDetail" value="${house.addressDetail}" class="form-control" placeholder="详细地址：如xx层xx号"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">简介：</label>
                                <div class="col-sm-6">
                                    <script type="text/plain" id="myEditor" name="intro" style="width:650px;height:350px;">${house.intro}</script>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$house.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$house.fn.back()">返回</button>
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

<!-- 优惠模板 -->
<div class="form-group" id="privilegeTempalte" style="display: none;">
    <label class="col-sm-1 control-label" ></label>
    <div class="col-sm-2">
        <input type="text" name="privil" value="" class="form-control"/>
    </div>
    <div class="col-sm-2">
        <button type="button" onclick="$house.fn.removeRow(this)" class="btn btn-primary btn-circle"><i class='fa fa-minus'></i> </button>
    </div>
</div>

<form id="tempImageForm" method="post" action="${contextPath}/common/file/addMultiTempImage" enctype="multipart/form-data" class="form-horizontal" role="form">
    <input type="file" multiple name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="$house.fn.saveTempImage()"/>
</form>

<!-- 图片模板 -->
<input type="hidden" id="curImageId" value="">
<div class="col-sm-2" style="display: none;" id="imageTemplate">
    <%--<input type="file" name="file" style="display:none;"/>--%>
    <input type="hidden" name="imageIds" value="">
    <a href="javascript:void(0);">
        <img id="" name="path" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 10px;" border="1"/>
    </a>
    <a href="javascript:void(0);" style="z-index: 10; position: relative; bottom: 70px; left: -23px;" class="axx" onclick="$house.fn.deleteImage(this)">
        <img src="${contextPath}/static/images/xx.png" style="height: 16px; width: 16px; display: inline;" border="1"/>
    </a>
</div>

<!-- 选择特色弹出框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">选择特色</h4>
            </div>
            <div class="modal-body">
                <form class="cmxform form-horizontal adminex-form" enctype="multipart/form-data">

                    <div class="form-group">
                        <div class="col-sm-9 icheck minimal" id="selectAllChk">
                            <div class="checkbox"><input type="checkbox"><label>全选</label></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 icheck minimal" id="allFeatureDiv">

                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="$house.fn.saveFeature()" class="btn btn-primary">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


</body>
<%@ include file="../inc/footer.jsp" %>
<script src="http://api.map.baidu.com/api?v=2.0&ak=pcExWaLfoopv7vZ5hO1B8ej8"></script>
<script>
    $house = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
            tempImageId:null
        },
        fn: {
            init: function () {

                $house.v.tempImageId = 0;

                UM.getEditor('myEditor');

                $('.form_datetime').datetimepicker({
                    language: 'zh-CN',
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    minView: 'month',
                    forceParse: 0,
                    showMeridian: false,
                    format: 'yyyy-mm-dd'
                });

                $('.minimal input').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal',
                    increaseArea: '20%' // optional
                });

                //单选框的选择事件
                $('.minimal input').on('ifChecked', function(){
                    if($(this).val() == '0'){
                        $(this).parents(".icheck").next().find("input").val("");
                        $(this).parents(".icheck").next().find("input").hide();
                    }
                    else{
                        $(this).parents(".icheck").next().find("input").show();
                    }
                });

                $house.fn.initFeatureList();

                //初始化值
                if("${house.id}" != ''){
                    $("select").eq(0).find("option[value=${house.enterprise.id}]").attr("selected",true);
                    $("select").eq(1).find("option[value=${house.decorateTypeId}]").attr("selected",true);
                    <%--$("[name=isOpenWait][value=${house.isOpenWait}]").iCheck('check');--%>
                    <%--$("[name=isDealWait][value=${house.isDealWait}]").iCheck('check');--%>

                    if("${house.isDoor}" == 1){
                        $("#isDoor").parent().addClass("checked");
                    }

                    if("${house.openTime}" != ''){
                        var date = new Date(parseInt("${house.openTime}"));
                        $("#openTime").val(date.format("yyyy-MM-dd"));
                    }

                    if("${house.dealTime}" != ''){
                        var date = new Date(parseInt("${house.dealTime}"));
                        $("#dealTime").val(date.format("yyyy-MM-dd"));
                    }

                    if("${house.privilege}" != ''){
                        var arr = "${house.privilege}".split("|");
                        if(arr.length > 0){
                            $("#privilegeDiv").prev().find("input").val(arr[0]);
                        }
                        for(var i=1; i<arr.length; i++){
                            $house.fn.addRow(arr[i]);
                        }
                    }

                    $house.fn.initImageList();//初始化所有图片
                    $house.fn.initSelectedFeatureList();//初始化已选择的特色
                }
            },
            //初始化弹出框里的所有特色列表
            initFeatureList:function(){
                $("#allFeatureDiv").empty();
                var list = ${featureList};
                for(var i=0; i < list.length; i++){
                    $("#allFeatureDiv").append('<div class="checkbox" val='+list[i].id+'><input type="checkbox"><label>'+list[i].name+'</label></div>');
                }

                $('.minimal input').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal',
                    increaseArea: '20%' // optional
                });

                $('#selectAllChk input').on('ifClicked', function(){
                    //如果点击之前是选中的，则点击全选为取消全选
                    if($(this).is(":checked")){
                        $("#allFeatureDiv .icheckbox_minimal").removeClass("checked");
                    }
                    //如果点击之前不是选中的，则点击全选为全选
                    else{
                        $("#allFeatureDiv .icheckbox_minimal").addClass("checked");
                    }
                });
            },
            //初始化封面图列表
            initImageList:function(){
                $("#imageDiv").empty();
                $.post("${contextPath}/admin/house/imageList",{'houseId':"${house.id}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            $house.fn.addImgTemplate(list[i].uploadUrl, list[i].id);
                        }
                    }
                });
            },
            //初始化该楼盘的特色
            initSelectedFeatureList:function(){
                $("#featureDiv").empty();
                var list = ${selectedFeatureList};
                for(var i=0; i < list.length; i++){
                    $("#featureDiv").append('<span><input type="hidden" name="feature" value="'+list[i].id+'">' +
                            '<button type="button" class="btn btn-info">'+list[i].name+' <i class="fa fa-close" onclick="$house.fn.removeFeature(this)"></i></button> </span>');
                }
            },
            //打开选择楼盘特色
            openFeature : function(){
                var ids = [];
                $("[name=feature]").each(function(){
                    ids.push($(this).val());
                });

                $("#allFeatureDiv .icheckbox_minimal").each(function(){
                    if(ids.indexOf($(this).parent().attr("val")) > -1){
                        $(this).addClass("checked");
                    }else{
                        $(this).removeClass("checked");
                    }
                });
                $("#myModal").modal("show");
            },
            //保存特色
            saveFeature:function(){
                var arr = [];
                $("#featureDiv").empty();
                $("#allFeatureDiv .checked").each(function(){
                    arr.push($(this).parent().attr("val"));
                    var id = $(this).parent().attr("val");
                    var name = $(this).parent().find("label").text();
                    $("#featureDiv").append('<span><input type="hidden" name="feature" value="'+id+'">' +
                            '<button type="button" class="btn btn-info">'+name+' <i class="fa fa-close" onclick="$house.fn.removeFeature(this)"></i></button> </span>');
                });
                $("#myModal").modal("hide");
            },
            //删除标签
            removeFeature:function(self){
                $(self).parents("span").remove();
            },
            //新增一个图片模板
            addImgTemplate : function(path, id){
                var template = $("#imageTemplate").clone().removeAttr("id");
                if(path != "" && path != undefined){
                    template.find("img").eq(0).attr("src",path);
                }
                template.find("img").eq(0).attr("id","albumImg_"+$house.v.tempImageId);
                template.find("input[name=imageIds]").val(id);
                template.show();
                $("#imageDiv").append(template);

                $house.v.tempImageId++;
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
                                $house.fn.addImgTemplate(image.path, image.id);
                            }
                        } else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },

            //添加购房优惠
            addRow:function(value){
                var template = $("#privilegeTempalte").clone().removeAttr("id");
                if(value != undefined){
                    template.find("input").val(value);
                }
                template.show();
                $("#privilegeDiv").append(template);
            },
            //删除购房优惠
            removeRow: function (self) {
                $(self).parents(".form-group").remove();
            },
            //保存
            save : function() {
                if(!$("#formId").isValid()) return;

                if($("[name=imageIds]").length == 0){
                    $leoman.alertMsg("请至少上传一张封面图");
                    return ;
                }

                /*if($("[name=isOpenWait][value='1']").parent().hasClass("checked") && $("#openTime").val() == ''){
                    $leoman.alertMsg("请指定开盘时间");
                    return ;
                }

                if($("[name=isDealWait][value='1']").parent().hasClass("checked") && $("#dealTime").val() == ''){
                    $leoman.alertMsg("请指定交房时间");
                    return ;
                }*/

                //标签
                /*var lableArr = [];
                $("#tags_1_tagsinput .tag span").each(function(){
                    lableArr.push($(this).text());
                });

                $("#tags_1").val(lableArr.join(","));*/

                var openTime = $("#openTime").val();
                var dealTime = $("#dealTime").val();

                if(openTime != ''){
                    var openDate = Date.parse(new Date(openTime));
                    $("[name=openTime]").val(openDate);
                }

                if(dealTime != ''){
                    var dealDate = Date.parse(new Date(dealTime));
                    $("[name=dealTime]").val(dealDate);
                }

                var privilArr = [];
                $("#formId [name=privil]").each(function(){
                    privilArr.push($(this).val());
                });

                $("[name=privilege]").val(privilArr.join("|"));

                var isDoor = $("#isDoor").parent().hasClass("checked")==true?1:0;
                $("[name=isDoor]").val(isDoor);

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.href = "${contextPath}/admin/house/index";
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back:function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }

    var map = new BMap.Map("allmap");

    $(function () {
        $house.fn.init();

        // 初始化地图,设置城市和地图级别。
        var addrArea = "${house.lng}";
        if(addrArea != null && addrArea != ''){
            var point = new BMap.Point("${house.lng}", "${house.lat}")
            map.centerAndZoom(point, 15);
            var mk = new BMap.Marker(point);
            map.addOverlay(mk);
        }else{
            var myCity = new BMap.LocalCity();
            myCity.get(myFun);
        }

        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    })

    // 百度地图API功能
    function myFun(result){
        cityName = result.name;
        map.centerAndZoom(cityName,15);
    }

    function G(id) {
        return document.getElementById(id);
    }

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId"
                ,"location" : map
            });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }

    // 创建地址解析器实例
    var geoc = new BMap.Geocoder();

    //点击地图获取详细信息
    var address ;
    map.addEventListener("click", function(e){
        var pt = e.point;
        geoc.getLocation(pt, function(rs){
            var addComp = rs.addressComponents;
            address =addComp.province  + addComp.city  + addComp.district  + addComp.street  + addComp.streetNumber
                    + (rs.surroundingPois.length > 0 ? rs.surroundingPois[0].title : '');
            $("[name=address]").val(address);
            $("#longitude").val(rs.point.lng);
            $("#latitude").val(rs.point.lat);
            $("#district").val(addComp.district);

        });
    });
</script>

</html>