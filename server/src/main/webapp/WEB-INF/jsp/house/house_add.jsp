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
                            <form class="cmxform form-horizontal adminex-form" id="formId" method="post" >
                                <input id="id" name="id" type="hidden" value="${enterprise.id}">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘名称：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
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
                                        <input type="radio" name="isOpenWait" value="1">指定开盘时间sdfsdf
                                    </div>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >开发商：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >交房时间：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >产权年限：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >装修类型：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >容积率：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >绿化比例：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >总户数：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >物业公司：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >购房优惠：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >预估单价：</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘地址：</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="username" value="${enterprise.username}" class="form-control" required/>
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

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘名称：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
                                    </div>
                                </div>
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

                                <div class="form-group">
                                    <label class="col-sm-1 control-label" >楼盘名称：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$enterprise.fn.save()" class="btn btn-primary">保存</button>
                                        <button type="button" class="btn btn-primary" onclick="history.go(-1);">返回</button>
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
                            window.location.href = "${contextPath}/admin/enterprise/index";
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            }
        }
    }
    $(function () {
        $enterprise.fn.init();
    })
</script>
</body>
</html>
