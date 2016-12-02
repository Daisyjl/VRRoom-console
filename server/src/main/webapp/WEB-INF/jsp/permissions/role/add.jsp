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
    <style type="text/css">
        .radio label, .checkbox label {
            padding-left: 0px;
            margin-bottom: 0;
            font-weight: 400;
            cursor: pointer
        }
        div.checkbox{
            margin-right: 50px;
        }
    </style>
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
                            <input type="hidden" name="moduleIds" id="moduleIds" value="">

                            <div class="form-group">
                                <label for="name" class="col-sm-1 control-label" >角色名称</label>
                                <div class="col-sm-2">
                                    <input type="text" id="name" name="name" value="${role.name}" class="form-control" required maxlength="20"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="name" class="col-sm-1 control-label" >模块授权</label>
                            </div>

                            <c:forEach items="${modules}" var="module">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-2 icheck minimal selectall" style="width: 180px;">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label style="font-weight: bold;">${module.name}</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-9 icheck minimal">
                                        <c:forEach items="${module.list}" var="subModule">

                                            <div class="checkbox">
                                                <c:if test="${fns:contains(subModule.id, subModules)}"><input type="checkbox" checked value="${subModule.id}"></c:if>
                                                <c:if test="${!fns:contains(subModule.id, subModules)}"><input type="checkbox" value="${subModule.id}"></c:if>
                                                <label>${subModule.name}</label>
                                            </div>

                                        </c:forEach>
                                    </div>
                                </div>

                            </c:forEach>

                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-6">
                                    <button type="button" onclick="$role.fn.save()" class="btn btn-primary">保存</button>
                                    <button type="button" onclick="$role.fn.back()" class="btn btn-primary">返回</button>
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
    $role = {
        v: {
            list: [],
            chart: null,
            dTable: null
        },
        fn: {
            init: function () {
                $('.minimal input').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal',
                    increaseArea: '20%' // optional
                });

                $(".selectall").on('ifClicked', function(){
                    //如果点击之前是选中的，则点击全选为取消全选
                    if($(this).find("input").is(":checked")){
                        $(this).next().find(".icheckbox_minimal").removeClass("checked");
                    }
                    //如果点击之前不是选中的，则点击全选为全选
                    else{
                        $(this).next().find(".icheckbox_minimal").addClass("checked");
                    }
                });
            },
            save : function() {
                if(!$("#formId").isValid()) return;
                var checkArr = $(".icheckbox_minimal.checked").find("input");
                var moduleIds = [];
                checkArr.each(function(){
                    if($(this).val() != 'on'){
                        moduleIds.push($(this).val());
                    }
                });
                if(moduleIds.length == 0){
                    $leoman.alertMsg("请至少选择一个菜单模块");
                    return ;
                }
                $("#moduleIds").val(moduleIds);
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/role/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $role.fn.back();
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back:function(){
                window.location.href = "${contextPath}/admin/role/index";
            }
        }
    }
    $(function () {
        $role.fn.init();
    })
</script>

</html>