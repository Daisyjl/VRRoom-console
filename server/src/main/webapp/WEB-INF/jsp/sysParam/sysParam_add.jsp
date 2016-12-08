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
    <title>编辑系统参数</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑系统参数</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">

                            <input id="id" name="id" type="hidden" value="${sysParam.id}">
                            <input name="type" type="hidden" value="${sysParam.type}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >类型：</label>
                                <label class="col-sm-1 control-label" style="text-align: left;">
                                    <c:if test="${sysParam.type == 1}">贷款利率</c:if>
                                    <c:if test="${sysParam.type == 2}">首付百分比</c:if>
                                </label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >值：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="sysValue" value="${sysParam.sysValue}" class="form-control"
                                           data-rule="required, price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的数值']"maxlength="30"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$sysParam.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$sysParam.fn.back()">返回</button>
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
    $sysParam = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            //保存
            save : function() {
                if(!$("#formId").isValid()) return;

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/sysParam/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $sysParam.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/sysParam/index";
            }
        }
    }
</script>

</html>