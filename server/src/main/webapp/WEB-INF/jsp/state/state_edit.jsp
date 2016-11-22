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
    <title>编辑文案</title>
    <%@ include file="../inc/css.jsp" %>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑文案</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input type="hidden" name="id" value="${state.id}">
                            <input type="hidden" name="type" value="${state.type}">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>类型：</label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" data-rule="required" disabled>
                                        <option value="1">服务条款</option>
                                        <option value="2">注册协议</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>内容：</label>
                                <div class="col-sm-6">
                                    <script type="text/plain" id="myEditor" name="content" style="width:900px;height:500px;">${state.content}</script>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$state.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$state.fn.back()">返回</button>
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
<script>
    $state = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null
        },
        fn: {
            init: function () {

                $state.fn.initEdior();//初始化编辑器

                $("select option[value="+"${state.type}"+"]").attr("selected", true);

            },
            initEdior : function() {
                $state.v.um = UM.getEditor('myEditor');
            },
            //保存
            save : function() {
                if(!$("#formId").isValid()) return;

                if(UM.getEditor('myEditor').getContent() == ''){
                    $leoman.alertMsg("请输入内容");
                    return ;
                }

                $leoman.showLoading();
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/state/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $state.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/state/index";
            }
        }
    };

    $(function () {
        $state.fn.init();
    });

</script>

</html>