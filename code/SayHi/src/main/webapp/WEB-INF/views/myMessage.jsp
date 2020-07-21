<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>消息</title>
<style>
#top {
	border-bottom: solid;
	border-width: 2px;
	border-color: darkgray;
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
	margin-left: 1170px;
}

body {
	background-image: url(image/publish.png);
	background-position: 50px 50px;
	background-size: 1350px 330px;
	background-repeat: no-repeat;
}

#mid {
	width: 1130px;
	height: 550px;
	border: solid;
	border-top-color: #F7F7F7;
	border-bottom-color: #B1B1B1;
	border-left-color: #D3D3D3;
	border-right-color: #D3D3D3;
	margin-top: 330px;
	margin-left: 250px;
	margin-bottom: 100px;
	border-radius: 5px;
}

#mid_table1 {
	margin-left: 80px;
}

#th_bom {
	width: 100px;
	font-size: 16px;
	font-family: "PingFang SC";
	height: 30px;
}

#th_bom1:hover {
	background-color: #BFBFBF;
}

#th_bom1 {
	width: 100px;
	font-size: 16px;
	font-family: "PingFang SC";
	height: 50px;
	background: white;
}

#th_bom2 {
	width: 80px;
	font-size: 16px;
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
	margin-left: 120px;
	margin-top: 30px;
	border: solid;
	border-color: #FEEFE2;
	border-width: 1px;
	background-color: #FFF9F4;
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
	background-image: url(image/add.png);
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
	margin-left: 1000px;
	margin-top: 20px;
}

#mid_add_img {
	height: 100px;
	width: 100px;
}
</style>
</head>

<body>
	<div id="top">
		<a href="index"><img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"></a> <img
			src="static/image/ren.jpg" id="head_imag"> <a href=""><input
			value="退出" id="quit"></a>
		<div id="user">
			<p style="float: right;">
				<a href="myAttendingActiv">${sessionScope.user.userName}</a>
			</p>
		</div>

	</div>
	<div id="mid">
		<table id="mid_table1">
			<tr>
				<th id="th_bom1"><a href="myAttendingActiv">进行中的活动</a></th>
				<th id="th_bom"><a href="myFavoriteActiv">活动历史</a></th>
				<th id="th_bom"><a href="myUserInfo">我的账号</a></th>
				<th id="th_bom"><a href="myMessage">消息</a></th>
			</tr>
		</table>

		<c:if test="${empty requestScope.messages}">
					无消息
				</c:if>
		<c:if test="${!empty requestScope.messages}">
			<c:forEach items="${requestScope.messages }" var="messages">
				<div id="mid_msg">
					<div id="mid_msg_title">系统通知</div>
					<input id="mid_msg_delete" type="button" name="">
					<a href="delMessage/${messages.msgId }">删除</a>
					<div id="mid_msg_msg">${messages.messInfo }</div>
					${messages.messTime}
				</div>
			</c:forEach>
		</c:if>
		<div id="mid_add">
			<a href="toAddActiv"><img src="static/image/add.png" id="mid_add_img"></a>
		</div>
	</div>
</body>
</html>