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

                            <button id="c_search" class="btn btn-info">搜索</button>
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

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 850px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增/编辑动态</h4>
                </div>
                <div class="modal-body">
                    <form class="cmxform form-horizontal adminex-form" id="formId" enctype="multipart/form-data">
                        <input type="hidden" name="houseId" value="${houseId}">
                        <input type="hidden" id="dynamicId" name="id" value="">

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" value="" class="form-control" required/>
                            </div>
                        </div>

                        <%--<div class="form-group">
                            <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>内容：</label>
                            <div class="col-sm-6">
                                <script type="text/plain" id="myEditor" name="content" style="width:700px;height:240px;"></script>
                            </div>
                        </div>--%>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="$houseDynamic.fn.save()" class="btn btn-primary">保存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
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

//                $houseDynamic.fn.initEdior();//初始化编辑器

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
                        aoData.tilte = $("#title").val();
                        aoData.houseId = "${houseId}";
                        aoData.startDate = $("#startDate").val();
                        aoData.endDate = $("#endDate").val();
                    }
                });
            },
            initEdior : function() {
                $houseDynamic.v.um = UM.getEditor('myEditor');
            },
            add: function (id) {
                window.location.href = "${contextPath}/admin/house/dynamic/editDetail?id="+id;
                /*if(id != undefined && id != ''){
                    $.post("${contextPath}/admin/house/dynamic/detail", {id:id}, function(result){
                        if(result.status == 0){
                            var data = result.data.houseDynamic;
                            $("#dynamicId").val(data.id);
                            $("[name=title]").val(data.title);
                            UM.getEditor('myEditor').setContent(data.content);
                            $("#myModal").modal("show");
                        }
                    });
                }else{
                    $("#myModal").modal("show");
                }*/
            },
            save:function(){
                if(!$("#formId").valid()) return;
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/dynamic/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.reload();
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
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
                                $bus.v.dTable.ajax.reload(null,false);
                            }else{
                                $leoman.alertMsg(result.msg);
                            }
                        }
                    });
                });
            },
            responseComplete: function (result, action) {
                if (result.status == "0") {
                    if (action) {
                        $houseDynamic.v.dTable.ajax.reload(null, false);
                    } else {
                        $houseDynamic.v.dTable.ajax.reload();
                    }
                    $leoman.notify(result.msg, "success");
                } else {
                    $leoman.notify(result.msg, "error");
                }
            }
        }
    }
    $(function () {
        $houseDynamic.fn.init();
    })
</script>
</body>
</html>
