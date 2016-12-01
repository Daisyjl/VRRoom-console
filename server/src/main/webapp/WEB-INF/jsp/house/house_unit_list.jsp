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
    <title>户型信息</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">户型信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-heading">
                        <a href="admin/house/index" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-reply'></i> 返回</a>

                        <a href="javascript:;" onclick="$houseUnit.fn.openModal()" class="btn btn-outline btn-primary btn-lg"
                           role="button"><i class='fa fa-plus'></i> 添加户型</a>
                    </div>

                    <div class="panel-body">
                        <form method="post" class="form-horizontal" role="form">
                            <input type="hidden" id="id" name="id" value="${product.id}">

                            <div id="unitDiv">

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

<!-- 户型模板 -->
<div class="form-group" style="display: none;" id="unitTemplate">
    <label class="col-sm-1 control-label">户型：</label>
    <div class="col-sm-2">
        <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;" border="1"/>
    </div>
    <div class="col-sm-2">
        <div class="form-group">
            户型名称：
        </div>
        <div class="form-group">
            建筑面积：
        </div>
        <div class="form-group">
            参考总价：
        </div>
    </div>
    <div class="col-sm-2">
        <button type="button" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> 编辑</button>
        <button type="button" onclick="" class="btn btn-primary"><i class="fa fa-minus"></i> 删除</button>
    </div>
</div>



<%@ include file="../inc/footer.jsp" %>
<!-- 配置文件 -->

</body>

<script>
    $houseUnit = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {

                $("#unitDiv").empty();
                $.post("${contextPath}/admin/house/unit/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.list;
                        for(var i=0; i < list.length; i++){
                            var unitTemplate = $("#unitTemplate").clone().removeAttr("id");
                            unitTemplate.find("label").text("户型"+(i+1)+"：");
                            if(list[i].planeImage != null){
                                unitTemplate.find("img").prop("src",list[i].planeImage.uploadUrl);
                            }
                            unitTemplate.find(".form-group").eq(0).text("户型名称："+list[i].name);
                            unitTemplate.find(".form-group").eq(1).text("建筑面积："+list[i].totalArea);
                            unitTemplate.find(".form-group").eq(2).text("参考总价："+(list[i].totalPrice==null?"":list[i].totalPrice));
                            unitTemplate.find("button").eq(0).attr("onclick","$houseUnit.fn.openModal("+list[i].id+")");
                            unitTemplate.find("button").eq(1).attr("onclick","$houseUnit.fn.delete("+list[i].id+")");
                            unitTemplate.show();
                            $("#unitDiv").append(unitTemplate);
                        }
                    }
                });
            },
            openModal : function (id){
                id = (id != '' && id != undefined)?("&id="+id):"";
                window.location.href = "admin/house/unit/edit?houseId=${houseId}"+id;
            },
            //保存弹出的新增户型
            save : function (){
                if(!$("#unitForm").isValid()) return;

                if($("#planeImg").attr("src") == '' ||  $("#planeImg").attr("src").indexOf('static/images/add.jpg') > -1){
                    $leoman.alertMsg("户型图不能为空");
                    return ;
                }

                $leoman.showLoading();
                $("#unitForm").ajaxSubmit({
                    url : "${contextPath}/admin/house/unit/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            window.location.reload();
                        }
                        else {
                            $leoman.hideLoading();
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            //删除
            delete : function (id){
                $leoman.alertConfirm("您确定要删除该户型吗？",function(){
                    $.post("${contextPath}/admin/house/unit/delete",{'id':id},function(result){
                        if(result.status != 0){
                            window.location.reload();
                        }else{
                            $leoman.alertMsg(result.msg);
                        }
                    });
                });
            },
            //返回
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    };

    $(function () {
        $houseUnit.fn.init();
    });
</script>


</html>