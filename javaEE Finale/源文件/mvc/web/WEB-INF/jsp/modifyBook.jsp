<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="MyFirstTag" prefix="mytag" %>
<html>
<head>
    <title>修改图书</title>
</head>
<body>
<c:import url="AdminHeader_act.jsp"/>

<div class="container-fluid"
     style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
    <div class="container-fluid" style="margin-left: 80px ;margin-top: 40px;margin-right: 80px;background-color: cornflowerblue">
        <div class="row">
            <div class="col-xs-6 col-md-12">
                <form method="post" action="${pageContext.request.contextPath}/modifyThis">
                    <div class="form-group">
                        <input type="hidden" name="bookId" value="${Book.bookId}" >
                        <label for="bookName">设置书名</label>
                        <input type="text" class="form-control" id="bookName" name="bookName" value="${Book.bookName}">
                    </div>
                    <div class="form-group">
                        <label for="describes">设置描述</label>
                        <input type="text" class="form-control" id="describes" name="describes"  value="${Book.describes}" >
                    </div>
                    <c:if test="${messageModify ne null}">
                        <div class="alert alert-success" role="alert"> ${messageModify}</div>
                    </c:if>
                    <button type="submit" class="btn btn-default">修改</button>
                </form>
            </div>
        </div>
    </div>



</div>
</body>
</html>
