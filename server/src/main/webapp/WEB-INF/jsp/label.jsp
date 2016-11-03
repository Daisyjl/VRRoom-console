<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <title>编辑标签</title>
    <%@ include file="inc/new2/css.jsp" %>

    <style type="text/css">
        /*模块拖拽*/
        .drag {
            position: absolute;
            width: 50px;
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

<body class="sticky-header">

<section>
    <%@ include file="inc/new2/menu.jsp" %>
    <!-- main content start-->
    <div class="main-content">
        <%@ include file="inc/new2/header.jsp" %>
        <!--body wrapper start-->

        <section class="wrapper">
            <!-- page start-->

            <input id="objectId" type="hidden" value="${image.id }">
            <%--<input id="ridgepoleId" type="hidden" value="1">--%>
            <input id="labelId" type="hidden" value="">
            <input id="height" type="hidden" value="">
            <input id="width" type="hidden" value="">
            <input id="left" type="hidden" value="">
            <input id="top" type="hidden" value="">
            <input id="name" type="hidden" value="">

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            编辑标签
                        </header>
                        <div class="panel-body" id="panelBody">

                            <form class="cmxform form-horizontal adminex-form" id="formId" method="post" >

                                <div class="form-group">
                                    <div class="col-sm-3">
                                        <button type="button" onclick="Label.fn.back()" class="btn btn-primary"><i class="fa fa-reply"></i> 返回</button>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label">操作提示：</label>
                                    <label class="col-sm-6 control-label" style="text-align: left">
                                        输入房间号后，点击添加标签，移动生成的标签至图上的对应的房间位置，如下图即可
                                    </label>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-1 control-label">示例图：</label>
                                    <div class="col-sm-3">
                                        <img src="${contextPath}/static/images/label_demo.png" style="width: 300px;height: 150px;">
                                    </div>
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
                                        <img id="mainImg" style="position: relative;" src="${image.uploadUrl }"/>
                                        <div id="baseImg"></div>
                                    </div>

                                    <div class="">
                                        <div id="tempLabels" style="border: 1px;"></div>
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

    <!-- 隐藏区域--标签 -->
    <div id="temp" style="display: none;" class="drag" onmousedown="Label.fn.dragMove(this,event)">
        <div></div>
        <a href="javascript:void(0);" style="float: none; z-index: 10; position: relative; bottom: 22px; left: 33px;display: none;" onclick="Label.fn.deleteLabel(this)">
            <img id="pic1" src="${contextPath}/static/images/xx.png" style="height: 16px; width: 16px; display: inherit;" border="1"/>
        </a>
        <div style="display: none;"></div>
    </div>

    <div class="form-group" style="display: none;" id="editTemplate">
        <label class="col-sm-3 control-label" >标签名称</label>
        <button type="button" onclick="Label.fn.editFloor()" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> 编辑</button>
    </div>

</section>
<%@ include file="inc/new2/foot.jsp" %>
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

            },
            deleteLabel: function (self) {
                var labelId = $(self).parent().attr("id");
                // 调用ajax函数实现删除标签操作
                $.post("${contextPath}/admin/label/deleteLabel", {
                    labelId: labelId
                }, function (result) {
                    if (result == 1) {
                        $(self).parent().remove();
                    } else {
                        $leoman.alertMsg("请先拖到图片中再删除");

                    }
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

                Label.fn.addLabelEdit(name, labelId);

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
                        $("#height").v
                        //保存宽度信息al(height);
                        var width = parseInt($(self).offset().left) - parseInt($("#mainImg").offset().left) + ($(self).width() + 12) / 2;
                        $("#width").val(width);
                        $("#left").val(parseInt($(self).css("left")));
                        $("#top").val(parseInt($(self).css("top")));
                        $("#name").val($(self).children(":first").html());

                        //将标签位置信息保存在数据库
                        if (x != z) {
                            z = x;
                            Label.fn.saveLabelInfo();
                        }
                    }

                    _move = false;
                    $(self).fadeTo("fast", 1);//松开鼠标后停止移动并恢复成不透明
                });
            },
            saveLabelInfo: function () {
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
                        //数据来源
//                        ridgepoleId: $('#objectType').val(),
                        //偏移高度(相对于原图)
                        height: $("#height").val() * 2,
                        //偏移宽度(想对于原图)
                        width: $("#width").val() * 2,
                        leftPoint: $("#left").val(),
                        topPoint: $("#top").val(),
                    },
                    dataType: "json",
                    success: function (result) {
                        if (result != 1) {
                            $leoman.alertMsg("操作失败!");
                        }
                    }
                });
            },
            back : function(){
                window.location.href = "${contextPath}/admin/house/floor/editType/${houseId}";
            }
        }
    }
    $(document).ready(function () {
        Label.fn.init();
    });
</script>
</body>
</html>
