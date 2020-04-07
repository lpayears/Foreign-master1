<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/3/16
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${cp}/js/jquery.js"></script>
    <script type="text/javascript" src="${cp}/js/bootstrap.js"></script>
    <link href="${cp}/css/bootstrap.css" rel="stylesheet" >
</head>
<body>
<div class="login-div">
    <form class="form-horizontal" id="login-form" method="post">
        <div class="form-group">
            <label  class="col-sm-2 control-label">身份证号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="code"
                       placeholder="username">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button id="submit" class="btn btn-primary" type="button">登录</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            $.ajax({
                url: '${cp}/login',
                method: 'post',
                async: false,
                data: $("#login-form").serialize(),
                success: function (result) {
                    //失败处理
                    if (result.code == 200) {
                        alert(result.msg);
                        return;
                    }
                    //成功进行跳转
                    window.location.href = "${cp}/main";
                }
            })
        })
    })
</script>
</body>
</html>
