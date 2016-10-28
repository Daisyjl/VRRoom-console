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
    <title>编辑房间状态</title>
    <%@ include file="../inc/new2/css.jsp" %>
</head>

<body class="sticky-header">

<section>
    <%@ include file="../inc/new2/menu.jsp" %>
    <!-- main content start-->
    <div class="main-content">
        <%@ include file="../inc/new2/header.jsp" %>
        <!--body wrapper start-->
        <section class="wrapper">
            <!-- page start-->

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            编辑房间状态
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form" id="formId" enctype="multipart/form-data">

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
                    </section>
                </div>
            </div>

        </section>
    </div>
    <!-- main content end-->

</section>
<%@ include file="../inc/new2/foot.jsp" %>
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
</body>
</html>
