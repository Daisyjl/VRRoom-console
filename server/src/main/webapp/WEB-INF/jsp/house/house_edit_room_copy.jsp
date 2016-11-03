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
    <title>编辑房间状态</title>
    <%@ include file="../inc/css.jsp" %>

    <style type="text/css">
        .radio label, .checkbox label {
            padding-left: 0px;
            margin-bottom: 0;
            font-weight: 400;
            cursor: pointer
        }
        div.checkbox{
            margin-right: 50px;
        }
    </style>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑房间状态</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form method="post" class="form-horizontal" role="form">

                            <div class="form-group">
                                <label class="col-sm-3 control-label" ><span style="color: red;">* </span>
                                    操作提示：选中房间号前的复选框，则表示已售罄</label>
                            </div>

                            <c:forEach items="${list}" var="ridgepole">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label">${ridgepole.name}</label>

                                    <div class="col-sm-9 icheck minimal">
                                        <c:forEach items="${ridgepole.floorList}" var="floor">
                                            <c:forEach items="${floor.roomList}" var="room">

                                                <div class="checkbox">
                                                    <c:if test="${room.isSale == 0}"><input type="checkbox" val="${room.id}"></c:if>
                                                    <c:if test="${room.isSale == 1}"><input type="checkbox" checked val="${room.id}"></c:if>
                                                    <label>${room.roomNo}</label>
                                                </div>

                                            </c:forEach>
                                        </c:forEach>
                                    </div>
                                </div>

                            </c:forEach>

                            <div class="form-group">
                                <div class="col-sm-6">
                                    <button type="button" onclick="$houseRoom.fn.save()" class="btn btn-primary"><i class="fa fa-check"></i> 保存</button>
                                    <button type="button" onclick="$houseRoom.fn.back()" class="btn btn-primary"><i class="fa fa-reply"></i> 返回</button>
                                </div>
                            </div>

                        </form>
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
<!-- 配置文件 -->

</body>

<script>
    $houseRoom = {
        v: {
            list: [],
            chart: null,
            dTable: null,
        },
        fn: {
            init: function () {

                $('.minimal input').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal',
                    increaseArea: '20%' // optional
                });
            },
            save : function() {
                var arr = [];

                $("input[type=checkbox]").each(function(){
                    var data = {
                        roomId : $(this).attr("val"),
                        isSale : $(this).is(':checked')==true?parseInt(1):parseInt(0)
                    };
                    arr.push(data);
                });

                $.post("${contextPath}/admin/house/ridgepole/saveRoom", {data:JSON.stringify(arr)}, function(result){
                    if(result.status == 0){
                        $houseRoom.fn.back();
                    }else{
                        $leoman.alertMsg(result.msg);
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }
    $(function () {
        $houseRoom.fn.init();
    })
</script>


</html>