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
    <title>新增楼盘</title>
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
                <h1 class="page-header">新增楼盘</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input type="hidden" name="openTime" value="">
                            <input type="hidden" name="dealTime" value="">

                            <div class="form-group">
                                <label class="col-sm-1 control-label"><span style="color: red;">* </span>楼盘封面：</label>
                                <div class="col-sm-5">
                                    <input type="file" name="coverFile" id="coverFile" style="display:none;"/>
                                    <a href="javascript:void(0);" onclick="$('#coverFile').click();">
                                        <img id="coverImg" src="${contextPath}/static/images/add.jpg" style="height: 150px; width: 150px; display: inline; margin-bottom: 5px;" border="1"/>
                                    </a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ><span style="color: red;">* </span>楼盘名称：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="name" value="${enterprise.name}" class="form-control" data-rule="required" maxlength="30"/>
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
                                <label class="col-sm-1 control-label">楼盘标签：</label>
                                <div class="col-sm-3">
                                    <input id="tags_1" type="text" name="label" class="tags" value="" />
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left">(每输入一个标签，按回车键即可)</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >开盘时间：</label>

                                <div class="col-sm-2 icheck minimal">
                                    <div class="radio" val="0">
                                        <input type="radio" name="isOpenWait" value="0">
                                        <label>待定</label>
                                    </div>

                                    <div class="radio" val="1">
                                        <input type="radio" name="isOpenWait" value="1">
                                        <label>指定开盘时间</label>
                                    </div>
                                </div>

                                <div class="col-sm-2">
                                    <input type="text" id="openTime" class="form-control input-append date form_datetime" style="width: 180px;" readonly  value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >开发商：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="developers" value="${enterprise.username}" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >交房时间：</label>

                                <div class="col-sm-2 icheck minimal">
                                    <div class="radio" val="0">
                                        <input type="radio" name="isDealWait" value="0">
                                        <label>待定</label>
                                    </div>

                                    <div class="radio" val="1">
                                        <input type="radio" name="isDealWait" value="1">
                                        <label>指定交房时间</label>
                                    </div>
                                </div>

                                <div class="col-sm-2">
                                    <input type="text" id="dealTime" class="form-control input-append date form_datetime" style="width: 180px;" readonly  value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >产权年限：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="propertyLimit" value="${coupon.discountPercent}" class="form-control"
                                           data-rule="integer(+0)"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">年</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >装修类型：</label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="decorateType">
                                        <option value="">---请选择---</option>
                                        <option value="1">毛胚</option>
                                        <option value="2">简装</option>
                                        <option value="3">精装</option>
                                        <option value="4">豪华装修</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >容积率：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="plotTatio" value="${coupon.discountPercent}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的容积率']" />
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">%</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >绿化比例：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="greening" value="${coupon.discountPercent}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的绿化比例']"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">%</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >总户数：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="householdNum" value="${coupon.discountPercent}" class="form-control"
                                           data-rule="integer(+0)"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">户</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >物业公司：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="propertyCompany" value="${enterprise.username}" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label" >购房优惠：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="privilege" value="${enterprise.username}" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >预估单价：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="unitPrice" value="${coupon.discountPercent}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的绿化比例']"/>
                                </div>
                                <label class="col-sm-1 control-label" style="text-align: left">元</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >楼盘地址：</label>
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

                                <label class="col-sm-1 control-label" >楼盘地址：</label>
                                <div class="col-sm-3">
                                    <input type="text" name="address" value="" class="form-control" required/>
                                    <input type="hidden" id="longitude" name="lng" value="">
                                    <input type="hidden" id="latitude" name="lat" value="">
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

<!-- 配置文件 -->

</body>

<%@ include file="../inc/footer.jsp" %>
<script src="http://api.map.baidu.com/api?v=2.0&ak=pcExWaLfoopv7vZ5hO1B8ej8"></script>
<script>


    $house = {
        v: {
            list: [],
            chart: null,
            dTable: null,
        },
        fn: {
            init: function () {

                $("#coverFile").uploadPreview({
                    Img: "coverImg",//楼盘封面图
                });

                $('.form_datetime').datetimepicker({
                    language: 'zh-CN',
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    minView: "month",
                    forceParse: 0,
                    showMeridian: false,
                    format: 'yyyy-mm-dd'
                });

                $('.minimal input').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal',
                    increaseArea: '20%' // optional
                });

                $(".iradio_minimal").css("float","left");

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

                $("[name=isOpenWait]").first().iCheck('check');
                $("[name=isDealWait]").first().iCheck('check');

            },

            //保存
            save : function() {
                if(!$("#formId").isValid()){
                    return false;
                }

                if($("[name=isOpenWait][value='1']").parent().hasClass("checked") && $("#openTime").val() == ''){
                    $leoman.alertMsg("请指定开盘时间");
                    return ;
                }

                if($("[name=isDealWait][value='1']").parent().hasClass("checked") && $("#dealTime").val() == ''){
                    $leoman.alertMsg("请指定交房时间");
                    return ;
                }

                var lableArr = [];
                $("#tags_1_tagsinput .tag span").each(function(){
                    lableArr.push($(this).text());
                });

                $("#tags_1").val(lableArr.join(","));

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

                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $house.fn.back();
                        }
                        else {
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
        var addrArea = "武汉";
        if(addrArea != null && addrArea != ''){
            map.centerAndZoom(addrArea,12);
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

        });
    });
</script>

</html>