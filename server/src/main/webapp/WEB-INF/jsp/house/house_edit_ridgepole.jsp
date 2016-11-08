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
    <title>编辑楼信息</title>
    <%@ include file="../inc/css.jsp" %>

    <style type="text/css">
        /*模块拖拽*/
        .drag {
            position: absolute;
            width: 130px;
            height: 30px;
            border: 1px solid #ddd;
            background: #FBF2BD;
            text-align: center;
            padding: 5px;
            cursor: move;;
            opacity: 0.7;
            border-radius: 5px;
        }
    </style>

</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑楼信息</h1>
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
                        <form method="post" class="form-horizontal" role="form">

                            <input id="objectId" type="hidden" value="${house.bigImage.id }">
                            <input id="labelId" type="hidden" value="">
                            <input id="height" type="hidden" value="">
                            <input id="width" type="hidden" value="">
                            <input id="left" type="hidden" value="">
                            <input id="top" type="hidden" value="">
                            <input id="name" type="hidden" value="">

                            <div class="form-group">
                                <label class="col-sm-1 control-label">操作提示：</label>
                                <label class="col-sm-6 control-label" style="text-align: left">
                                    输入楼名称后，点击添加标签，移动生成的标签至图上的对应的楼即可保存
                                </label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >上传图片：</label>
                                <div class="col-sm-1">

                                    <button type="button" style="" onclick="Label.fn.AddTempImg()" class="btn btn-primary btn-sl">上传/更换 图片</button>
                                </div>
                                <label class="col-sm-3 control-label" >(操作提示：更换图片，需要重新移动标签编辑楼层的位置)</label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">输入标签：</label>
                                <div class="col-sm-2">
                                    <input type="text" id="labelInput" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" style="" onclick="Label.fn.addLabel()" class="btn btn-primary btn-sl">添加标签</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" ></label>
                                <div>
                                    <input type="hidden" id="bigImageId">
                                    <img id="mainImg" style="position: relative;" src="${house.bigImage.uploadUrl }"/>
                                    <div id="baseImg"></div>
                                </div>

                                <div class="">
                                    <div id="tempLabels" style="border: 1px;"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label" >编辑标签</label>
                                <div class="col-sm-5" id="labelEditDiv">

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

<!-- 图片上传form -->
<form id="tempImageForm" method="post" action="${contextPath}/admin/house/saveBigImage" enctype="multipart/form-data" class="form-horizontal" role="form">
    <input type="hidden" name="houseId" value="${house.id}">
    <input type="file" name="tempImage" id="tempImage" data-rule="required" style="display:none;" onchange="Label.fn.saveTempImage()"/>
</form>

<!-- 隐藏区域--标签 -->
<div id="temp" style="display: none;" class="drag" onmousedown="Label.fn.dragMove(this,event)">
    <div></div>
    <a href="javascript:void(0);" style="float: none; z-index: 10; position: relative; bottom: 22px; left: 57px;display: none;" onclick="Label.fn.deleteLabel(this)">
        <img id="pic1" src="${contextPath}/static/images/xx.png" style="height: 16px; width: 16px; display: inherit;" border="1"/>
    </a>
    <div style="display: none;"></div>
</div>

<div class="form-group" style="display: none;" id="editTemplate">
    <label class="col-sm-3 control-label" >标签名称</label>
    <button type="button" onclick="Label.fn.editFloor()" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> 编辑</button>
</div>

<!-- 配置文件 -->

</body>

