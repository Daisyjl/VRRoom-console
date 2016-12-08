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
    <title>新增/编辑版本</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑版本</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">

                            <input id="id" name="id" type="hidden" value="${version.id}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >版本号：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="versionNo" value="${version.versionNo}" class="form-control" data-rule="required" maxlength="30"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >apk文件：</label>
                                <div class="col-sm-2">
                                    <input type="file" name="apkFile" class="default"/>
                                </div>
                                <div class="col-sm-1">
                                    <a id="apkUrl" style="display: none;">点击下载apk文件</a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >AppStore路径：</label>
                                <div class="col-sm-3">
                                    <input type="text" name="name" value="${version.appstoreUrl}" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$version.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$version.fn.back()">返回</button>
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



</body>

<%@ include file="../inc/footer.jsp" %>
<script>
    $version = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null
        },
        fn: {
            init : function(){
                if("${version.apkUrl}" != ''){
                    $("#apkUrl").show();
                    $("#apkUrl").attr("href", "${version.apkUrl}");
                }
            },
            //保存
            save : function() {
                if(!$("#formId").isValid()) return;

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/version/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $version.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/version/index";
            }
        }
    };

    $(function () {
        $houseUnit.fn.init();
    });
</script>

</html>