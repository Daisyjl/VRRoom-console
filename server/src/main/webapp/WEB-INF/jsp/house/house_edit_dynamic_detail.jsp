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
    <title>编辑动态</title>
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
                            新增/编辑动态
                        </header>
                        <div class="panel-body">
                            <form class="cmxform form-horizontal adminex-form" id="formId" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${dynamic.id}">
                                <input type="hidden" name="houseId" value="${houseId}">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>标题：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="title" value="${dynamic.title}" class="form-control" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" style="width: 100px;"><span style="color: red;">* </span>内容：</label>
                                    <div class="col-sm-6">
                                        <script type="text/plain" id="myEditor" name="content" style="width:900px;height:500px;">${dynamic.content}</script>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="button" onclick="$houseDynamic.fn.save()" class="btn btn-primary">保存</button>
                                        <button type="button" class="btn btn-primary" onclick="$houseDynamic.fn.back()">返回</button>
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
    $houseDynamic = {
        v: {
            list: [],
            chart: null,
            dTable: null,
            um : null
        },
        fn: {
            init: function () {

                $houseDynamic.fn.initEdior();//初始化编辑器

            },
            initEdior : function() {
                $houseDynamic.v.um = UM.getEditor('myEditor');
            },
            //保存
            save : function() {
                if(!$("#formId").valid()) return;
                $("#formId").ajaxSubmit({
                    url : "${contextPath}/admin/house/dynamic/save",
                    type : "POST",
                    success : function(result) {
                        if(result.status == 0) {
                            $houseDynamic.fn.back();
                        }
                        else {
                            $leoman.alertMsg(result.msg);
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/dynamic/edit/${houseId}";
            }
        }
    };

    $(function () {
        $houseDynamic.fn.init();
    });

</script>
</body>
</html>
