<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<style>
#top {
	border-bottom-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	height: 50px;
	width: 88%;
	margin-left: 10%;
}
#top1{
   padding-top: 120px;
}
img {
	height: 30px;
}

#login {
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	
	height: 430px;
	width: 40%;
	margin-left: 30%;
	margin-right: 30%;
	border-radius: 5px;
}

#logintop {
	border-style: solid;
	border-color: #5B91A5;
	border-width: 1px;
	height: 80px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
    background-color: #5B91A5;
}

#input1 {
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	border-radius: 5px;
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	height: 50px;
	margin-top: ;
	padding-left: 2%;
}

#button1 {
	margin-left: 5%;
	margin-top: 5%;
	width: 15%;
	height: 30px;
	background-color: #d8d8d8;
	cursor: pointer;
	color: white;
	border-radius: 5px;
	outline: 0;
	font-size: 16px;
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	font-family: "PingFang SC";
}
#button1:hover{
     background-color:  #5B91A5;
}
h1 {
	font-family: "PingFang SC";
	color: white;
}
</style>
</head>
<body>

<div id="top1">
	<div id="login">
		<div id="logintop">
			<h1 style="padding-left: 5%">登录</h1>
		</div>
		<div id="loginbottom">
			<form action="login" method="post">
				<div id="user">
					<h3 style="padding-left: 5%; margin-top: 5%;">账号:</h3>
					<input type="text" name="userName" id="input1">
				</div>
				<div id="psw">
					<h3 style="padding-left: 5%; margin-top: 5%;">密码:</h3>
					<input type="password" name="password" id="input1">
				</div>
				<div id="button">
					<input type="submit" value="登录" id="button1">
					<c:if test="${!empty requestScope.message }">
						<font color="red">${requestScope.message }</font>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>