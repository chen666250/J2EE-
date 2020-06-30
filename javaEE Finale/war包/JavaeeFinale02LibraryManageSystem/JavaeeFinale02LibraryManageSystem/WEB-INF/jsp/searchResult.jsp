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
    <title>图书搜索</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<c:import url="Header_act.jsp"/>
<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">


    <div class="col-lg-5" style="alignment: center">
        <form method="post" action="${pageContext.request.contextPath}/searchBookName">
            <div class="form-group">
                <label for="bookName">请输入书名</label>
                <input type="text" class="form-control" id="bookName" name="bookName">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

        <c:if test="${result!=null}">
            <table class="table table-condensed">这是搜索结果,${sessionScope.user.userName}
                <hr>
                    ${message}
                <c:forEach items="${result}" var="book">
                    <tr>
                        <td>书号：</td>
                        <td>书名：</td>
                    </tr>
                    <td><c:out value="${book.bookId}"/></td>

                    <td><c:out value="${book.bookName}"/></td>
                    <td><c:out value="${book.status}"/>
                    <c:if test="${book.status eq 'STOCK'}">
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/addCart/${book.bookId}"
                           role="button">加入购物车</a>
                    </c:if></td>
                    </tr>

                </c:forEach>
            </table>
        </c:if>
    </div><!-- /.col-lg-5 -->
</div><!-- /.row -->



</div>>

</body>
</html>