<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/8
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>

<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<!-- Stack the columns on mobile by making one full-width and the other half-width -->
<div class="row">
    <div class="col-xs-12 col-md-12"><c:import url="Header_ins.jsp"/> 本网页已被点击
        <mark><mytag:CounterTag/></mark>
        次！
    </div>
</div>
<!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <div class="row">

        <div class="col-xs-6 col-md-12">
            <form method="post" action="${pageContext.request.contextPath}/login">
                <div class="form-group">
                    <label for="userName">用户名</label>
                    <input type="text" class="form-control" id="userName" name="userName"
                           value="${cookie.get("userName").value}">
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" id="password" name="passWord">
                </div>
                <c:if test="${message ne null}">
                    <div class="alert alert-danger" role="alert"> ${message}</div>
                </c:if>

                <button type="submit" class="btn btn-default">登录</button>
            </form>
        </div>


        <!-- Columns are always 50% wide, on mobile and desktop -->
        <div class="row">
            <div class="col-xs-3"><p>

                <c:if test="${message2 ne null}">
                    <div class="alert alert-success" role="alert"> ${message2}</div>
                </c:if>

                <c:if test="${message2==null}">
                    没有账号？ 现在注册!
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/signUp" role="button">前往注册</a>
                </c:if></div>
            <div class="col-xs-3">
                管理员大爷 这边请！
                <a class="btn btn-default" href="${pageContext.request.contextPath}/admin" role="button">管理员入口</a>
            </div>
        </div>
    </div>
</body>
</html>
