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
    <title>楼盘相册</title>
    <%@ include file="../inc/css.jsp" %>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">楼盘相册</h1>
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


                    </div>
                    <div class="panel-body">
                        <form id="productForm" method="post" class="form-horizontal" role="form">
                            <input type="hidden" id="id" name="id" value="${product.id}">

                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align: left">操作提示：点击相册编辑该相册的图片</label>
                            </div>

                            <div class="form-group" id="albumDiv">

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

<!-- 模板 -->
<div class="col-sm-2" style="display: none;margin-bottom: 10px;" id="albumTemplate">
    <img src="" style="height: 200px; width: 200px; display: inline; margin-bottom: 5px;cursor: pointer;" border="1" onclick=""/>
    <label class="col-sm-6 control-label">样板间(2张)</label>
</div>

<%@ include file="../inc/footer.jsp" %>
<!-- 配置文件 -->

</body>

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
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }
    $(function () {
        $houseAlbum.fn.init();
    })
</script>


</html>