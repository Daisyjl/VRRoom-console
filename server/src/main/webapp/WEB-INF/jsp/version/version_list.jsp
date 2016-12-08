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
    <title>版本列表</title>
    <%@ include file="../inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">版本列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <a href="admin/version/edit" class="btn btn-outline btn-primary btn-lg"
                           role="button">新增版本</a>

                        <%--<form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label>版本名称：</label>
                                <input type="text" id="name" class="form-control" placeholder="版本名称">
                            </div>
                            <button type="button" id="c_search" class="btn btn-default btn-sm">查询</button>
                        </form>--%>
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
                                    <th>版本号</th>
                                    <th>apk下载路径</th>
                                    <th>AppStore下载路径</th>
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

<%@ include file="../inc/footer.jsp" %>
</body>

<script>
    $version = {
        v: {
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                $version.fn.dataTableInit();
                $("#c_search").click(function () {
                    $version.v.dTable.ajax.reload();
                });
            },
            dataTableInit: function () {
                $version.v.dTable = $leoman.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "bSort": false,
                    "ajax": {
                        "url": "${contextPath}/admin/version/list",
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
                        {"data": "versionNo"},
                        {"data": "apkUrl"},
                        {"data": "appstoreUrl"},
                        {
                            "data": "id",
                            "render": function (data, type, row, meta) {

                                var edit = "<button title='编辑' class='btn btn-primary edit' onclick=\"$version.fn.add(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑</button>";

                                var del = "<button title='删除' class='btn btn-primary edit' onclick=\"$version.fn.del(\'" + data + "\')\">" +
                                        "<i class='fa fa-trash-o'></i> 删除</button>";

                                return edit  + "&nbsp;" + del;

                            }
                        }
                    ],
                    "fnServerParams": function (aoData) {
                        aoData.name = $("#name").val();
                    }
                });
            },
            add: function (id) {
                var params = "";
                if (id != null && id != '') {
                    params = "?id=" + id;
                }
                window.location.href = "${contextPath}/admin/version/edit" + params;
            },
            del: function (id) {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = [];
                if(id != null){
                    ids.push(id);
                }else{
                    ids = checkBox.getInputId();
                }
                $leoman.alertConfirm("您确定要彻底删除所选的版本吗？",function(){
                    $.ajax({
                        "url": "${contextPath}/admin/version/del",
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
            }

        }
    }
    $(function () {
        $version.fn.init();
    })
</script>
</html>