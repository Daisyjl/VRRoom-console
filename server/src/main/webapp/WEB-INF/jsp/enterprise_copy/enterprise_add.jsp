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
    <title>新增企业</title>
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
                            企业
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form" id="formId" method="post" >
                                <input id="id" name="id" type="hidden" value="${enterprise.id}">
                                <input type="hidden" id="provinceId" value="${enterprise.city.province.id}">
                                <input type="hidden" id="cityId" value="${enterprise.city.id}">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >企业名称</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >企业账号</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >企业密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" id="password" name="password" value="" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >确认密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" id="repassword" name="" value="" class="form-control" equalTo="#password" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label">省:</label>

                                    <div class="col-sm-1">
                                        <select id="provinceSelect" style="width: 150px;" class="form-control"></select>
                                    </div>

                                    <label class="col-sm-1 control-label">市:</label>
                                    <div class="col-sm-1">
                                        <select id="citySelect" style="width: 150px;" class="form-control" name="city.id"></select>
                                    </div>
                                </div>

                                <span style="display: none;" id="intro">${enterprise.intro}</span>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >企业简介</label>
                                    <div class="col-sm-6">
                                        <script type="text/plain" id="myEditor" name="intro" style="width:1000px;height:240px;"></script>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$enterprise.fn.save()" class="btn btn-primary">保存</button>
                                        <button type="button" class="btn btn-primary" onclick="$enterprise.fn.back()">返回</button>
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
<script>
    $enterprise = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {
                $enterprise.fn.initEdior();//初始化编辑器

                $enterprise.fn.getProviceList();//初始化省份列表

                //初始化省份改变事件
                $('#provinceSelect').change(function () {
                    $('#cityId').val('');

                    var provinceId = $(this).val();
                    $enterprise.fn.getCityList(provinceId);
                });

                UM.getEditor('myEditor').setContent($("#intro").html());
            },
            initEdior : function() {
                $enterprise.v.um = UM.getEditor('myEditor');
            },
            getProviceList: function () {
                var provinceId = $('#provinceId').val();

                $.post("${contextPath}/common/area/provinceList", null, function (result) {
                    var list = result.data.object.provinceList;
                    if (result.status == 0) {
                        // 获取返回的省份列表信息，并循环绑定到select中
                        var content = "<option value=''>请选择所在省份</option>";
                        jQuery.each(list, function (i, item) {
                            content += "<option value='" + item.id + "'>" + item.name + "</option>";
                        });
                        $('#provinceSelect').append(content);
                    } else {
                        $leoman.alertMsg(result.msg);
                    }

                    if (null != provinceId && provinceId != '') {
                        $('#provinceSelect').val(provinceId);
                    }
                });

                var sourceId = 0;
                if (null == provinceId || provinceId == '') {
                    sourceId = $('#provinceSelect option:selected').val();
                } else {
                    sourceId = provinceId;
                }

                $enterprise.fn.getCityList(sourceId);
            },
            getCityList: function (sourceId) {
                $('#citySelect').html('');

                $.post("${contextPath}/common/area/cityList", {provinceId: sourceId}, function (result) {
                    var list = result.data.object.cityList;
                    if (result.status == 0) {
                        // 获取返回的城市列表信息，并循环绑定到select中
                        var content = "<option value=''>请选择所在城市</option>";
                        jQuery.each(list, function (i, item) {
                            content += "<option value='" + item.id + "'>" + item.name + "</option>";
                        });
                        $('#citySelect').append(content);
                    } else {
                        $leoman.alertMsg(result.msg);
                    }

                    var cityId = $('#cityId').val();
                    if (null != cityId && cityId != '') {
                        $('#citySelect').val(cityId);
                    }
                });
            },
            save : function() {
                if(!$("#formId").valid()) return;
                $("#intro").val($enterprise.v.um.getContent());
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/enterprise/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $enterprise.fn.back();
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/enterprise/index";
            }
        }
    }
    $(function () {
        $enterprise.fn.init();
    })
</script>
</body>
</html>
