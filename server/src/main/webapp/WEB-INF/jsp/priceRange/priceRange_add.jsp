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
    <title>新增/编辑价格</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑价格</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form">

                            <input id="id" name="id" type="hidden" value="${priceRange.id}">
                            <input name="type" type="hidden" value="${priceRange.type}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >价格范围从：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="priceFrom" value="${priceRange.priceFrom}" class="form-control"
                                           data-rule="integer(+0)" maxlength="30"/>
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left;">(提示：不填写则表示以下)</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >价格范围至：</label>
                                <div class="col-sm-2">
                                    <input type="text" name="priceTo" value="${priceRange.priceTo}" class="form-control"
                                           data-rule="integer(+0)" maxlength="30"/>
                                </div>
                                <label class="col-sm-2 control-label" style="text-align: left;">(提示：不填写则表示以上)</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$priceRange.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$priceRange.fn.back()">返回</button>
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
    $priceRange = {
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
                    $leoman.alertMsg("请至少填写一个价格大小");
                    return ;
                }

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/priceRange/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $priceRange.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/priceRange/index";
            }
        }
    }
    $(function () {
        $priceRange.fn.init();
    })
</script>

</html>