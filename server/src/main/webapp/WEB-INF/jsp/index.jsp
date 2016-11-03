<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 2015/3/3
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>控制面板</title>
    <%@ include file="inc/css.jsp" %>
</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">控制面板</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">

            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="alert alert-success" id="weather" style="display:none">
                            <p class="text-capitalize">
                                <span id="basic_city" class="text-primary"></span>，天气<span id="now_cond_txt" class="text-primary"></span>,
                                <span id="now_wind" class="text-primary"></span>,
                                当前温度:<span id="now_tmp" class="text-primary"></span>℃,
                                空气质量<span id="aqi_city_qlty" class="text-primary"></span>, PM2.5<span id="aqi_city_pm25" class="text-primary"></span>。
                                <span id="suggestion_sport_txt"></span>

                            </p>
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

<%@ include file="inc/footer.jsp" %>
</body>

<script type="text/javascript">

    $health.ajax("gen/weather",null,function(result){
        var data = result["HeWeather data service 3.0"][0];
        $("#weather").show();
        $("#basic_city").text(data.basic.city);
        $("#now_cond_txt").text(data.now.cond.txt);
        $("#now_tmp").text(data.now.tmp);
        $("#now_wind").text(data.now.wind.dir+""+data.now.wind.sc+"级");
        $("#aqi_city_qlty").text(data.aqi.city.qlty);
        $("#aqi_city_pm25").text(":"+data.aqi.city.pm25);
        $("#suggestion_sport_txt").text(data.suggestion.sport.txt);

    })

</script>


</html>