<%@ include file="../inc/footer.jsp" %>
<script type="text/javascript">
    var x = 0;
    var y = 0;
    var z = 0;
    var topValue = 100;
    var Label = {
        v: {},
        fn: {
            init: function () {
                $.ajaxSetup({
                    async: false
                });

                //初始化已经添加的标签
                Label.fn.getLabels();

            },
            getLabels: function () {
                var labelList = ${labelList };
                if (labelList[0] !== null) {
                    $.each(labelList, function (i, item) {
                        Label.fn.insertLabel(item.labelId, item.leftPoint, item.topPoint, item.name);
                    });
                }
            },
            insertLabel: function (id, leftPoint, topPoint, name) {
                var tempDiv = $("#temp").clone();
                tempDiv.css("display", "block");
                tempDiv.attr("id", id);
                tempDiv.css("left", leftPoint + "px");
                tempDiv.css("top", topPoint + "px");
                tempDiv.css("background", "#ABF2BD");
                tempDiv.children(":first").html(name);

                tempDiv.hover(function () {
                    Label.fn.mouseover($(this));
                }, function () {
                    Label.fn.mouseout($(this));
                });
                $("#baseImg").append(tempDiv);

                Label.fn.addLabelEdit(name, id);

            },
            deleteLabel: function (self) {
                $leoman.alertConfirm("确定要删除这个标签吗？若删除，其对应的楼信息将一起删除",function(){
                    var labelId = $(self).parent().attr("id");
                    // 调用ajax函数实现删除标签操作
                    $.post("${contextPath}/admin/label/deleteLabel", {
                        labelId: labelId
                    }, function (result) {
                        if (result == 1) {
                            $(self).parent().remove();
                            $(".form-group[val="+labelId+"]").remove();
                        } else {
                            $leoman.alertMsg("请先拖到图片中再删除");

                        }
                    });
                });
            },
            mouseover: function (mouse) {
                $(mouse).children("a").fadeIn(300);
            },
            mouseout: function (mouse) {
                $(mouse).children("a").fadeOut(300);
            },
            addLabel: function () {
                var name = $("#labelInput").val();
                var tempDiv = $("#temp").clone();
                tempDiv.css("display", "block");
                var labelId = "tempDiv" + (new Date()).valueOf();
                tempDiv.attr("id", labelId);
                tempDiv.css("left", 755 + "px");
                tempDiv.css("top", topValue + "px");
                tempDiv.children(":first").html(name);
                $("#tempLabels").append(tempDiv);
                topValue = topValue + 40;
                if (topValue > $("#oldHeight").val() / 2) {
                    $("#panelBody").css("padding-bottom", (topValue - $("#oldHeight").val() / 2 - 40) + "px");
                }

                // 让所有的克隆出来的
                tempDiv.hover(function () {
                    Label.fn.mouseover($(this));
                }, function () {
                    Label.fn.mouseout($(this));
                });

//                Label.fn.addLabelEdit(name, labelId);

            },
            addLabelEdit : function(name, labelId){
                //添加完标签后，添加对应的编辑块
                var template = $("#editTemplate").clone().removeAttr("id");
                template.find("label").text(name);
                template.attr("val", labelId);
                template.find("button").attr("onclick","Label.fn.editFloor('"+labelId+"')");
                template.show();
                $("#labelEditDiv").append(template);
            },
            dragMove: function (self, e) {

                var _x, _y;//鼠标离控件左上角的相对位置
                $("#labelId").val($(self).attr("id"));
                var oldxx = parseInt($(self).css("left"));
                var oldyy = parseInt($(self).css("top"));
                var _move = true;
                _x = e.pageX - parseInt($(self).css("left"));
                _y = e.pageY - parseInt($(self).css("top"));
                $(self).fadeTo(20, 0.5);//点击后开始拖动并透明显示
                $(self).mousemove(function (e) {
                    if (_move) {
                        x = e.pageX - _x;//移动时根据鼠标位置计算控件左上角的绝对位置
                        y = e.pageY - _y;
                        $(self).css({top: y, left: x});//控件新位置
                    }
                });
                $(self).mouseup(function () {
                    if (parseInt($(self).offset().left) > ($("#mainImg").width() + parseInt($("#mainImg").offset().left) - parseInt($(self).width()) - 12) || parseInt($(self).offset().left) < parseInt($("#mainImg").offset().left) || parseInt($(self).offset().top) > ($("#mainImg").height() + parseInt($("#mainImg").offset().top) - parseInt($(self).height()) - 12) || parseInt($(self).offset().top) < parseInt($("#mainImg").offset().top)) {
                        $.post("${contextPath}/admin/label/queryLastPosition", {
                            //装视界id
                            objectId: $("#objectId").val(),
                            //标签id
                            labelId: $("#labelId").val()
                        }, function (result) {
                            if (result.leftPoint != "out") {
                                var oldx = parseInt(result.leftPoint);
                                var oldy = parseInt(result.topPoint);
                                $(self).css({top: oldy, left: oldx});
                            } else {
                                $(self).css({top: oldyy, left: oldxx});
                            }
                        });
                    } else {
                        //改变div颜色
                        $(self).css("background", "#ABF2BD");
                        $(self).css("opacity", "0.7");
                        //保存高度信息
                        var height = parseInt($(self).offset().top) - parseInt($("#mainImg").offset().top) + ($(self).height() + 12) / 2;
                        $("#height").html(height);
                        //保存宽度信息
                        var width = parseInt($(self).offset().left) - parseInt($("#mainImg").offset().left) + ($(self).width() + 12) / 2;
                        $("#width").val(width);
                        $("#left").val(parseInt($(self).css("left")));
                        $("#top").val(parseInt($(self).css("top")));
                        $("#name").val($(self).children(":first").html());

                        var newLeft = parseInt($(self).offset().left) - parseInt($("#mainImg").offset().left);
                        var newTop = parseInt($(self).offset().top) - parseInt($("#mainImg").offset().top)

                        //将标签位置信息保存在数据库
                        if (x != z) {
                            z = x;
                            Label.fn.saveLabelInfo(self, newLeft, newTop);
                        }
                    }

                    _move = false;
                    $(self).fadeTo("fast", 1);//松开鼠标后停止移动并恢复成不透明
                });
            },
            saveLabelInfo: function (self, newLeft, newTop) {
                $.ajax({
                    type: "post",
                    async: false,
                    url: '${contextPath}/admin/label/saveLabelInfo',
                    data: {
                        //来源对象id
                        objectId: $("#objectId").val(),
                        //标签id
                        labelId: $("#labelId").val(),
                        //标签名称
                        name: $("#name").val(),
                        //偏移高度(相对于原图)
                        height: $("#height").val() * 2,
                        //偏移宽度(想对于原图)
                        width: $("#width").val() * 2,
                        leftPoint: $("#left").val(),
                        topPoint: $("#top").val(),
                        newLeft: newLeft,
                        newTop: newTop,
                    },
                    dataType: "json",
                    success: function (result) {
                        if (result != 1) {
                            $leoman.alertMsg("操作失败!");
                        }else{
                            var name = $(self).find("div").text();
                            var labelId = $(self).attr("id");

                            if($('div[val="'+labelId+'"]').length == 0){
                                //成功之后，才添加编辑标签
                                Label.fn.addLabelEdit(name, labelId);
                            }
                        }
                    }
                });
            },
            /* 图片 */
            AddTempImg: function () {
                $('#tempImage').click();
            },
            //上传图片
            saveTempImage: function () {
                $("#tempImageForm").ajaxSubmit({
                    dataType: "json",
                    success: function (result) {
                        if(result.status == 0){
                            $("#mainImg").attr("src",result.data.image.uploadUrl);
                            $("#bigImageId").val(result.data.image.id);
                            $("#objectId").val(result.data.image.id);
                        }else {
                            $leoman.alertMsg("上传错误");
                        }
                    }
                });
            },
            editFloor : function(labelId){
                window.location.href = "${contextPath}/admin/house/ridgepole/editFloor/${house.id}_"+labelId;
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/index";
            }
        }
    }
    $(document).ready(function () {
        Label.fn.init();
    });
</script>


</html>