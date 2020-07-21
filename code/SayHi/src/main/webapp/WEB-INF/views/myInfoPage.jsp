<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的账号</title>
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
	width: 100px;
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
	width: 900px;
	height: 400px;
	border: none;
	margin-left: 200px;
}

#mid_msg_button {
	float: right;
	background-color: white;
	color: #96B9C6;
	width: 50px;
	font-size: 16px;
	font-family: "PingFang SC";
	border: none;
	outline: none;
	margin-top: -70px;
	margin-right: 20px;
}

#mid_msg_head {
	margin-top: 100px;
	margin-left: 20px;
	font-size: 20px;
}

#mid_msg_head_img {
	margin-top: -60px;
	height: 80px;
	width: 80px;
	margin-left: 300px;
}

#mid_msg_num {
	margin-left: 20px;
	margin-top: 60px;
	font-size: 20px;
}

#mid_msg_name {
	margin-left: 20px;
	margin-top: 30px;
	font-size: 20px;
}

#mid_msg_tag {
	margin-left: 20px;
	margin-top: 30px;
	font-size: 20px;
}

#mid_msg_name_input {
	height: 30px;
	width: 300px;
	margin-left: 80px;
	outline: none;
	border-radius: 5px;
	border: solid;
	border-width: 1px;
	border-color: #A1A1A1;
}

#mid_add {
	margin-left: 800px;
}

#mid_add_img {
	height: 100px;
	width: 100px;
}

#mid_msg_tag_check {
	margin-left: 120px;
	margin-top: -27px;
	width: 300px;
}

#checkbox {
	margin-left: 30px;
}

body {
	font-family: "PingFang SC";
}
</style>
<script>
	function change() {
		var a = mid_msg_button.value;
		if (a == "修改")
			mid_msg_button.value = "保存";
		else
			mid_msg_button.value = "修改";

	}
</script>
</head>
<body>
	<div id="top">
		<a href="index"><img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"></a>
			 <img
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
		<div id="mid_msg">
			<form action="">
			<input type="submit" value="修改" id="mid_msg_button" onclick=change()
				name="">
			<div id="mid_msg_head">头像:</div>
			<img src="${requestScope.user.avatar}" id="mid_msg_head_img">
			<!-- <div><a ></a></div> -->
			<form action="updateAvatar" method="post" enctype="multipart/form-data">
				<input type="file" name="file">
			</form> 
			<div id="mid_msg_num">SayHi号:${requestScope.user.userId}</div>
			<div id="mid_msg_name">
				用户名: <input id="mid_msg_name_input" name="userName" value="${requestScope.user.userName}">
			</div>
			<div id="mid_msg_tag">
				兴趣标签:
				<c:if test="${empty requestScope.userLabels}">
					无标签
				</c:if>
				<c:if test="${!empty requestScope.userLabels}">
					<c:forEach items="${requestScope.userLabels }"
					var="userLabels">
						${userLabels.labelName}
					</c:forEach>
				</c:if>
				<!-- <div id="mid_msg_tag_check">
					<input type="checkbox" value="爬山" name="" id="checkbox"> 爬山
					<input type="checkbox" value="电影" name="" id="checkbox"> 电影
					<input type="checkbox" value="跑步" name="" id="checkbox"> 跑步
					<input type="checkbox" value="下水" name="" id="checkbox"> 下水
					<input type="checkbox" value="打架" name="" id="checkbox"> 打架
				</div> -->
			</div>
			</form>
			<div id="mid_add">
				<a href="toAddActiv"><img src="static/image/add.png" id="mid_add_img"></a>
			</div>
		</div>

	</div>
</body>
</html>