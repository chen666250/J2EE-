<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/11
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>

<html>
<head>
    <title>cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<c:import url="Header_act.jsp" />
<div class="container-fluid" style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
<%--    <c:if test="${cart eq null}">--%>
<%--    你的购物车是空的--%>
<%--    </c:if>--%>
    <c:if test="${cart.books eq null}">
        你的购物车是空的
    </c:if>
    <c:if test="${cart.books!=null}">
        <table class="table table-condensed">这是你的购物车,${sessionScope.user.userName}
            <hr>

            <c:forEach items="${cart.books}" var="book">
                <tr>
                    <td>书号：</td>
                    <td>书名：</td>
                </tr>
                <td>  <c:out value="${book.bookId}"/></td>>
                <td>  <c:out value="${book.bookName}"/></td>>
                <td><a class="btn btn-default" href="${pageContext.request.contextPath}/confirm/${book.bookId}" role="button">确认借阅</a>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/cancel/${book.bookId}" role="button">取消</a></td>
                </tr>

            </c:forEach>
        </table>
    </c:if>
</div>>

</body>
</html>