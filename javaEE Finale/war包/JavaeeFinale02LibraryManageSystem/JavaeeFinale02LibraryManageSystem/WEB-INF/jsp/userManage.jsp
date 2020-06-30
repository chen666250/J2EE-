<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>

<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body>
<c:import url="AdminHeader_act.jsp"/>
<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <div class="col-lg-5" style="alignment: center">
        <form method="post" action="${pageContext.request.contextPath}/searchUserViaUserId">
            <div class="form-group">
                <label for="userId">查询用户 请输入用户id</label>
                <p>${Amessage}</p>
                <input type="text" class="form-control" id="userId" name="userId" placeholder="请输入数字id" onkeyup="value=value.replace(/[^\d]/g,'')">
            </div>

            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>
    <c:if test="${Auser ne null}">
    <table class="table table-condensed">
        <tr>
            <td>用户id:</td>
            <td>用户名：</td>
            <td>用户状态：</td>

        </tr>
        <tr>
            <td>${Auser.userId}</td>
            <td>${Auser.userName}</td>
            <td>${Auser.userStatus}
                <c:if test="${Auser.userStatus eq 'LIVE'}">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/block/${Auser.userId}"
                       role="button">封禁用户</a>
                </c:if>
                <c:if test="${Auser.userStatus eq 'BLOCK'}">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/Unblock/${Auser.userId}"
                       role="button">解封用户</a>
                </c:if>

<%--                <a class="btn btn-default" href="${pageContext.request.contextPath}/addNote/${Auser.userId}"--%>
<%--                   role="button">设置备注</a>--%>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/removeUser/${Auser.userId}"
                   role="button">移除用户</a>
            </td>

        </tr>

    </table>
    </c:if>
    <c:if test="${massageUser ne null}">
        <div class="alert alert-danger" role="alert"> ${massageUser}</div>
    </c:if>
    <c:if test="${users!=null}">

        <table class="table table-condensed">这是所有用户,${admin.adminName}
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>用户id:</td>
                    <td>用户名：</td>
                    <td>用户状态：</td>

                </tr>
                <tr>
                    <td><c:out value="${user.userId}"/></td>
                    <td><c:out value="${user.userName}"/></td>
                    <td><c:out value="${user.userStatus}"/>
                        <c:if test="${user.userStatus eq 'LIVE'}">
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/block/${user.userId}"
                               role="button">封禁用户</a>
                        </c:if>
                        <c:if test="${user.userStatus eq 'BLOCK'}">
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/Unblock/${user.userId}"
                               role="button">解封用户</a>
                        </c:if>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/removeUser/${user.userId}"
                           role="button">移除用户</a>
                    </td>


                </tr>

            </c:forEach>
        </table>
    </c:if>


</div>
</body>
</html>
