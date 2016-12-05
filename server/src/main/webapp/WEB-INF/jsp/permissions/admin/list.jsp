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
    <title>管理员列表</title>
    <%@ include file="../../inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="../../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理员列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <a href="admin/admin/add" class="btn btn-outline btn-primary btn-lg"
                           role="button">新增管理员</a>

                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label>名称：</label>
                                <input type="text" id="name" name="username" class="form-control" placeholder="名称">
                            </div>
                            <button type="button" id="c_search" class="btn btn-default btn-sm">查询</button>
                        </form>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">

                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <colgroup>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" onclick="$leoman.checkAll(this)" class="checkall"/></th>
                                    <th>账号</th>
                                    <th>创建时间</th>
                                    <th>手机号</th>
                                    <th>最后登录时间</th>
                                    <th>角色</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

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

<%@ include file="../../inc/footer.jsp" %>
</body>

<script>
    $admin = {
        v: {
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                $admin.fn.dataTableInit();
                $("#c_search").click(function () {
                    $admin.v.dTable.ajax.reload();
                });
            },
            dataTableInit: function () {
                $admin.v.dTable = $leoman.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "bSort": false,
                    "ajax": {
                        "url": "${contextPath}/admin/admin/list",
                        "type": "POST"
                    },
                    "columns": [
                        {
                            "data": "id",
                            "render": function (data) {
                                var checkbox = "<input type='checkbox' class='list-check' onclick='$leoman.subSelect(this);' value=" + data + ">";
                                return checkbox;
                            }
                        },
                        {"data": "username"},
                        {
                            "data": "createDate",
                            "render": function (data) {
                                return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                            }
                        },
                        {"data": "mobile"},
                        {
                            "data": "lastLoginDate",
                            "render": function (data) {
                                return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                            }
                        },
                        {"data": "role.name"},
                        {
                            "data": "id",
                            "render": function (data, type, row, meta) {
                                var edit = "<button title='编辑' class='btn btn-primary edit' onclick=\"$admin.fn.add(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑</button>";

                                var del = "<button title='删除' class='btn btn-primary edit' onclick=\"$admin.fn.del(\'" + data + "\')\">" +
                                        "<i class='fa fa-trash-o'></i> 删除</button>";
                                return edit + "&nbsp;" + del;
                            }
                        }
                    ],
                    "fnServerParams": function (aoData) {
                        aoData.username = $("#username").val();
                    }
                });
            },
            add: function (id) {
                var params = "";
                if (id != null && id != '') {
                    params = "?id=" + id;
                }
                window.location.href = "${contextPath}/admin/admin/add" + params;
            },
            reset: function (id) {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = [];
                if(id != null){
                    ids.push(id);
                }else{
                    ids = checkBox.getInputId();
                }
                $leoman.alertConfirm("您确定要重置该管理员的密码吗？",function(){
                    $.ajax({
                        "url": "${contextPath}/admin/admin/reset",
                        "data": {
                            ids:JSON.stringify(ids)
                        },
                        "dataType": "json",
                        "type": "POST",
                        success: function (result) {
                            if(result.status == 0){
                                window.location.reload();
                            }else{
                                $leoman.alertMsg(result.msg);
                            }
                        }
                    });
                });
            },
            del: function (id) {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = [];
                if(id != null){
                    ids.push(id);
                }else{
                    ids = checkBox.getInputId();
                }
                $leoman.alertConfirm("您确定要彻底删除所选的管理员吗？",function(){
                    $.ajax({
                        "url": "${contextPath}/admin/admin/del",
                        "data": {
                            ids:JSON.stringify(ids)
                        },
                        "dataType": "json",
                        "type": "POST",
                        success: function (result) {
                            if (result==1) {
                                alert("删除错误");
                            }else if(result==2){
                                alert("超级管理员无法删除");
                            }else {
                                $("#deleteBatch").css('display','none');
                                $admin.v.dTable.ajax.reload(null,false);
                            }
                        }
                    });
                });
            },

            openModal: function (adminId) {
                $("#adminId").val(adminId);
                $('#my_multi_select1').multiSelect('refresh');
                $.ajax({
                    url: "${contextPath}/admin/admin/role/select",
                    type: "POST",
                    data: {
                        "adminId": adminId
                    },
                    success: function (result) {
                        var allRole = result.data.object.allRoles;
                        var hasRole = result.data.object.hasRoels;

                        console.log(hasRole);

                        var allRoleArray = [];
                        $.each(allRole, function (n, item) {
                            var option = {
                                value: item.id,
                                text: item.name
                            }
                            allRoleArray.push(option);
                        });
                        $('#my_multi_select1').multiSelect('addOption', allRoleArray);
                        $('#my_multi_select1').multiSelect('select', hasRole);
                    }

                });

                $("#myModal").modal("show");
            }
        }
    }
    $(function () {
        $admin.fn.init();
    })
</script>


</html>