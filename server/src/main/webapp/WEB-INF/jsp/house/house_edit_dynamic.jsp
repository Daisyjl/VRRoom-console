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
    <title>楼盘动态</title>
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

                            <div class="form-group col-sm-1">
                                <button class="btn btn-info" onclick="$houseDynamic.fn.back()"><i class='fa fa-reply'></i> 返回</button>
                            </div>

                            <div class="form-group col-sm-2">
                                <input type="text" id="title" name="title" class="form-control" id="exampleInputEmail2" placeholder="动态标题">
                            </div>
                            <div class="form-group col-sm-1" style="width: 50px;margin-top: 5px;">
                                从：
                            </div>
                            <div class="form-group col-sm-2" style="width: 200px;">
                                <input type="text" id="startDate" class="form-control input-append date form_datetime" style="width: 180px;" readonly maxlength="20" value="" placeholder="请选择起始时间">
                            </div>
                            <div class="form-group col-sm-1" style="width: 50px;margin-top: 5px;">
                                至：
                            </div>
                            <div class="form-group col-sm-2">
                                <input type="text" id="endDate" class="form-control input-append date form_datetime" style="width: 180px;" readonly maxlength="20" value="" placeholder="请选择结束时间">
                            </div>

                            <button id="c_search" class="btn btn-info"><i class='fa fa-search'></i> 搜索</button>
                            <button id="c_clear" class="btn btn-info"><i class='fa fa-refresh'></i> 清空</button>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">

                    <section class="panel">
                        <header class="panel-heading">
                            楼盘动态列表
                            <span class="tools pull-right" style="margin-right: 10px;margin-left: 10px">
                               <button class="btn btn-info" type="button" onclick="$houseDynamic.fn.del();" id="deleteBatch" style="display: none">删除</button>
                            </span>
                            <span class="tools pull-right">
                               <button class="btn btn-info" type="button" onclick="$houseDynamic.fn.add();">新增楼盘动态</button>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="adv-table">
                                <table class="display table table-bordered table-striped" id="dataTables" width="100%">
                                    <thead>
                                    <tr>
                                        <th style="width: 10%;!important;"><input type="checkbox" class="list-parent-check"
                                                   onclick="$leoman.checkAll(this);"/></th>
                                        <th>动态标题</th>
                                        <th>发布时间</th>
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
                
                $("#c_search").click(function () {
                    $houseDynamic.v.dTable.ajax.reload();
                });

                $("#c_clear").click(function () {
                    $("input, select").val("");
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

                                var edit = "<button title='编辑' class='btn btn-primary btn-circle edit' onclick=\"$houseDynamic.fn.add(\'" + data + "\')\">" +
                                        "<i class='fa fa-pencil-square-o'></i> 编辑</button>";

                                var del = "<button title='删除' class='btn btn-primary btn-circle edit' onclick=\"$houseDynamic.fn.del(\'" + data + "\')\">" +
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
                id = (id==undefined?"":("?id="+id));
                window.location.href = "${contextPath}/admin/house/dynamic/editDetail"+id;
            },
            del: function (id) {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = [];
                if(id != null){
                    ids.push(id);
                }else{
                    ids = checkBox.getInputId();
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
</body>
</html>
