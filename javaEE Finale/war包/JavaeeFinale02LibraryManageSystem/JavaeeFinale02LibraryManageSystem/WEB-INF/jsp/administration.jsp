<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/9
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>
<html>
<head>
    <title>管理员界面</title>
</head>
<body>
<c:import url="Header_ins.jsp"/>
<div class="container-fluid" style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <div class="col-xs-6 col-md-12">
        <form method="post" action="${pageContext.request.contextPath}/Adminlogin">
            <div class="form-group">
                <label for="adminName">管理员名</label>
                <input type="text" id="adminName" name="adminName" >
            </div>

            <div class="form-group">
                <label for="adminPassword">密码</label>
                <input type="password" name="adminPassword" id="adminPassword">
            </div>
            <c:if test="${message ne null}">
                <div class="alert alert-danger" role="alert"> ${message}</div>
            </c:if>
            <input type="submit" name="btn_submit" value="管理员登录">
            <input type="reset" name="btn_reset" value="Reset">

        </form>
    </div>
</div>


</body>
</html>
