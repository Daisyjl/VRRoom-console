<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li>
                <a href="admin/dashboard"><i class="fa fa-dashboard"></i> 控制面板</a>
            </li>


            <c:forEach items="${sessionScope.moduleList}" var="topModule">
                <li>
                    <a href="#"><i class="${topModule.moduleIcon}"></i> ${topModule.name}<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:forEach items="${topModule.subModuleList}" var="subModule">
                        <li>
                            <a href="${contextPath}${subModule.url}"><i class="${subModule.moduleIcon}"></i> ${subModule.name}</a>
                        </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
            <%--<li>
                <a href="#"><i class="fa fa-user fa-fw"></i>账户管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li >
                        <a href="admin/kuser/index"><i class="fa fa-user fa-fw"></i>会员列表</a>
                    </li>
                    <li >
                        <a href="admin/payrecord/index"><i class="fa fa-user fa-fw"></i>缴费列表</a>
                    </li>
                    <li >
                        <a href="admin/webpay/index"><i class="fa fa-user fa-fw"></i>网站收支</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-user fa-fw"></i>业务员管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li >
                        <a href="admin/saleman/index"><i class="fa fa-user fa-fw"></i>业务员列表</a>
                    </li>
                    <li >
                        <a href="admin/salemanrecord/index"><i class="fa fa-user fa-fw"></i>业务员记录列表</a>
                    </li>
                </ul>
            </li>--%>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->

