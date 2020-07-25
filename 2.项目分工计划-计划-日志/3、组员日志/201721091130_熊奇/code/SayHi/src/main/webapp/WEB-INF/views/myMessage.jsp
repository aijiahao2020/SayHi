<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="head.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>消息</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			var flag = confirm("确定要删除该消息吗？");
			return flag;
		});
	});
</script>
<style>
a {
	text-decoration: none;
	color: black;
}

#top {
	border:none;
	border-width: 2px;
	border-color: darkgray;
	margin-top:-8px;
	background:transparent;
	position:static;
}

#quit {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 14px;
	color: gray;
	font-family: "PingFang SC";
	margin-right: 100px;
	margin-top: 14px;
	float: right;
	width: 50px;
}

#user {
	margin-right: 1%;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
}

#head_imag {
	height: 30px;
	width: 30px;
	float: right;
	border-radius: 50%;
	overflow: hidden;
	margin-top: 7px;
	margin-right: 5px;
}

body {
	background-image: url(image/publish.png);
	background-position: 50px 50px;
	background-size: 1350px 330px;
	background-repeat: no-repeat;
}
#imag{
  width:1150px;
   height:330px;
   margin-top:-55px;
   margin-left:150px;
}
#mid1{
   width: 1180px;
    min-height:550px;
   height:auto;
    border: solid;
	border-top-color: #F7F7F7;
	border-bottom-color: #B1B1B1;
	border-left-color: #D3D3D3;
	border-right-color: #D3D3D3; 
	   margin-left: 170px;
	margin-bottom: 100px;
	border-radius: 10px;
	margin-top:15px;
	float:left;
}

#mid_table1 {
	margin-left: 80px;
}

#th_bom {
	width: 120px;
	font-size: 17px;
	font-family: "PingFang SC";
	height: 30px;
}

#th_bom:hover {
	background-color: #BFBFBF;
}

#th_bom1 {
	width: 120px;
	font-size: 17px;
	font-family: "PingFang SC";
	height: 50px;
	background: #5B91A5;
	border-style: solid;
	border-color: #5B91A5;
	border-width: 1px;
	color: white;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#mid_msg {
	width: 850px;
	height: 150px;
	margin-left: 90px;
	margin-top: 30px;
	border: solid;
	border-color: #FEEFE2;
	border-width: 1px;
	background-color: #FFF9F4;
	border-radius: 5px
}

#mid_msg_title {
	width: 500px;
	height: 40px;
	margin-top: 15px;
	margin-left: 30px;
	border-bottom: solid;
	border-color: #D3CCCB;
	border-width: 1px;
	font-size: 20px;
	padding-left: 35px;
	font-family: "PingFang SC";
}

#mid_msg_delete {
	background-position: 0px 0px;
	background-size: 20px 20px;
	background-repeat: no-repeat;
	width: 20px;
	height: 20px;
	float: right;
	margin-top: -40px;
	margin-right: 20px;
	border: none;
	outline: none;
}

#mid_msg_msg {
	width: 500px;
	height: 40px;
	margin-top: 20px;
	margin-left: 65px;
	font-size: 16px;
	font-family: "PingFang SC";
}

#mid_add {
	right: 380px;
	position: fixed;
	z-index: 999;
	bottom: 50px;
}

#mid_add_img {
	height: 80px;
	width: 80px;
}
#black{
  width:100%;
background-color:#F5F9FA;
  height:200px;
  margin-top:250px;
  float:left;
}
</style>
</head>

<body>
	<%-- <div id="top">
		<a href="index"><img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"></a> 
			 <a href=""><input value="退出" id="quit"></a>
		<div id="user">
			<p style="float: right;">
				<a href="myAttendingActiv">${sessionScope.user.userName}</a>
			</p>
		</div>
       <img src="${sessionScope.user.avatar}" id="head_imag">
	</div> --%>

	<img src="static/image/publish.png" id="imag">
    <div id="mid1">
	<div id="mid">
		<table id="mid_table1">
			<tr>
				<th id="th_bom"><a href="${APP_PATH }/myAttendingActiv">进行中的活动</a></th>
				<th id="th_bom"><a href="${APP_PATH }/myFavoriteActiv">活动历史</a></th>
				<th id="th_bom"><a href="${APP_PATH }/myUserInfo">我的账号</a></th>
				<th id="th_bom1"><a href="${APP_PATH }/myMessage" style="color:white">消息</a></th>
			</tr>
		</table>

		<c:if test="${empty requestScope.messages}">
			<div style="margin-left: 550px; font-size: 20px; padding-top: 150px;color:#A4A4A4">无消息</div>
		</c:if>
		<c:if test="${!empty requestScope.messages}">
			<c:forEach items="${requestScope.messages }" var="messages">
				<div id="mid_msg">
					<div id="mid_msg_title">系统通知</div>
					<div id="mid_msg_delete"> <a style="color:darkgray;" class="delete"	href="${APP_PATH }/delMessage/${messages.msgId }">X</a></div>
					<div id="mid_msg_msg">${messages.messInfo }</div>
					<div style="margin-left: 65px"><fmt:formatDate value="${messages.messTime}" pattern="yyyy-MM-dd hh:mm:ss" /></div>
				</div>
			</c:forEach>
		</c:if>
		</div>
		<div id="mid_add">
			<a href="toAddActiv"><img src="${APP_PATH }/static/image/add.png"
				id="mid_add_img"></a>
		</div>
	</div>
	
	<div id="black"></div>
</body>
</html>