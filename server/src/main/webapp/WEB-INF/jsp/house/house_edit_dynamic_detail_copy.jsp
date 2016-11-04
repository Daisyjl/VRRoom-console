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
    <title>新增/编辑动态</title>
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
                <h1 class="page-header">新增/编辑动态</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input type="hidden" name="id" value="${dynamic.id}">
                            <input type="hidden" name="houseId" value="${houseId}">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>标题：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="title" value="${dynamic.title}" class="form-control" data-rule="required"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>内容：</label>
                                <div class="col-sm-6">
                                    <script type="text/plain" id="myEditor" name="content" style="width:900px;height:500px;">${dynamic.content}</script>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$houseDynamic.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$houseDynamic.fn.back()">返回</button>
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
    $houseDynamic = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null
        },
        fn: {
            init: function () {

                $houseDynamic.fn.initEdior();//初始化编辑器

            },
            initEdior : function() {
                $houseDynamic.v.um = UM.getEditor('myEditor');
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
                    url : "${contextPath}/admin/house/dynamic/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $houseDynamic.fn.back();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/dynamic/edit/${houseId}";
            }
        }
    };

    $(function () {
        $houseDynamic.fn.init();
    });

</script>

</html>