<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/9
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<div class="row">
    <div class="col-xs-12 col-md-12"><c:import url="Header_ins.jsp"/> 本网页已被点击<mark><mytag:CounterTag/></mark>次！</div>
</div>
<a class="btn btn-default" href="${pageContext.request.contextPath}/" role="button">返回首页</a>
<div class="container-fluid" style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <div class="row">
        <div class="col-xs-6 col-md-12">
            <form method="post" action="${pageContext.request.contextPath}/signMeUp">
                <div class="form-group">
                    <label for="userName">设置用户名</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${cookie.get("userName").value}">
                </div>
                <div class="form-group">
                    <label for="password">设置密码</label>
                    <input type="password" class="form-control" id="password"  name="passWord">
                </div>
                <p>${message}</p>
                <button type="submit" class="btn btn-default">注册</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
