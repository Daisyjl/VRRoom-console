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
    <title>新增/编辑企业</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑企业</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input id="id" name="id" type="hidden" value="${enterprise.id}">

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >企业名称</label>
                                <div class="col-sm-6">
                                    <input type="text" name="name" value="${enterprise.name}" class="form-control" required/>
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

                UM.getEditor('myEditor').setContent($("#intro").html());
            },
            initEdior : function() {
                $enterprise.v.um = UM.getEditor('myEditor');
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

</html>