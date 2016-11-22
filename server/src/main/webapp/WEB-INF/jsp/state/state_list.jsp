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
    <title>文案管理</title>
    <%@ include file="../inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">文案列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

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
                                    <th>类型</th>
                                    <th>修改时间</th>
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
    $state = {
        v: {
            list: [],
            dTable: null,
            um : null
        },
        fn: {
            init: function () {
                $state.fn.dataTableInit();

                $('.form_datetime').datetimepicker({
                    language: 'zh-CN',
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 'month',
                    minView: "month",
                    forceParse: 0,
                    showMeridian: false,
                    format: 'yyyy-mm-dd hh:ii'
                });

                $("#searchBtn").click(function () {
                    $state.v.dTable.ajax.reload();
                });

                $("#clearBtn").click(function () {
                    $("form").find("input, select").val("");
                });
            },
            dataTableInit: function () {
                $state.v.dTable = $leoman.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "bSort": false,
                    "ajax": {
                        "url": "${contextPath}/admin/state/list",
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
                        {
                            "data": "type",
                            "render": function (data) {
                                var str = "";
                                if(data == 1){
                                    str = "服务条款";
                                }else if(data == 2){
                                    str = "注册协议";
                                }
                                return str;
                            }
                        },
                        {
                            "data": "updateDate",
                            "render": function (data) {
                                var date = new Date(data);
                                return date.format('yyyy-MM-dd hh:mm');
                            }
                        },
                        {
                            "data": "id",
                            "render": function (data, type, row, meta) {

                                var edit = "<button title='编辑' class='btn btn-primary edit' onclick=\"$state.fn.add(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑</button>";

                                var del = "<button title='删除' class='btn btn-primary edit' onclick=\"$state.fn.del(\'" + data + "\')\">" +
                                        "<i class='fa fa-trash-o'></i> 删除</button>";

                                return edit + "&nbsp;" + del;

                            }
                        }
                    ],
                    "fnServerParams": function (aoData) {
                        aoData.title = $("#title").val();
                    }
                });
            },
            //新增/编辑
            add: function (id) {
                id = (id==undefined?"":("?id="+id));
                window.location.href = "${contextPath}/admin/state/edit"+id;
            },
            del: function (id) {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = [];
                if(id != null){
                    ids.push(id);
                }else{
                    ids = checkBox.getInputId();
                }
                if(ids.length == 0 || ids == false){
                    $leoman.alertMsg("请至少选择一条数据");
                    return ;
                }
                $leoman.alertConfirm("确定要删除吗？",function(){
                    $.ajax({
                        "url": "${contextPath}/admin/state/delete",
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
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }
    $(function () {
        $state.fn.init();
    })
</script>

</html>