<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>活动界面</title>
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
	margin-right: 3%;
	margin-top: 14px;
	float: right;
}

#user {
	margin-right: 1%;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
}

#title {
	border-bottom: solid;
	border-width: 2px;
	border-color: darkgray;
	height: 100px;
}

#main_title {
	margin-left: 90px;
	margin-top: 27px;
}

#join {
	cursor: pointer;
	border: none;
	background: darkred;
	outline: 0;
	width: 100px;
	font-size: 14px;
	color: white;
	font-family: "PingFang SC";
	margin-right: 20px;
	margin-top: -50px;
	float: right;
	border-radius: 5px;
}

#mid {
	margin-top: 10px;
	height: 670px;
}

#introduce {
	margin-left: 110px;
	border-right: solid;
	border-width: 2px;
	border-color: gray;
	width: 1000px;
	float: left;
}

#poster {
	height: 200px;
	width: 700px;
}

#poster1 {
	margin-top: 2%;
	width: 1000px;
	margin-left: 150px;
}

#recommend {
	margin-left: 1200px;
}

#mem {
	width: 100px;
	height: 100px;
	border: solid;
	border-width: 1px;
	border-color: darkgray;
	float: left;
	margin-right: 20px;
}

#mem_img {
	height: 50px;
	width: 50px;
	padding-left: 25px;
}

#comment {
	margin-left: 8%;
	margin-top: 70px;
	margin-bottom: 5%;
	width: 600px;
}

#comment_mem {
	width: 500px;
	height: 200px;
}

#comment_mem_img {
	height: 50px;
	width: 50px;
}

#commit {
	margin-top: 5%;
	margin-bottom: 5%;
	float: left;
}

#comment_mem_line {
	border-bottom: solid;
	border-width: 1px;
	margin-bottom: 2%;
	float: left;
}

#comment_comment {
	border-bottom: solid;
}

#comment_msg {
	padding-left: 80px;
	padding-bottom: 80px;
	padding-top: 20px;
	width: 30px;
}

#img_1 {
	height: 30px;
	width: 30px;
	position: absolute;
}

#img_2 {
	height: 30px;
	width: 30px;
	position: absolute;
	margin-left: 15px;
}

#img_3 {
	height: 30px;
	width: 30px;
	position: absolute;
	margin-left: 30px;
}
</style>
</head>
<body>
	<div id="top">
		<c:if test="${empty sessionScope.user}">
			<a href="index"><img alt="" src="../static/image/SayHi.png"
				style="padding-top: 10px; padding-left: 20px; height: 30px;"></a>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="userIndex"><img alt="" src="../static/image/SayHi.png"
				style="padding-top: 10px; padding-left: 20px; height: 30px;"></a>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<a href="../login1" id="loginbutton">登录</a>
			<a href="../register1" id="registerbutton">注册</a>

		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="logout" id="registerbutton">退出</a>
			<a href="person" id="loginbutton">${sessionScope.user.userName}</a>
		</c:if>
	</div>
	<div id="title">
		<div id="main_title">
			<p style="font-size: 12px; color: gray">${activity.activStarttime}</p>
			<p
				style="margin-top: 0.5%; font-size: 35px; font-family: PingFang SC;">${activity.activName}</p>
			<div style="margin-left: 200px; margin-top: -65px;">
				<img src="../static/image/location.png" style="height: 20px;">
				<p
					style="padding-left: 25px; margin-top: -17px; font-family: PingFang SC; color: gray">${activity.activState}${activity.activCity}${activity.activAddress}</p>
			</div>
		</div>
		<c:if test="${!empty sessionScope.user}">
			<form action="">
				<input type="submit" value="参加" id="join">
			</form>
		</c:if>
	</div>
	<div id="mid">
		<div id="introduce">
			<img src="${activity.activBill}" id="poster">
			<p style="font-family: PingFang SC; font-size: 22px;">活动简介</p>
			<p style="font-size: 12px;">${activity.activBrief}</p>
			<p style="font-family: PingFang SC; font-size: 22px;">特别限制</p>
			<p style="font-size: 12px;">${activity.limitExplain}</p>
			<p style="font-family: PingFang SC; font-size: 22px;">期望人数：${activity.expNum}人</p>
			<div id="joinmem">
				<p style="font-family: PingFang SC; font-size: 22px;">参加人员（${activity.expNum}）</p>
				<div id="mem">
					<img id="mem_img" src="image/save.png">
					<center>
						<p style="font-family: PingFang SC; font-size: 10px;">是个人就行</p>
						<p
							style="font-family: PingFang SC; font-size: 5px; margin-top: -5px;">主办方</p>
					</center>
				</div>
			</div>
		</div>

		<div id="recommend">
			<h1 style="font-size: 30px; font-family: PingFang SC;">活动推荐</h1>
			<div style="float: left">
				<img src="image/save.png" id="paster1">
				<h4 style="margin-top: -0.5%">星期六，8/1，2:00，下午</h4>
				<h3 style="margin-top: -1.5%">公园野餐</h3>
				<img id="img_1" src="image/search.png"> <img id="img_2"
					src="image/search.png"> <img id="img_3"
					src="image/search.png">
				<div style="margin-left: 80px; font-size: 20px; color: #767676">16</div>
			</div>

			<div style="float: left; margin-left: 1%; margin-top: 13px;">
				<img src="image/save.png" id="paster1">
				<h4 style="margin-top: -0.5%">星期六，8/1，2:00，下午</h4>
				<h3 style="margin-top: -1.5%">公园野餐</h3>
				<img id="img_1" src="image/search.png"> <img id="img_2"
					src="image/search.png"> <img id="img_3"
					src="image/search.png">
				<div style="margin-left: 80px; font-size: 20px; color: #767676">16</div>
			</div>

			<div></div>

			<div></div>
		</div>
	</div>
	<div id="comment">
		<p style="font-family: PingFang SC; font-size: 22px;">评论（${activity.cmtNum}）</p>
		<c:if test="${empty requestScope.comments }">
			没有任何评论.
		</c:if>
		<c:if test="${!empty requestScope.comments }">
		<c:forEach items="${requestScope.comments }" var="comments">
		<div id="comment_mem">
			<div style="height: 130px;">
				<div style="font-family: PingFang SC; font-size: 10px; float: left">
					<img id="comment_mem_img" src="${comments.avatar}">
					<p>${comments.userName}</p>
					<p style="margin-top: -5px;">${comments.cmtTime}</p>
				</div>
				<div id="comment_comment">
					<div id="comment_msg">${comments.cmtContent}</div>
				</div>
			</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
</body>
</html>