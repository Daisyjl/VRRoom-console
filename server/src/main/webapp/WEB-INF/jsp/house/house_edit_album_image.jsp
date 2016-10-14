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
    <title>新增/编辑楼盘相册图片</title>
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
                            楼盘相册图片
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form">
                                <input name="id" type="hidden" value="${enterprise.id}">

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$houseUnit.fn.openModal()" class="btn btn-primary"><i class="fa fa-plus"></i> 添加户型</button>
                                        <button type="button" onclick="$houseUnit.fn.back()" class="btn btn-primary"><i class="fa fa-reply"></i> 返回</button>
                                    </div>
                                </div>



                            </form>
                            <form action="${contextPath}/static/html/js/dropzone/upload.php" class="dropzone" id="my-awesome-dropzone"></form>
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
    $houseUnit = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null,
        },
        fn: {
            init: function () {
                $("#planeFile").uploadPreview({
                    Img: "planeImg",
                });

                $("#d3File").uploadPreview({
                    Img: "d3Img",
                });

                $("#unitDiv").empty();
                $.post("${contextPath}/admin/house/unit/list",{'houseId':"${house.id}"},function(result){
                    if(result.status == 0){
                        var list = result.data.object.list;
                        for(var i=0; i < list.length; i++){
                            var unitTemplate = $("#unitTemplate").clone().removeAttr("id");
                            unitTemplate.find("label").text("户型"+(i+1)+"：");
                            unitTemplate.find("img").prop("src",list[i].planeImage.path);
                            unitTemplate.find(".form-group").eq(0).text("户型名称："+list[i].name);
                            unitTemplate.find(".form-group").eq(1).text("建筑面积："+list[i].totalArea);
                            unitTemplate.find(".form-group").eq(2).text("参考总价："+list[i].totalPrice);
                            unitTemplate.find("button").attr("onclick","$houseUnit.fn.delete("+list[i].id+")");
                            unitTemplate.show();
                            $("#unitDiv").append(unitTemplate);

                        }
                    }
                });
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
                $("#intro").val($houseUnit.v.um.getContent());
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
        $houseUnit.fn.init();
    })
</script>
</body>
</html>
