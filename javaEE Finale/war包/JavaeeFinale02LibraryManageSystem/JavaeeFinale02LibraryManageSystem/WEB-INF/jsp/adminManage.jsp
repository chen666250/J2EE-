<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>

<html>
<head>
    <title>管理员管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<c:import url="AdminHeader_act.jsp"/>
<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <c:if test="${messageAdminManage ne null}">
        <div class="alert alert-danger" role="alert"> ${messageAdminManage}</div>
    </c:if>
    <div class="container-fluid" style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
        <div class="row">
            <div class="col-xs-6 col-md-12">
                添加管理员
                <form method="post" action="${pageContext.request.contextPath}/AddAdmin">
                    <div class="form-group">
                        <label for="adminName">设置管理员名</label>
                        <input type="text" class="form-control" id="adminName" name="adminName" >
                    </div>
                    <div class="form-group">
                        <label for="password">设置密码</label>
                        <input type="password" class="form-control" id="password" name="password" >
                    </div>
                    <c:if test="${messageADD ne null}">
                        <div class="alert alert-success" role="alert"> ${messageADD}</div>
                    </c:if>
                    <button type="submit" class="btn btn-default">添加</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
