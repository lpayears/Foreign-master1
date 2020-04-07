<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/2/27
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--假装我是代码，代码一定要对齐，对齐，对齐！-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>国际业务管理系统</title>

    <script type="text/javascript" src="${cp}/js/jquery.js"></script>

    <link href="${cp}/css/button.css" rel="stylesheet" >
    <link href="${cp}/css/style.css" rel="stylesheet">
    <link href="${cp}/css/loader-style.css" rel="stylesheet" >
    <link href="${cp}/css/bootstrap.css" rel="stylesheet" >
    <script src="${cp}/js/layer.js" type="text/javascript"></script>

    <link rel="stylesheet"
          href="${cp}/js/tree/treetable/stylesheets/jquery.treetable.css">
    <link rel="stylesheet"
          href="${cp}/js/tree/treetable/stylesheets/jquery.treetable.theme.default.css">

    <link href="${cp}/js/tree/tabelizer/tabelizer.min.css" media="all"
          rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/js/respond.min.js"></script>


    <![endif]-->
</head>
<body>
<!-- TOP NAVBAR -->
<nav role="navigation" class="navbar navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <div id="logo-mobile" class="visible-xs">
                <h1>国际业务管理系统</h1>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->
</nav>

<!-- SIDE MENU -->
    <div id="skin-select">
        <div id="logo">
            <h1>
                国际业务管理系统
            </h1>
        </div>
    <div class="dark"></div>
    <div class="skin-part">
        <div id="tree-wrap">
            <div class="side-bar">
                <ul class="topnav menu-left-nest">
                    <li><a class="tooltip-tip ajax-load" href="${cp}/main"  title="index"><span>首页</span>

                    </a></li>
                    <shiro:hasRole name="0"  >

                    <li><a class="tooltip-tip ajax-load"
                           href="#" title="网点管理"
                            onclick=getUrl('${cp}/branch-management')><span>网点管理</span>
                    </a>
                    </li>
                    </shiro:hasRole>
                    <li>
                        <a class="tooltip-tip ajax-load" href="#"
                           title="人员管理"> <span>人员管理</span>

                    </a>
                        <ul>
                                <shiro:hasRole name="0">
                                <li><a class="tooltip-tip2 ajax-load"
                                       href="#"
                                       title="员工管理"
                                        onclick=getUrl('${cp}/admin-management')> <span>员工管理</span>
                                </a></li>
                                </shiro:hasRole>
                            <li><a class="tooltip-tip2 ajax-load"
                                   href="#"
                                   title="客户管理"
                                    onclick=getUrl('${cp}/client-management')> <span>客户管理</span>
                            </a></li>
                        </ul>
                    </li>
                    <shiro:hasAnyRoles name="0,1">
                    <li><a class="tooltip-tip ajax-load" href="#"
                           title="Dashboard"><span>预付货款管理</span>

                    </a>
                        <ul>

                            <li><a class="tooltip-tip ajax-load"
                                   href="#" title="新增预付"
                                   onclick=getUrl('${cp}/add-project')> <span>新增预付</span>

                            </a></li>

                            <li><a class="tooltip-tip "
                                   href="#"
                                   title="预付管理"
                                   onclick=getUrl('${cp}/project-management')> <span>预付管理</span>
                            </a></li>

                            <li><a class="tooltip-tip ajax-load"
                                   href="#" title="今日预警"
                                   onclick=getUrl('${cp}/project-warn')><span>今日预警</span> </a></li>

                            <li><a class="tooltip-tip ajax-load"
                                   href="#" title="逾期处置"  onclick=getUrl('${cp}/company-dispose')><span>逾期处置</span></a></li>

                            <li><a class="tooltip-tip ajax-load"
                                   title="报表管理"
                                   onclick=getUrl('${cp}/project-export')><span>报表管理</span></a></li>
                        </ul>
                    </li>
                    </shiro:hasAnyRoles>
                    <li><a class="tooltip-tip ajax-load" href="#"
                           title="Dashboard"><span>外汇账户管理系统</span>

                    </a>
                        <ul>
                            <li><a class="tooltip-tip "
                                   href="#"
                                   title="新增账户"
                                   onclick=getUrl('${cp}/add-company')> <span>新增账户</span>
                            </a></li>

                            <li><a class="tooltip-tip ajax-load"
                                   href="#" title="账户管理" onclick=getUrl('${cp}/company-management')><span>账户管理</span> </a></li>

                            <li><a class="tooltip-tip ajax-load"
                                   href="#" title="账户核查" onclick=getUrl('${cp}/company-check')><span>账户核查</span></a></li>

                            <li><a class="tooltip-tip ajax-load"
                                   href="#" title="报表管理"
                                   onclick=getUrl('${cp}/company-export')><span>报表管理</span></a></li>
                        </ul>
                    </li>


                    </li>


                </ul>


            </div>
        </div>
    </div>
    </div>

<!-- END OF SIDE MENU -->





</body>

</html>