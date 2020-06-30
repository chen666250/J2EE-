<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/10
  Time: 22:47
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
<c:import url="AdminHeader_act.jsp"/>

<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <div class="col-lg-5" style="alignment: center">
        <form method="post" action="${pageContext.request.contextPath}/returnViaBookId">
            <div class="form-group">
                <c:if test="${massagePermit ne null}">
                    <div class="alert alert-success" role="alert"> ${massagePermit}</div>
                </c:if>
                <label for="bookId">快速还书，请输入bookId</label>
                <input type="text" class="form-control" id="bookId" name="bookId" placeholder="请输入数字id" onkeyup="value=value.replace(/[^\d]/g,'')">
            </div>

            <button type="submit" class="btn btn-default">确认还书</button>
        </form>
    </div>

    <c:if test="${books!=null}">
        这是现有图书,${admin.adminName}
        <table class="table table-condensed">
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>书号：</td>
                    <td>书名：</td>
                    <td>描述：</td>
                    <td>状态：</td>
                </tr>
                <tr>
                    <td><c:out value="${book.bookId}"/></td>
                    <td><c:out value="${book.bookName}"/></td>
                    <td><c:out value="${book.describes}"/></td>
                    <td><c:out value="${book.status}"/>
                        <c:if test="${book.status eq 'STOCK'}">
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/remove/${book.bookId}"
                           role="button">删除图书</a>
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/Modify/${book.bookId}"
                               role="button">修改图书信息</a>
                        </c:if>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>


</div>
</body>
</html>
