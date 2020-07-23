<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>他人视角</title>
<style>
body {
	font-family: "PingFang SC";
}

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

#mid {
	height: 400px;
	width: 1000px;
	margin-left: 200px;
	margin-top: 100px;
}

#mid_head {
	height: 300px;
	width: 250px;
	margin-top: -20px;
	float: left;
}

#mid_name {
	margin-left: 400px;
	margin-top: 50px;
	font-size: 25px;
}

#mid_num {
	margin-left: 400px;
	margin-top: 20px;
	font-size: 20px;
}

#mid_hab {
	margin-left: 400px;
	margin-top: 20px;
	font-size: 20px;
}

#mid_tags {
	margin-left: 10px;
	margin-top: 20px;
}

#mid_tag {
	width: 50px;
	padding-left: 20px;
	height: 25px;
	font-size: 15px;
	border: solid;
	border-width: 1px;
	border-radius: 5px;
	margin-right: 30px;
	float: left;
}

#bottom_joined {
	border-top: solid;
	border-width: 2px;
	font-size: 20px;
	margin-left: 200px;
	margin-top: -50px;
	width: 170px;
	height: 20px;
	border-color: #5B91A5;
	padding-left: 20px;
}

#s {
	margin-left: 200px;
}

#mid_act1 {
	margin-right: 60px;
	margin-top: 50px;
	margin-bottom: 50px;
	float: left;
}

#img_a {
	height: 140px;
	width: 250px;
}

#img_1 {
	height: 20px;
	width: 20px;
	position: absolute;
}

#img_2 {
	height: 20px;
	width: 20px;
	position: absolute;
	margin-left: 15px;
}

#img_3 {
	height: 20px;
	width: 20px;
	position: absolute;
	margin-left: 30px;
}

h4 {
	margin-top: 10px;
	color: #9A8A72;
	font-size: 14px;
	font-family: "PingFang SC";
}

h3 {
	margin-top: -8px;
	font-size: 15px;
	font-family: "PingFang SC";
}

#num {
	margin-left: 70px;
	font-size: 15px;
	color: #767676;
}
</style>
</head>
<body>
	<div id="top">
		<img alt="" src="../static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;">
		<c:if test="${empty sessionScope.user}">
			<a href="register1" id="registerbutton">注册</a>
			<a href="login1" id="loginbutton">登录</a>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="logout" id="registerbutton">退出</a>
			<img alt="" src="${sessionScope.user.avatar}" style="size: 10px ">
			<a href="myAttendingActiv" id="loginbutton">${sessionScope.user.userName}</a>
		</c:if>
		</div>

	</div>

	<div id="mid">
		<img src="${requestScope.user1.avatar }" id="mid_head">
		<div id="mid_name">${requestScope.user1.userName }</div>
		<div id="mid_num">SayHi号：${requestScope.user1.userId }</div>
		<div id="mid_hab">
			兴趣爱好：
			<div id="mid_tags">
				<c:if test="${empty requestScope.userLabels}">
					<div id="mid_tag">无兴趣</div>
				</c:if>
				<c:if test="${!empty requestScope.userLabels}">
					<c:forEach items="${requestScope.userLabels }" var="userLabels">
						<div id="mid_tag">${userLabels.labelName}</div>
					</c:forEach>
				</c:if>
			</div>

		</div>
		<div id="bottom">
			<div id="bottom_joined">正在参与的活动</div>

			<div id="s">
				<div id="mid_act">
					<c:if test="${empty requestScope.activityUsers}">
    		无活动
		</c:if>
					<c:if test="${!empty requestScope.activityUsers}">
						<c:forEach items="${requestScope.activityUsers }"
							var="activityUsers">
							<div id="mid_act1">
								<div style="float: left">
									<a href="../index/${activityUsers.activId}"><img
										src="${activityUsers.activBill}" id="img_a"></a>
									<h4>${activityUsers.activStart}</h4>
									<a href="../index/${activityUsers.activId}"><h3>${activityUsers.activName}</h3></a>
									<div id="buttom_buttom">
										<c:forEach items="${activityUsers.userList }" var="userList">
											<a href="../getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
										</c:forEach>
										<div id="num">${activityUsers.activNum}</div>
										<c:if test="${requestScope.isDel == 'isDel'}">
											<a href="#">删除活动</a>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

			</div>


		</div>
</body>
</html>