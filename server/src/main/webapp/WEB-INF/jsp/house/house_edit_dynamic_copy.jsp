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
    <title>楼盘动态</title>
    <%@ include file="../inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">楼盘动态</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <a href="admin/house/index" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-reply'></i> 返回</a>

                        <a href="admin/house/dynamic/editDetail?houseId=${houseId}" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-plus'></i> 新增动态</a>

                        <a href="javascript:;" onclick="$houseDynamic.fn.del()" class="btn btn-outline btn-danger btn-lg"
                           role="button"><i class='fa fa-trash-o'></i> 删除</a>

                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label>动态标题：</label>
                                <input type="text" class="form-control" value="" id="title"  name="title" maxlength="20" placeholder="请输入动态标题">
                            </div>
                            <div class="form-group">
                                <label>从：</label>
                                <input type="text" id="startDate" class="form-control input-append date form_datetime" style="width: 180px;" readonly maxlength="20" value="" placeholder="请选择起始时间">
                            </div>
                            <div class="form-group">
                                <label>至：</label>
                                <input type="text" id="endDate" class="form-control input-append date form_datetime" style="width: 180px;" readonly maxlength="20" value="" placeholder="请选择结束时间">
                            </div>
                            <button type="button" id="searchBtn" class="btn btn-primary btn-sm"><i class='fa fa-search'></i> 查询</button>
                            <button type="button" id="clearBtn" class="btn btn-primary btn-sm"><i class='fa fa-refresh'></i> 清空</button>
                        </form>

                        <div class="clearfix"></div>
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
                                    <th>动态标题</th>
                                    <th>发布时间</th>
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
    $houseDynamic = {
        v: {
            list: [],
            dTable: null,
            um : null
        },
        fn: {
            init: function () {
                $houseDynamic.fn.dataTableInit();

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
                    $houseDynamic.v.dTable.ajax.reload();
                });

                $("#clearBtn").click(function () {
                    $("form").find("input, select").val("");
                });
            },
            dataTableInit: function () {
                $houseDynamic.v.dTable = $leoman.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "bSort": false,
                    "ajax": {
                        "url": "${contextPath}/admin/house/dynamic/list",
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
                        {"data": "title"},
                        {
                            "data": "createDate",
                            "render": function (data) {
                                var date = new Date(data);
                                return date.format('yyyy-MM-dd h:m:s');
                            }
                        },
                        {
                            "data": "id",
                            "render": function (data, type, row, meta) {

                                var edit = "<button title='编辑' class='btn btn-primary edit' onclick=\"$houseDynamic.fn.add(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑</button>";

                                var del = "<button title='删除' class='btn btn-primary edit' onclick=\"$houseDynamic.fn.del(\'" + data + "\')\">" +
                                        "<i class='fa fa-trash-o'></i> 删除</button>";

                                return edit + "&nbsp;" + del;

                            }
                        }
                    ],
                    "fnServerParams": function (aoData) {
                        aoData.title = $("#title").val();
                        aoData.houseId = "${houseId}";
                        aoData.startDate = $("#startDate").val();
                        aoData.endDate = $("#endDate").val();
                    }
                });
            },
            //新增/编辑
            add: function (id) {
                id = (id==undefined?"":("&id="+id));
                window.location.href = "${contextPath}/admin/house/dynamic/editDetail?houseId=${houseId}"+id;
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
                        "url": "${contextPath}/admin/house/dynamic/delete",
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
        $houseDynamic.fn.init();
    })
</script>

</html>