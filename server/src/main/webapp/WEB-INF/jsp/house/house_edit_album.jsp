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
    <title>新增/编辑楼盘相册</title>
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

            <!-- 户型信息 -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            楼盘相册
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form">
                                <input name="id" type="hidden" value="${enterprise.id}">

                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$houseAlbum.fn.back()" class="btn btn-primary"><i class="fa fa-reply"></i> 返回</button>
                                    </div>
                                </div>

                                <div class="form-group" id="albumDiv">

                                </div>


                            </form>
                        </div>
                    </section>
                </div>
            </div>

        </section>
    </div>
    <!-- main content end-->

    <!-- 模板 -->
    <div class="col-sm-2" style="display: none;margin-bottom: 10px;" id="albumTemplate">
        <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;cursor: pointer;" border="1" onclick=""/>
        <label class="col-sm-6 control-label">样板间(2张)</label>
    </div>

</section>
<%@ include file="../inc/new2/foot.jsp" %>
<script>
    $houseAlbum = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {

                $("#albumDiv").empty();
                $.post("${contextPath}/admin/house/album/list",{'houseId':"${houseId}"},function(result){
                    if(result.status == 0){
                        var list = result.data.object.list;
                        for(var i=0; i < list.length; i++){
                            var albumTemplate = $("#albumTemplate").clone().removeAttr("id");
                            albumTemplate.find("img").attr("src",list[i].coverUrl);
                            albumTemplate.find("img").attr("onclick","$houseAlbum.fn.editImage("+list[i].id+")");
                            albumTemplate.find("label").text(list[i].name+"("+list[i].imageNum+"张)");
                            albumTemplate.show();
                            $("#albumDiv").append(albumTemplate);

                        }
                    }
                });
            },
            editImage : function(id){
                window.location.href = "${contextPath}/admin/house/album/editImage/${houseId}_"+id;
            },
            openModal : function (){
                $("#myModal").modal("show");
            },
            //保存弹出的新增户型
            saveAddUnit : function (){
                $("#unitForm").ajaxSubmit({
                    url : "${contextPath}/admin/house/unit/saveAdd",
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
            save : function() {
                if(!$("#formId").valid()) return;
                $("#intro").val($houseAlbum.v.um.getContent());
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/unit/saveAdd",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $("#myModal").modal("hide");
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
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
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }
    $(function () {
        $houseAlbum.fn.init();
    })
</script>
</body>
</html>
