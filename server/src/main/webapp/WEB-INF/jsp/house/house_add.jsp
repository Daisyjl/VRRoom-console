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
    <title>新增楼盘</title>
    <%@ include file="../inc/new2/css.jsp" %>
    <style type="text/css">
        #allmap {width: 600px;height: 400px;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
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

            <!-- 详细信息 -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            详细信息
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form" id="formId" method="post" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label">楼盘封面：</label>
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
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" ><span style="color: red;">* </span>所属企业：</label>
                                    <div class="col-sm-2">
                                        <select class="form-control input-sm" name="enterprise.id" required>
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
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >开盘时间：</label>
                                    <div class="col-sm-2">
                                        <input type="radio" name="isOpenWait" value="0" checked="checked">待定
                                        &nbsp;
                                        <input type="radio" name="isOpenWait" value="1">指定开盘时间
                                    </div>
                                    <div class="col-sm-2">
                                        <input type="text" name="openTime" class="form-control input-append date form_datetime" style="width: 180px;" readonly  value="">
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
                                    <div class="col-sm-2">
                                        <input type="radio" name="isDealWait" value="0" checked="checked">待定
                                        &nbsp;
                                        <input type="radio" name="isDealWait" value="1">交房时间
                                    </div>
                                    <div class="col-sm-2">
                                        <input type="text" name="dealTime" class="form-control input-append date form_datetime" style="width: 180px;" readonly  value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >产权年限：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="propertyLimit" value="${coupon.discountPercent}" class="form-control" number-0="true"/>
                                    </div>
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
                                        <input type="text" name="plotTatio" value="${coupon.discountPercent}" class="form-control" number-2="true"/>
                                    </div>
                                    <div class="col-sm-2">
                                        %
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >绿化比例：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="greening" value="${coupon.discountPercent}" class="form-control" number-2="true"/>
                                    </div>
                                    <div class="col-sm-2">
                                        %
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >总户数：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="householdNum" value="${coupon.discountPercent}" class="form-control" number-0="true"/>
                                    </div>
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
                                        <input type="text" name="unitPrice" value="${coupon.discountPercent}" class="form-control" number-2="true"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘地址：</label>
                                    <div class="col-sm-3">
                                        <div id="allmap"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" ></label>
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

                            </form>
                        </div>
                    </section>
                </div>
            </div>

            <!-- 户型信息 -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            户型信息
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form">
                                <input id="id" name="id" type="hidden" value="${enterprise.id}">

                                <%--<div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘名称：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$house.fn.addUnit()" class="btn btn-primary"><i class="fa fa-plus"></i> 新增户型</button>
                                    </div>
                                </div>--%>
                            </form>
                        </div>
                    </section>
                </div>
            </div>

            <!-- 楼盘动态 -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            楼盘动态
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form">
                                <input id="dynamicId" name="dynamicId" type="hidden" value="${enterprise.id}">

                                <%--<div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘名称：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
                                    </div>
                                </div>--%>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$house.fn.save()" class="btn btn-primary">保存</button>
                                        <button type="button" class="btn btn-primary" onclick="$house.fn.back()">返回</button>
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


</section>
<%@ include file="../inc/new2/foot.jsp" %>
<script src="http://api.map.baidu.com/api?v=2.0&ak=pcExWaLfoopv7vZ5hO1B8ej8"></script>
<script>


    $house = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
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
                    startView: 'hour',
                    forceParse: 0,
                    showMeridian: false,
                    format: 'yyyy-mm-dd hh:ii'
                });

                //初始化radio
                $("input[type=radio]").click(function(){
                    if($(this).val() == 0){
                        $(this).parent().next().find("input").hide();
                    }else {
                        $(this).parent().next().find("input").show();
                    }
                });

            },

            //保存
            save : function() {
                if(!$("#formId").valid()) return;

                var lableArr = [];
                $("#tags_1_tagsinput .tag span").each(function(){
                    lableArr.push($(this).text());
                });

                $("#tags_1").val(lableArr.join(","));

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
            $("#district").val(addComp.province + addComp.city + addComp.district);
            $("[name=address]").val(addComp.street + addComp.streetNumber+ (rs.surroundingPois.length > 0 ? rs.surroundingPois[0].title : ''));
            $("#longitude").val(rs.point.lng);
            $("#latitude").val(rs.point.lat);

        });
    });
</script>
</body>
</html>
