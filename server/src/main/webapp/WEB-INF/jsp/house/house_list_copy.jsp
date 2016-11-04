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
    <title>楼盘列表</title>
    <%@ include file="../inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">楼盘列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <a href="admin/house/add" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-plus'></i> 新增楼盘</a>

                        <a href="javascript:;" onclick="$house.fn.del()" class="btn btn-outline btn-danger btn-lg"
                           role="button"><i class='fa fa-trash-o'></i> 删除</a>

                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label>楼盘名称：</label>
                                <input type="text" id="name" name="username" class="form-control" placeholder="楼盘名称">
                            </div>
                            <button type="button" id="searchBtn" class="btn btn-primary btn-sm"><i class='fa fa-search'></i> 查询</button>
                            <button type="button" id="clearBtn" class="btn btn-primary btn-sm"><i class='fa fa-refresh'></i> 清空</button>
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
                                    <th>楼盘名称</th>
                                    <th>所属企业</th>
                                    <th>城市</th>
                                    <th>开盘状态</th>
                                    <th>房间数</th>
                                    <th>资料完善度</th>
                                    <th>添加时间</th>
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
    $house = {
        v: {
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                $house.fn.dataTableInit();

                $("#searchBtn").click(function () {
                    $house.v.dTable.ajax.reload();
                });

                $("#clearBtn").click(function () {
                    $("form").find("input, select").val("");
                });
            },
            dataTableInit: function () {
                $house.v.dTable = $leoman.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "bSort": false,
                    "ajax": {
                        "url": "${contextPath}/admin/house/list",
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
                        {"data": "name"},
                        {"data": "enterprise.name"},
                        {"data": "enterprise.city.name"},
                        {
                            "data": "isOpenWait",
                            "render": function (data) {
                                var str = data==0?'未开盘':'已开盘';
                                return str;
                            }
                        },
                        {"data": "roomNum"},
                        {
                            "data": "housePercent",
                            "render": function (data) {
                                var str = data + "%";
                                return str;
                            }
                        },
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

                                var editBasic = "<button title='编辑基本信息' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editBasic(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑基本信息</button>";

                                var editUnit = "<button title='编辑户型' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editUnit(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑户型</button>";

                                var editFloor = "<button title='编辑楼层信息' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editFloor(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼层信息</button>";

                                var editRidgepole = "<button title='编辑楼信息' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editRidgepole(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼信息</button>";

                                var editAlbum = "<button title='编辑楼层相册' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editAlbum(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼层相册</button>";

                                var editDynamic = "<button title='编辑楼盘动态' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editDynamic(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼盘动态</button>";

                                var editRoom = "<button title='编辑房间状态' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.editRoom(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑房间状态</button>";

                                var del = "<button title='删除' style='margin-bottom: 10px;' class='btn btn-primary edit' onclick=\"$house.fn.del(\'" + data + "\')\">" +
                                        "<i class='fa fa-trash-o'></i></button>";

                                return editBasic + "&nbsp;" + editUnit + "&nbsp;" + editFloor + "&nbsp;" + editRidgepole+ "&nbsp;" + editAlbum+ "&nbsp;" + editDynamic+ "&nbsp;" + editRoom  + "&nbsp;" + del;

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
                window.location.href = "${contextPath}/admin/house/add" + params;
            },
            //编辑基本信息
            editBasic : function (id){
                location.href = "${contextPath}/admin/house/edit/"+id;
            },
            //编辑户型信息
            editUnit : function (id){
                location.href = "${contextPath}/admin/house/unit/edit/"+id;
            },
            //编辑楼层信息
            editFloor : function (id){
                location.href = "${contextPath}/admin/house/floor/editType/"+id;
            },
            //编辑楼栋
            editRidgepole : function (id){
                location.href = "${contextPath}/admin/house/ridgepole/edit/"+id;
            },
            //编辑楼层相册
            editAlbum : function (id){
                location.href = "${contextPath}/admin/house/album/edit/"+id;
            },
            //编辑楼层动态
            editDynamic : function (id){
                location.href = "${contextPath}/admin/house/dynamic/edit/"+id;
            },
            //编辑房间状态
            editRoom : function (id){
                location.href = "${contextPath}/admin/house/ridgepole/editRoom/"+id;
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
                        "url": "${contextPath}/admin/house/del",
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
    };

    $(function () {
        $house.fn.init();
    })
</script>


</html>