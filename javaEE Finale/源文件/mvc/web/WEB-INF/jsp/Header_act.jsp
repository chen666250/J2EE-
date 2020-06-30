<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Action</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/img/cola.jpg" height="80" width="80"><br>
<em><strong>welcome ${sessionScope.user.userName} to our library</strong> </em>
<a class="btn btn-default" href="${pageContext.request.contextPath}/Logout" role="button">退出登录</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/MyOrders" role="button">我的订单</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/showBooks" role="button">查看书库</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/shopCart" role="button">购物车</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/searchBook" role="button">查询书籍</a>

</body>

</html>