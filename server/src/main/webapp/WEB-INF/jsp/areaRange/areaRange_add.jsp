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
    <title>新增/编辑时间</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑面积</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">

                            <input id="id" name="id" type="hidden" value="${areaRange.id}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >面积范围从：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="areaFrom" value="${areaRange.areaFrom}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的面积大小']" maxlength="30"/>
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left;">(提示：不填写则表示以下)</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >面积范围至：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="areaTo" value="${areaRange.areaTo}" class="form-control"
                                           data-rule="price"  data-rule-price="[/^\d{0,8}\.{0,1}(\d{1,2})?$/, '请输入正确的面积大小']" maxlength="30"/>
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left;">(提示：不填写则表示以上)</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$areaRange.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$areaRange.fn.back()">返回</button>
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
    $areaRange = {
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

                if($("[name=areaFrom]").val() == '' && $("[name=areaTo]").val() == ''){
                    $leoman.alertMsg("请至少填写一个时间大小");
                    return ;
                }

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/areaRange/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $areaRange.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/areaRange/index";
            }
        }
    }
    $(function () {
        $areaRange.fn.init();
    })
</script>

</html>