<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 2015/3/3
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>新增/编辑角色</title>
    <%@ include file="../../inc/css.jsp" %>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增/编辑角色</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input id="id" name="id" type="hidden" value="${role.id}">
                            <input id="createDate" name="createDate" type="hidden" value="${role.createDate}">
                            <div class="form-group">
                                <label for="name" class="col-sm-1 control-label" >角色名称</label>
                                <div class="col-sm-6">
                                    <input type="text" id="name" name="name" value="${role.name}" class="form-control" required maxlength="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-1 control-label" >模块授权</label>
                                <div class="col-sm-6">
                                    <c:forEach items="${modules}" var="module">
                                        ${module.name}:&nbsp;
                                        <c:forEach items="${module.list}" var="subModule">
                                            <input type="checkbox" name="moduleIds" value="${subModule.id}" <c:if test="${fns:contains(subModule.id, subModules)}"> checked="checked" </c:if> /> ${subModule.name}
                                            &nbsp;
                                        </c:forEach>
                                        <hr>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$admin.fn.save()" class="btn btn-primary">保存</button>
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

<%@ include file="../../inc/footer.jsp" %>
<script>
    $admin = {
        v: {
            list: [],
            chart: null,
            dTable: null
        },
        fn: {
            init: function () {

            },

            save : function() {
                if(!$("#formId").valid()) return;
                var checked = $("input[name='moduleIds']:checkbox:checked");
                var moduleIds = [];
                checked.each(function(){
                    moduleIds.push($(this).val());
                });
                console.log("moduleIds:" + moduleIds);
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/role/save",
                    data : {
                        "moduleIds" : moduleIds
                    },
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.href = "${contextPath}/admin/role/index";
                        }
                        else {
                            alert("操作失败");
                        }
                    }
                });
            }
        }
    }
    $(function () {
        $admin.fn.init();
    })
</script>

</html>