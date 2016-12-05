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
    <title>新增管理员</title>
    <%@ include file="../../inc/css.jsp" %>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新增管理员</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="formId" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">

                            <input id="id" name="id" type="hidden" value="${admin.id}">
                            <%--<input id="createDate" name="createDate" type="hidden" value="${admin.createDate}">--%>
                            <div class="form-group">
                                <label for="username" class="col-sm-1 control-label" >账号</label>
                                <div class="col-sm-2">
                                    <input type="text" id="username" name="username" value="${admin.username}" class="form-control" data-rule="required; length(5~)"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-1 control-label">密码</label>
                                <div class="col-sm-2">
                                    <input type="password" id="password" name="password" class="form-control" data-rule="required; length(6~)"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-1 control-label">确认密码</label>
                                <div class="col-sm-2">
                                    <input type="password" id="password2" class="form-control" data-rule="required; length(6~); 确认密码: match(password);"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mobile" class="col-sm-1 control-label">手机</label>
                                <div class="col-sm-2">
                                    <input type="text" id="mobile" name="mobile" value="${admin.mobile}" class="form-control" data-rule="required; mobile"
                                           data-rule-mobile="[/^1[34578]\d{9}$/, '请输入正确的手机号']"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roleId" class="col-sm-1 control-label">角色</label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" id="roleId" name="roleId">
                                        <c:forEach var="role" items="${roleList}">
                                            <option value="${role.id}">${role.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$admin.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="$admin.fn.back()">返回</button>
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
                if("${admin.roleId}" != ''){
                    $("[name=roleId] option[value="+"${admin.roleId}"+"]").attr("selected", true);
                }
            },
            save : function() {
                if(!$("#formId").isValid()) return;
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/admin/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $admin.fn.back();
                        }else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "admin/admin/index";
            }
        }
    }
    $(function () {
        $admin.fn.init();
    })
</script>

</html>