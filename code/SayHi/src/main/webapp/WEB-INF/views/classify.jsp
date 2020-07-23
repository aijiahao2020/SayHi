<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类之下</title>
<style>
#top {
	margin-top: 1%;
}

#loginbutton {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 1%;
}

#registerbutton {
	cursor: pointer;
	color: black;
	outline: 0;
	background: white;
	font-size: 14px;
	border-left: solid;
	border-right: none;
	border-top: none;
	border-bottom: none;
	border-width: 1px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 3%;
	padding-left: 1%;
}

#middle {
	margin-top: 2%;
	border: 1px solid #ddd;
	width: 70%;
	height: 50px;
	margin-left: 15%;
	border-radius: 10px;
}

#activity {
	background-image: url(image/search.png);
	background-size: 12px 12px;
	background-position: 5px 9px;
	background-repeat: no-repeat;
	border: 1px solid #ddd;
	width: 45%;
	height: 30px;
	margin-top: 9px;
	margin-left: 2%;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	padding-left: 4%;
	float: left;
}

#location {
	background-image: url("image/location.png");
	background-size: 12px 12px;
	background-position: 5px 9px;
	background-repeat: no-repeat;
	border: 1px solid #ddd;
	width: 20%;
	height: 30px;
	margin-top: 9px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding-left: 4%;
	float: left;
}

#search {
	border-radius: 5px;
	width: 20%;
	height: 30px;
	float: left;
	margin-top: 10px;
	background: white;
	border-style: solid;
	border-width: 1px;
	float: left;
	margin-left: 1.5%;
}

#select {
	height: 270px;
	width: 70%;
	margin-left: 15%;
	margin-right: 15%;
	margin-top: 1%;
}

#bottom {
	height: 250px;
	width: 70%;
	margin-left: 15%;
	border-color: #d8d8d8;
	border-width: 1px;
	margin-top: 1%;
}

th {
	width: 80px;
	font-size: 15px;
	font-family: "PingFang SC";
	height: 50px;
}

#th2:hover {
	background-color: #BFBFBF;
}

/*  aijiahao 添加              */
#headline {
	height: 50px;
	font-family: "PingFang SC";
	font-size: 25px;
	line-height: 50px;
	width: 70%;
	margin-left: 15%;
}

/* 活动类型 样式 */
#type_select {
	height: 80px;
}

#type_title {
	height: 70px;
	width: 5%;
	margin-top: 5px;
	margin-left: 20px;
	float: left;
}

#type_content {
	height: 80px;
	width: 80%;
	float: left;
}

#type {
	margin: 0;
}

/* 活动地点 样式 */
#address_select {
	height: 80px;
}

#address_title {
	height: 70px;
	width: 5%;
	margin-top: 5px;
	margin-left: 20px;
	float: left;
}

#address_content {
	height: 80px;
	width: 80%;
	float: left;
}

#address {
	margin: 0;
}

/* 活动时间 样式 */
#time_select {
	height: 40px;
}

#time_title {
	height: 35px;
	width: 5%;
	margin-top: 5px;
	margin-left: 20px;
	float: left;
}

#time_content {
	height: 40px;
	width: 80%;
	float: left;
}

#time {
	margin: 0;
}

/* 搜索条件样式 */
#condition_select {
	height: 70px;
	float: left;
}

#condition {
	margin: 0;
}

ul {
	list-style: none;
}

#type li {
	float: left;
}

#address li {
	float: left;
}

#time li {
	float: left;
}

#condition li {
	float: left;
}

#htype {
	background-color: #5e93a7;
	color: white;
}

#haddress {
	background-color: #5e93a7;
	color: white;
}

#htime {
	background-color: #5e93a7;
	color: white;
}

#condition_re {
	background-color: #f6fcfe;
	border-color: #5e93a7;
	color: #5e93a7;
	border-right: none;
}

#condition_cmd {
	background-color: white;
	border-color: #BFBFBF;
	color: #BFBFBF;
	border-left: none;
	border-right: none;
}

#condition_info {
	background-color: white;
	border-color: #BFBFBF;
	color: #BFBFBF;
	border-left: none;
}

.title {
	height: 30px;
	width: 80px;
	margin-left: 15%;
	line-height: 30px;
	border-radius: 5px;
	cursor: pointer;
}

.type_li {
	height: 30px;
	width: 90px;
	margin: 5px 20px;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	cursor: pointer;
}

.address_li {
	height: 30px;
	width: 90px;
	margin: 5px 20px;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	cursor: pointer;
}

.time_li {
	height: 30px;
	width: 90px;
	margin: 5px 20px;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	cursor: pointer;
}

.condition_li {
	height: 30px;
	width: 100px;
	text-align: center;
	margin-top: 30px;
	line-height: 30px;
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	cursor: pointer;
}

#search_form {
	visibility: hidden;
}

.show {
	height: 300px;
	width: 70%;
	margin-left: 15%;
}

.show_activ {
	height: 200px;
	width: 25%;
	margin-top: 10px;
	text-align: center;
	float: left;
}

