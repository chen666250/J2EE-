<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 7:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>

<html>
<head>
    <title>定单管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body style="overflow-y:scroll;">
<c:import url="AdminHeader_act.jsp"/>
<%--<a class="btn btn-default" href="${pageContext.request.contextPath}/adminShowBooks" role="button">查看书库</a>--%>
<%--<a class="btn btn-default" href="${pageContext.request.contextPath}/AddNEW" role="button">添加图书</a>--%>
<%--<a class="btn btn-default" href="${pageContext.request.contextPath}/userManage" role="button">用户管理</a>--%>
<%--<a class="btn btn-default" href="${pageContext.request.contextPath}/adminManage" role="button">维护管理员</a>--%>

<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
        <div class="col-lg-5" style="alignment: center">
            <form method="post" action="${pageContext.request.contextPath}/returnViaBookId">
                <div class="form-group">
                    <label for="bookId">快速还书，请输入bookId</label>
                    <p>${message}</p>
                    <input type="text" class="form-control" id="bookId" name="bookId" placeholder="请输入数字id" onkeyup="value=value.replace(/[^\d]/g,'')">
                </div>

                <button type="submit" class="btn btn-default">确认还书</button>
            </form>
        </div>
    ${massageOrder}
    <c:if test="${userOrders!=null}">
        <table class="table table-condensed">这是所有订单,${admin.adminName}
            <c:forEach items="${userOrders}" var="order">
                <tr>
                    <td>单号:</td>
                    <td>用户：</td>
                    <td>书号：</td>
                    <td>书名：</td>
                    <td>时间：</td>
                    <td>状态：</td>
                </tr>
                <tr>
                    <td><c:out value="${order.orderId}"/></td>
                    <td><c:out value="${order.userId}"/></td>
                    <td><c:out value="${order.bookId}"/></td>

                    <td><c:out value="${order.bookName}"/></td>

                    <td><c:out value="${order.rentTime}"/></td>

                    <td><c:out value="${order.status}"/>
                        <c:if test="${order.status eq 'CHECKING'}">
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/permit/${order.bookId}"
                               role="button">批准借阅</a>
                        </c:if>
                        <c:if test="${order.status eq 'RENT'}">
                            <form method="post" action="${pageContext.request.contextPath}/returnViaBookId">
                                <input type="hidden" name="bookId" value="${order.bookId}" >
                                <button type="submit" class="btn btn-default">确认还书</button>
                            </form>
                        </c:if>
                    </td>

                </tr>

            </c:forEach>
        </table>
    </c:if>


</div>
</body>
</html>
