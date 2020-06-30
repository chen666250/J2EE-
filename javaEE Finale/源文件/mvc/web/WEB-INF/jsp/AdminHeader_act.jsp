<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <title>Action</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/img/error.jpg" height="80" width="80"><br>
<em><strong>welcome 管理员 ${admin.adminName}</strong> </em>
<a class="btn btn-default" href="${pageContext.request.contextPath}/adminLogout" role="button">退出登录</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/admin" role="button">返回首页</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/Orders" role="button">当前订单管理</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/adminShowBooks" role="button">查看书库</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/AddNEW" role="button">添加图书</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/userManage" role="button">用户管理</a>
<a class="btn btn-default" href="${pageContext.request.contextPath}/adminManage" role="button">维护管理员</a>

</body>

</html>