.show_img {
	height: 140px;
	width: 80%;
	margin-left: 10%;
	margin-top: 20px;
	border-radius: 10px;
	background-color: #BFBFBF;
}

.show_img img {
	height: 100%;
	width: 100%;
	border-radius: 10px;
}

.show_time {
	height: 30px;
	line-height: 40px;
	width: auto;
	font-size: 14px;
	font-family: "PingFang SC";
	margin-left: 10%;
	text-align: left;
	color: #BFBFBF;
}

.show_name {
	height: 30px;
	line-height: 30px;
	width: auto;
	font-size: 16px;
	font-family: "PingFang SC";
	margin-left: 10%;
	text-align: left;
}

.show_user {
	margin-left: 10%;
	height: 30px;
	width: auto;
}

.show_user_avatar {
	height: 25px;
	width: 25px;
	border-radius: 25px;
	line-height: 5px;
	margin: 1px;
	float: left;
}

.show_user_avatar img {
	height: 25px;
	width: 25px;
	border-radius: 20px;
}

.show_user_num {
	height: 25px;
	width: 25px;
	line-height: 30px;
	margin-left: 20px;
	font-size: 20px;
	color: #BFBFBF;
	float: left;
}

/*  aijiahao 添加              */
#th_bom {
	width: 70px;
	font-size: 15px;
	font-family: "PingFang SC";
	height: 30px;
}

#th_bom:hover {
	background-color: #BFBFBF;
}

#th_bom1 {
	width: 70px;
	font-size: 15px;
	font-family: "PingFang SC";
	height: 30px;
	background: blue;
	border-style: solid;
	border-color: blue;
	border-width: 1px;
}

#img_a {
	height: 100px;
}
</style>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
	var activLabel = "全部";
	var activCity = "全部";
	var activStarttime = "全部";
	var condition = "综合推荐";

	$(document).ready(
			function() {
				var labelString = $("#stage_string").val();
				var arr = labelString.split("+");
				if (arr.length == 4) {
					activLabel = arr[0];
					activCity = arr[1];
					activStarttime = arr[2];
					condition = arr[3];
				}
				$(".type_li").css("background-color", "white").css("color",
						"black");
				$(".type_li").each(
						function() {
							if ($(this).text() == activLabel) {
								$(this).css("background-color", "#5e93a7").css(
										"color", "white");
							}
						});
				$(".address_li").css("background-color", "white").css("color",
						"black");
				$(".address_li").each(
						function() {
							if ($(this).text() == activCity) {
								$(this).css("background-color", "#5e93a7").css(
										"color", "white");
							}
						});
				$(".time_li").css("background-color", "white").css("color",
						"black");
				$(".time_li").each(
						function() {
							if ($(this).text() == activStarttime) {
								$(this).css("background-color", "#5e93a7").css(
										"color", "white");
							}
						});
				$(".condition_li").css("background-color", " white").css(
						"color", "#BFBFBF").css("border-color", "#BFBFBF");
				$(".condition_li").each(
						function() {
							if ($(this).text() == condition) {
								$(this).css("background-color", "#f6fcfe").css(
										"color", "#5e93a7").css("border-color",
										"#5e93a7");
							}
						});

			});

	function get(value, opter) {
		var searchString;
		if (parseInt(opter) == 1) {
			activLabel = value;
		}
		if (parseInt(opter) == 2) {
			activCity = value;
		}
		if (parseInt(opter) == 3) {
			activStarttime = value;
		}
		if (parseInt(opter) == 4) {
			condition = value;
		}
		searchString = activLabel + "+" + activCity + "+" + activStarttime
				+ "+" + condition;
		$("#stage_string").val(searchString);
		/* document.getElementById("#submitString").submit(); */
		$("#submitString").trigger("click");

	}

	$(document).ready(
			function() {
				$(".type_li").click(
						function() {
							var value = $(this).first().text();
							$(this).parent().siblings().children().css(
									"background-color", "white").css("color",
									"black");

							$(this).first().css("background-color", "#5e93a7")
									.css("color", "white");
							get(value, 1);
						});
			});

	$(document).ready(
			function() {
				$(".address_li").click(
						function() {
							var value = $(this).first().text();
							$(this).parent().siblings().children().css(
									"background-color", "white").css("color",
									"black");

							$(this).first().css("background-color", "#5e93a7")
									.css("color", "white");
							get(value, 2);
						});
			});

	$(document).ready(
			function() {
				$(".time_li").click(
						function() {
							var value = $(this).first().text();
							$(this).parent().siblings().children().css(
									"background-color", "white").css("color",
									"black");

							$(this).first().css("background-color", "#5e93a7")
									.css("color", "white");
							get(value, 3);
						});
			});

	$(document).ready(
			function() {
				$(".condition_li").click(
						function() {
							var value = $(this).first().text();
							$(this).parent().siblings().children().css(
									"background-color", " white").css("color",
									"#BFBFBF").css("border-color", "#BFBFBF");

							$(this).first().css("background-color", "#f6fcfe")
									.css("color", "#5e93a7").css(
											"border-color", "#5e93a7");
							get(value, 4);
						});
			});
	$(document).ready(function() {
		$(".type_li").hover(function() {
			if ($(this).text() != activLabel) {
				$(this).css("background-color", "#BFBFBF");
			}

		}, function() {
			if ($(this).text() != activLabel) {
				$(this).css("background-color", "white");
			}
		});
	});
	$(document).ready(function() {
		$(".address_li").hover(function() {
			if ($(this).text() != activCity) {
				$(this).css("background-color", "#BFBFBF");
			}

		}, function() {
			if ($(this).text() != activCity) {
				$(this).css("background-color", "white");
			}
		});
	});
	$(document).ready(function() {
		$(".time_li").hover(function() {
			if ($(this).text() != activStarttime) {
				$(this).css("background-color", "#BFBFBF");
			}

		}, function() {
			if ($(this).text() != activStarttime) {
				$(this).css("background-color", "white");
			}
		});
	});
