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
    <title>新增/编辑企业账号</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑企业账号</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input id="id" name="id" type="hidden" value="${enterpriseSub.id}">
                            <input type="hidden" id="provinceId" value="${enterpriseSub.city.province.id}">
                            <input type="hidden" id="cityId" value="${enterpriseSub.city.id}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >企业账号</label>
                                <div class="col-sm-6">
                                    <input type="text" name="username" value="${enterpriseSub.username}" class="form-control" data-rule="required"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >所属企业</label>
                                <div class="col-sm-6">
                                    <select class="form-control" name="enterpriseId">
                                        <c:forEach items="${enterpriseList}" var="enterprise">
                                            <option value="${enterprise.id}">${enterprise.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >企业密码</label>
                                <div class="col-sm-6">
                                    <input type="password" id="password" name="password" value="" class="form-control"  data-rule="required; length(6~)"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >确认密码</label>
                                <div class="col-sm-6">
                                    <input type="password" id="repassword" name="" value="" class="form-control" data-rule="required; match(password);"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">省:</label>

                                <div class="col-sm-1">
                                    <select id="provinceSelect" style="width: 150px;" class="form-control"></select>
                                </div>

                                <label class="col-sm-1 control-label">市:</label>
                                <div class="col-sm-1">
                                    <select id="citySelect" style="width: 150px;" class="form-control" name="city.id" data-rule="required"></select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$enterpriseSub.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$enterpriseSub.fn.back()">返回</button>
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
    $enterpriseSub = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {
                $enterpriseSub.fn.getProviceList();//初始化省份列表

                //初始化省份改变事件
                $('#provinceSelect').change(function () {
                    $('#cityId').val('');

                    var provinceId = $(this).val();
                    $enterpriseSub.fn.getCityList(provinceId);
                });
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

                $enterpriseSub.fn.getCityList(sourceId);
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
                if(!$("#formId").isValid()) return;
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/enterprise/sub/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $enterpriseSub.fn.back();
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/enterprise/sub/index";
            }
        }
    }
    $(function () {
        $enterpriseSub.fn.init();
    })
</script>

</html>