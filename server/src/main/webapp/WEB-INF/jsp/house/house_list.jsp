<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <title>楼盘列表</title>
    <%@ include file="../inc/new2/css.jsp" %>
</head>
<body class="sticky-header">
<section>
    <%@ include file="../inc/new2/menu.jsp" %>
    <!-- main content start-->
    <div class="main-content">
        <%@ include file="../inc/new2/header.jsp" %>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <div class="panel-body">
                            <div class="form-group col-sm-2">
                                <input type="text" id="username" name="username" class="form-control"
                                       id="exampleInputEmail2" placeholder="姓名">
                            </div>
                            <button id="c_search" class="btn btn-info">搜索</button>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            楼盘列表
                            <span class="tools pull-right" style="margin-right: 10px;margin-left: 10px">
                               <button class="btn btn-info" type="button" onclick="$house.fn.del();" id="deleteBatch" style="display: none">删除</button>
                            </span>
                            <span class="tools pull-right">
                               <button class="btn btn-default " type="button"><i class="fa fa-refresh"></i>刷新</button>
                               <button class="btn btn-info" type="button" onclick="$house.fn.add();">新增楼盘</button>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="adv-table">
                                <table class="display table table-bordered table-striped" id="dataTables" width="100%">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" class="list-parent-check"
                                                   onclick="$leoman.checkAll(this);"/></th>
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
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="../inc/new2/foot.jsp" %>
<script>
    $house = {
        v: {
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                $house.fn.dataTableInit();
                $("#c_search").click(function () {
                    $house.v.dTable.ajax.reload();
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
                        {
                            "data": "id",
                            "render": function (data) {
                                var str = "0";
                                return str;
                            }
                        },
                        {
                            "data": "id",
                            "render": function (data) {
                                var str = "0%";
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

                                var editBasic = "<button title='编辑基本信息' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editBasic(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑基本信息</button>";

                                var editUnit = "<button title='编辑户型' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editUnit(\'" + data + "\')\">" +
                                    "<i class='fa fa-pencil-square-o'></i> 编辑户型</button>";

                                var editFloor = "<button title='编辑楼层信息' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editFloor(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼层信息</button>";

                                var editRidgepole = "<button title='编辑楼层信息' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editRidgepole(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼</button>";

                                var editAlbum = "<button title='编辑楼层相册' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editAlbum(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼层相册</button>";

                                var editDynamic = "<button title='编辑楼盘动态' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editDynamic(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑楼盘动态</button>";

                                var editRoom = "<button title='编辑房间状态' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.editRoom(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑房间状态</button>";

                                var del = "<button title='删除' class='btn btn-primary btn-circle edit' onclick=\"$house.fn.del(\'" + data + "\')\">" +
                                        "<i class='fa fa-trash-o'></i> 删除</button>";

                                return editBasic + "&nbsp;" + editUnit + "&nbsp;" + editFloor + "&nbsp;" + editRidgepole+ "&nbsp;" + editAlbum+ "&nbsp;" + editDynamic+ "&nbsp;" + editRoom  + "&nbsp;" + del;

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
                location.href = "${contextPath}/admin/house/editDynamic/"+id;
            },
            del: function (id) {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = checkBox.getInputId();
                $("#confirm").modal("show");
                $('#showText').html('您确定要彻底删除所选的企业吗？');
                $("#determine").off("click");
                $("#determine").on("click",function(){
                    $.ajax({
                        "url": "${contextPath}/admin/enterprise/del",
                        "data": {
                            id:id,
                            ids:JSON.stringify(ids)
                        },
                        "dataType": "json",
                        "type": "POST",
                        success: function (result) {
                            if (result==1) {
                                $('#showText').html('删除错误');
                            }else {
                                $("#deleteBatch").css('display','none');
                                $house.v.dTable.ajax.reload(null,false);
                            }
                            $("#confirm").modal("hide");
                        }
                    });
                })
            },
            responseComplete: function (result, action) {
                if (result.status == "0") {
                    if (action) {
                        $house.v.dTable.ajax.reload(null, false);
                    } else {
                        $house.v.dTable.ajax.reload();
                    }
                    $leoman.notify(result.msg, "success");
                } else {
                    $leoman.notify(result.msg, "error");
                }
            }
        }
    }
    $(function () {
        $house.fn.init();
    })
</script>
</body>
</html>