</script>
</head>
<body>
	<div id="top">
		<img alt="" src="../static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;">
		<c:if test="${empty sessionScope.user}">
			<a href="register1" id="registerbutton">注册</a>
			<a href="../login1" id="loginbutton">登录</a>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="logout" id="registerbutton">退出</a>
			<img alt="" src="${sessionScope.user.avatar}" style="size: 10px ">
			<a href="myAttendingActiv" id="loginbutton">${sessionScope.user.userName}</a>
		</c:if>
	</div>

	<div id="middle">
		<form action="search" method="post">
			<input name="activName" type="text" id="activity" placeholder=" 活动名"> <input
				name="address" type="text" id="location" placeholder=" 地点"> <input
				type="submit" value="搜索" id="search">
		</form>
	</div>

	<div id="headline">选活动</div>
	<div id="select">
		<div id="type_select">
			<div id="type_title">类型:</div>
			<div id="type_content">
				<ul id="type">
					<li></li>
					<li><div class="type_li" id="htype">全部</div></li>
					<li><div class="type_li">摄影</div></li>
					<li><div class="type_li">食品</div></li>
					<li><div class="type_li">电影</div></li>
					<li><div class="type_li">宠物</div></li>
					<li><div class="type_li">艺术</div></li>
					<li><div class="type_li">运动</div></li>
					<li><div class="type_li">游戏</div></li>
					<li><div class="type_li">写作</div></li>
					<li><div class="type_li">科技</div></li>
				</ul>
			</div>
		</div>
		<div id="address_select">
			<div id="address_title">地点:</div>
			<div id="address_content">
				<ul id="address">
					<li><div class="address_li" id="haddress">全部</div></li>
					<li><div class="address_li">北京</div></li>
					<li><div class="address_li">上海</div></li>
					<li><div class="address_li">广州</div></li>
					<li><div class="address_li">武汉</div></li>
					<li><div class="address_li">开封</div></li>
					<li><div class="address_li">南京</div></li>
					<li><div class="address_li">重庆</div></li>
					<li><div class="address_li">杭州</div></li>
					<li><div class="address_li">孝感</div></li>
				</ul>
			</div>
		</div>
		<div id="time_select">
			<div id="time_title">时间:</div>
			<div id="time_content">
				<ul id="time">
					<li><div class="time_li" id="htime">全部</div></li>
					<li><div class="time_li">今天</div></li>
					<li><div class="time_li">明天</div></li>
					<li><div class="time_li">后天</div></li>
					<li><div class="time_li">近一周</div></li>
					<li><div class="time_li">其他</div></li>
				</ul>
			</div>
		</div>
		<div id="condition_select">
			<ul id="condition">
				<li><div class="condition_li" id="condition_re">综合推荐</div></li>
				<li><div class="condition_li" id="condition_cmd">讨论最多</div></li>
				<li><div class="condition_li" id="condition_info">点赞最多</div></li>
			</ul>
		</div>
	</div>

	<div class="show">
		<%-- <input id="stage_string" type="text" value="${requestScope.info}"> --%>
		<form action="getClarifiedActiv" method="post" id="search_form">
			<input type="text" name="info" id="stage_string"
				value="${requestScope.info}"> <input type="submit"
				id="submitString">
		</form>
		<c:if test="${empty requestScope.activUsers }">
		没有任何活动信息.
		</c:if>
		<c:if test="${!empty requestScope.activUsers}">
			<c:forEach items="${requestScope.activUsers }" var="activUsers">
				<div class="show_activ">
					<div class="show_img">
						<a href="../index/${activUsers.activId}"><img
							src="${activUsers.activBill}"></a>
					</div>
					<div class="show_time">${activUsers.activStart}</div>
					<div class="show_name">
						<a href="../index/${activUsers.activId}">${activUsers.activName}</a>
					</div>
					<div class="show_user">
						<c:forEach items="${activUsers.userList }" var="userList">
							<div class="show_user_avatar">
								<a href="../getUserInfo/${userList.userId}"><img
									src="${userList.avatar}"></a>
							</div>
						</c:forEach>
						<div class="show_user_num">${activUsers.activNum}</div>
					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>
</body>
</html>