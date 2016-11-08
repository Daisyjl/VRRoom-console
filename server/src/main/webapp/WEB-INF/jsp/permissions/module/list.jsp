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
    <title>模块列表</title>
    <%@ include file="../../inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="../../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">模块列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

                    <div class="panel-heading">

                        <a href="javascript:;" onclick="$admin.fn.add()" class="btn btn-outline btn-primary btn-lg"
                           role="button">新增模块</a>

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
                                    <th>父模块名称</th>
                                    <th>名称</th>
                                    <th>创建时间</th>
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
                    "bSort":false,
                    "ajax": {
                        "url": "${contextPath}/admin/module/list",
                        "type": "POST"
                    },
                    "columns": [
                        {
                            "data": "id",
                            "render": function (data, type, row, meta) {
                                if(row.superModule == null) {
                                    var checkbox = "<input type='checkbox' class='list-check' onclick='$leoman.subSelect(this);' value=" + data + ">";
                                    return checkbox;
                                }
                                else {
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "superModule",
                            "render" : function(data){
                                if(data == null) {
                                    return "-";
                                }
                                else {
                                    return data.name;
                                }
                            }
                        },
                        {"data": "name"},
                        {
                            "data": "createDate",
                            "render" : function(data) {
                                return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                            }
                        },
                        {
                            "data": "id",
                            "render": function (data) {

                                var edit = "<button title='编辑' class='btn btn-primary edit' onclick=\"$admin.fn.add(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑</button>";

                                return edit;
                            }
                        }
                    ],
                    "fnServerParams": function (aoData) {
                        console.log($("#name").val());
                        aoData.username = $("#name").val();
                    }
                });
            },
            add : function(id) {
                var params = "?";
                if(id != null && id != '') {
                    params += "id=" + id + "&";
                }
                var checkId = $("#dataTables .list-check").getInputId2();
                console.log("checkId:" + checkId);
                if(checkId != null && checkId != '') {
                    params += "checkId=" + checkId;
                }
                window.location.href = "${contextPath}/admin/module/add" + params;
            },
            delete: function () {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = checkBox.getInputId();
                $.ajax({
                    url : "${contextPath}/admin/cq/deleteBatch",
                    data : {
                        "ids" : JSON.stringify(ids)
                    },
                    type : "post",
                    dataType : "json",
                    success : function(result) {
                        if(!result.status) {
                            $common.fn.notify(result.msg);
                            return;
                        }
                        $admin.v.dTable.ajax.reload();
                    }
                });
            },
            responseComplete: function (result, action) {
                if (result.status == "0") {
                    if (action) {
                        $admin.v.dTable.ajax.reload(null, false);
                    } else {
                        $admin.v.dTable.ajax.reload();
                    }
                    $leoman.notify(result.msg, "success");
                } else {
                    $leoman.notify(result.msg, "error");
                }
            }
        }
    }
    $(function () {
        $admin.fn.init();
    })
</script>


</html>