<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片测试</title>
</head>
<body>

	<%-- <form:form action="/upload" method="post" commandName="userDto" 
	enctype="multipart/form-data" modelAttribute="userDto">
	用户名：<form:input path="user.userName"/>
	密码：  <form:password  path=".user.password"/>
	头像：  <form:input type="file" path="multipartFile"/>
	</form:form> --%>

	<form action="upload" method="post" enctype="multipart/form-data">
		<label>用户名：</label><input type="text" name="userName"><br> 
		<label>密码：</label><input
			type="password" name="password"><br>
			 <label>上传头像：</label><input
			type="file" name="file"><br> <input type="submit">
	</form>


</body>
</html>