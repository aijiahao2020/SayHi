<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="login1">登录</a>
	<a href="register1">注册</a>
	<a href="index/search">查询</a>
	<h1>${requestScope.activities}</h1>
	<h2>${sessionScope.user}</h2>
	<h2>${requestScope.message}</h2>
</body>
</html>