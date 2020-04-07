<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/2/28
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<!-- 中间内容 -->

<!-- 控制栏 -->
	<jsp:include page="include/sidebar.jsp"/>
			<!--  PAPER WRAP -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="main">
<div class="wrap-fluid">
				<div class="container-fluid paper-wrap bevel tlbr">


					<!-- CONTENT -->
					<!--TITLE -->
					<div class="row">
						<div id="paper-top">


							<div class="col-sm-7">
								<div class="devider-vertical visible-lg"></div>

							</div>
							<div class="col-sm-2">
								<div class="devider-vertical visible-lg"></div>


							</div>
						</div>
					</div>
					<!--/ TITLE -->

					<!-- BREADCRUMB -->
					<ul id="breadcrumb">
						<li><a href="#" title="Sample page 1">首页</a></li>
					</ul>

					<!-- END OF BREADCRUMB -->



					<!-- END OF BREADCRUMB -->

					<!-- /END OF CONTENT -->


					<!-- FOOTER -->
					<div class="footer-space"></div>
					<div id="footer">
						<div class="devider-footer-left"></div>
						<div class="time">
							<p id="spanDate">
							<p id="clock">
						</div>


					</div>
					<!-- / END OF FOOTER -->

				</div>
			</div>
			<!--  END OF PAPER WRAP -->
</div>
<script type="text/javascript" src="${cp}/js/preloader.js"></script>
<script type="text/javascript" src="${cp}/js/bootstrap.js"></script>
<script type="text/javascript" src="${cp}/js/app.js"></script>
<script type="text/javascript" src="${cp}/js/load.js"></script>
<script type="text/javascript" src="${cp}/js/main.js"></script>
<script src="${cp}/js/tree/jquery.treeview.js" type="text/javascript"></script>


<script src="${cp}/js/tree/lib/jquery.cookie.js"
		type="text/javascript"></script>

<script src="${cp}/js/tree/tabelizer/jquery-ui-1.10.4.custom.min.js"></script>
<script src="${cp}/js/tree/tabelizer/jquery.tabelizer.js"></script>

<script src="${cp}/js/tree/treetable/vendor/jquery-ui.js"></script>
<script
		src="${cp}/js/tree/treetable/javascripts/src/jquery.treetable.js"></script>
<script type="text/javascript">
function getUrl(url)
{
	$('main').empty();
	var main = document.getElementById('main');
	main.innerHTML = "<iframe border='none' style='border:0; padding:15px' scrolling='no' width='100%' height='1000px' src='" + url + "'></iframe>";
}
</script>
</body>
</html>