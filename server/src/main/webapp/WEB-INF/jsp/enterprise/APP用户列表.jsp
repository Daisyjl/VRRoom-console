<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户列表</title>
    <%@ include file="../inc/css.jsp" %>
</head>

<body>
<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">用户列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="javascript:void(0)" onclick="_appUserList.fn.batchDel()" class="btn btn-outline btn-danger btn-lg" role="button">一键禁用</a>

                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" id="mobile" maxlength="20" placeholder="账号"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="nickName" maxlength="20" placeholder="昵称"/>
                            </div>
                            <div class="form-group">
                                <label>性别：</label>
                                <select id="sexList" style="width: 120px;" class="form-control">
                                    <option value="">全部</option>
                                    <option value="0">男</option>
                                    <option value="1">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>状态：</label>
                                <select id="statusList" style="width: 120px;" class="form-control">
                                    <option value="">全部</option>
                                    <option value="0">——</option>
                                    <option value="1">封禁</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>省份：</label>
                                <select id="provinceList" style="width: 120px;" class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label>城市：</label>
                                <select id="cityList" style="width: 120px;" class="form-control">
                                    <option value="">请选择城市</option>
                                </select>
                            </div>
                            <button type="button" id="c_search" class="btn btn-primary btn-sm">搜索</button>
                        </form>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">

                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <colgroup>
                                    <col class="gradeA even" style="width: 6%"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" onclick="$sixmac.checkAll(this)" class="checkall"/></th>
                                    <th>账号</th>
                                    <th>昵称</th>
                                    <th>注册时间</th>
                                    <th>性别</th>
                                    <th>状态</th>
                                    <th>所在地</th>
                                    <th>账户余额</th>
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

