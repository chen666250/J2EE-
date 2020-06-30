<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/9
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>
<html>
<head>
    <title>主页</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<c:import url="Header_act.jsp">

</c:import>

<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
<c:if test="${welcomeFlag==1}">
    <mytag:DisplayTag/>
  ${user.userName} ，这是你最新的动态：你有${RentCount}条正在租借的订单、${CheckingCount}条正在审核的订单、${DoneCount}条已完成订单。
</c:if>
    ${massageOrder}
    <c:if test="${userOrder!=null}">
        <table class="table table-condensed">这是你的订单,${userOrder.user.userName}
            <c:forEach items="${userOrder.orders}" var="order">
                <tr>
                    <td>单号:</td>
                    <td>书号：</td>
                    <td>书名：</td>
                    <td>时间：</td>
                    <td>状态：</td>
                </tr>
                <tr>
                    <td><c:out value="${order.orderId}"/></td>

                    <td><c:out value="${order.bookId}"/></td>

                    <td><c:out value="${order.bookName}"/></td>

                    <td><c:out value="${order.rentTime}"/></td>

                    <td><c:out value="${order.status}"/></td>

                </tr>

            </c:forEach>
        </table>
    </c:if>

    <c:if test="${books!=null}">
        <table class="table table-condensed">
            这是现有书库,${user.userName}
            <p><c:forEach items="${books}" var="book">
                <tr>
                    <td>书号：</td>
                    <td>书名：</td>
                    <td>状态：</td>
                </tr>
                <tr>
                    <td><c:out value="${book.bookId}"/></td>
                    <td><c:out value="${book.bookName}"/></td>
                    <td><c:out value="${book.status}"/>
                        <c:if test="${book.status eq 'STOCK'}">
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/addCart/${book.bookId}"
                               role="button">加入购物车</a>
                        </c:if></td>
                </tr>
                >
            </c:forEach>
            </p>
        </table>
        >
    </c:if>

</div>
>
</body>
</html>
