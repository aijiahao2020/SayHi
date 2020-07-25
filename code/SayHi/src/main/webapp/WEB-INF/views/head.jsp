<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
#top {
	border-bottom: none;
	border-width: 2px;
	border-color: darkgray;
	position:fixed;
	width:100%;
	background-color:white;
	z-index:999;
	margin-top:0px;
}

#head_img{
  height:30px;
  width:30px;
  float:right;
  border-radius:50%; 
	overflow:hidden;
	margin-top:7px;
	margin-right:5px;
}
#loginbutton {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 16px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 1%;
	margin-top:10px;
}

#registerbutton {
	cursor: pointer;
	color: black;
	outline: 0;
	background: white;
	font-size: 16px;
	border-left: solid;
	border-right: none;
	border-top: none;
	border-bottom: none;
	border-width: 1px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 3%;
	padding-left: 1%;
	margin-top:10px;
}
a{
 text-decoration:none;
  color:black;
}

</style>
</head>

<body>
<div id="top">
		<a href="${APP_PATH }/index"><img alt="" src="${APP_PATH }/static/image/SayHi.png"
			style="margin-top: 10px; margin-left: 20px; height: 45px;"></a>
		<c:if test="${empty sessionScope.user}">
			<a href="${APP_PATH }/register1" id="registerbutton">注册</a>
			<a href="${APP_PATH }/login1" id="loginbutton">登录</a>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="${APP_PATH }/logout" id="registerbutton">退出</a>
			 
			<a href="${APP_PATH }/myAttendingActiv" id="loginbutton">${sessionScope.user.userName}</a>
		<a href="${APP_PATH }/myAttendingActiv"><img alt="" src="${sessionScope.user.avatar}" id="head_img"></a>
		</c:if>
	</div>
</body>
</html>