<script type="text/javascript">
    var _appUserList = {
        v: {
            id: "_appUserList",
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                // 加载省份下拉列表
                _appUserList.fn.getProvinceList();

                _appUserList.fn.dataTableInit();

                // 查询
                $("#c_search").click(function () {
                    _appUserList.v.dTable.ajax.reload();
                });

                $('#provinceList').change(function () {
                    _appUserList.fn.getCityList($(this).val());
                });
            },
            dataTableInit: function () {
                _appUserList.v.dTable = $sixmac.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "ordering": false,
                    "ajax": {
                        "url": "backend/appUser/list",
                        "type": "POST"
                    },
                    "columns": [
                        {"data": "id"},
                        {
                            "data": null,
                            render: function (data) {
                                if (null == data.mobile || data.mobile == '') {
                                    var showName = "";
                                    switch (Number(data.type)) {
                                        case 1:
                                            showName = 'QQ登录';
                                            break;
                                        case 2:
                                            showName = '微信登录';
                                            break;
                                        case 3:
                                            showName = '微博登录';
                                            break;
                                    }
                                    return showName;
                                } else {
                                    return data.mobile;
                                }
                            }
                        },
                        {"data": "nickName"},
                        {
                            "data": "createTime",
                            render: function (data) {
                                return formatJsonDateTime(data, 'yyyy-MM-dd hh:mm:ss');
                            }
                        },
                        {
                            "data": "sex",
                            render: function (data) {
                                if (data == 0) {
                                    return '男';
                                } else {
                                    return '女';
                                }
                            }
                        },
                        {"data": "sealStatus"},
                        {"data": "aliPayAccount"},
                        {
                            "data": "money",
                            render: function (data) {
                                return '￥' + data;
                            }
                        },
                        {"data": ""}
                    ],
                    "columnDefs": [
                        {
                            "data": null,
                            "defaultContent": "<a title='查看详情' class='btn btn-primary btn-circle edit'>" +
                            "<i class='fa fa-eye'></i>" +
                            "</a>" +
                            "&nbsp;&nbsp;" +
                            "<button type='button' title='启用' class='btn btn-success btn-circle changeStatus'>" +
                            "<i class='fa fa-recycle'></i>" +
                            "</button>",
                            "targets": -1
                        }
                    ],
                    "createdRow": function (row, data, index) {
                        _appUserList.v.list.push(data);
                        $('td', row).eq(0).html("<input type='checkbox' value=" + data.id + ">");
                    },
                    rowCallback: function (row, data) {
                        //渲染样式
                        if (data.sealStatus == 0) {
                            $('td', row).eq(5).html('——');
                            $('td', row).last().find(".changeStatus").addClass("btn-danger");
                            $('td', row).last().find(".changeStatus").attr("title", "封禁");
                        } else {
                            $('td', row).eq(5).html('封禁');
                            $('td', row).last().find(".changeStatus").addClass("btn-success");
                            $('td', row).last().find(".changeStatus").attr("title", "解禁");
                        }

                        $('td', row).last().find(".edit").attr("href", 'backend/appUser/show?appUserId=' + data.id);

                        $('td', row).last().find(".changeStatus").click(function () {
                            // 启用 or 禁用
                            if (data.sealStatus == 0) {
                                _appUserList.fn.changeStatus(data.id, 1);
                            } else {
                                _appUserList.fn.changeStatus(data.id, 0);
                            }
                        });
                    },
                    "fnServerParams": function (aoData) {
                        aoData.mobile = $('#mobile').val();
                        aoData.nickName = $('#nickName').val();
                        aoData.sex = $('#sexList option:selected').val();
                        aoData.status = $('#statusList option:selected').val();
                        aoData.provinceId = $('#provinceList option:selected').val();
                        aoData.cityId = $('#cityList option:selected').val();
                    },
                    "fnDrawCallback": function (row) {
                        $sixmac.uiform();
                    }
                });
            },
            changeStatus: function (id, status) {
                $sixmac.ajax("backend/appUser/changeStatus", {
                    "appUserId": id,
                    "status": status
                }, function (result) {
                    if (result == 1) {
                        $sixmac.notify("操作成功", "success");
                        _appUserList.v.dTable.ajax.reload(null, false);
                    } else {
                        $sixmac.notify("操作失败", "error");
                    }
                });
            },
            batchDel: function () {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = checkBox.getInputId();
                _appUserList.fn.deleteRow(checkBox, ids)
            },
            deleteRow: function (checkBox, ids) {
                if (ids.length > 0) {
                    $sixmac.optNotify(function () {
                        $sixmac.ajax("backend/appUser/batchUpdate", {
                            ids: JSON.stringify(ids),
                            status: 1
                        }, function (result) {
                            if (result > 0) {
                                $sixmac.notify("操作成功", "success");
                                _appUserList.v.dTable.ajax.reload();
                            } else {
                                $sixmac.notify("操作失败", "error");
                            }
                        })
                    }, '确定禁用选中的所有用户？', '确定');
                }
            },
            getProvinceList: function () {
                $sixmac.ajax("common/provinceList", null, function (result) {
                    if (null != result) {
                        var content = "<option value=''>请选择省份</option>";
                        jQuery.each(result, function (i, item) {
                            content += "<option value='" + item.id + "'>" + item.name + "</option>";
                        });
                        $('#provinceList').append(content);
                    } else {
                        $sixmac.notify("获取省份信息失败", "error");
                    }
                });
            },
            getCityList: function (provinceId) {
                $('#cityList').html('');

                $sixmac.ajax("common/cityList", {
                    provinceId: provinceId
                }, function (result) {
                    if (null != result) {
                        var content = "<option value=''>请选择城市</option>";
                        jQuery.each(result, function (i, item) {
                            content += "<option value='" + item.id + "'>" + item.name + "</option>";
                        });
                        $('#cityList').append(content);
                    } else {
                        $sixmac.notify("获取城市信息失败", "error");
                    }
                });
            }
        }
    }

    $(document).ready(function () {
        _appUserList.fn.init();
    });

</script>

</html>