<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">


#left {
	width: 360px;
	height: 820px;
	background-color: #4f93b6;
	float: left;
}

#top {
	width: 360px;
	height: 140px;
	padding-top: 25px;
}

#user {
	margin: 0 auto;
	width: 120px;
	height: 120px;
	border: 2px solid white;
	border-radius: 120px;
	text-align: center;
	line-height: 120px;
	color: white;
	font-size: 24px;
	float: right;
}

#left a {
	text-decoration: none;
}

#logout {
	width: 120px;
	height: 20px;
	padding-top: 100px;
	float: right;
	color: white;
}

#logout img {
	width: 20px;
	height: 20px;
}

#main {
	margin-top: 100px;
	height: 392px;
	width: 360px;
}

ul {
	padding: 0px;
}

.table_li {
	margin-left: 0px;
	width: 360px;
	height: 56px;
	cursor: pointer;
	list-style: none;
	font-size: 24px;
	color: white;
	text-align: center;
	line-height: 56px;
	background-color: #4f93b6;
}


#bottom {
	width: 360px;
	height: 297px;
}
/* #counter {
			width: 1143px;
			height: 820px;
			background: url(images/back.png)  no-repeat;
			float: right;
		} */
#bottom_img {
	width: 100px;
	height: 50px;
}
</style>
<title>左边框</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

</head>
<body>
	<div id="left">
		<div id="top">

			<a href="${APP_PATH }/logoutAdmin"><div id="logout">
					<img src="${APP_PATH }/static/image/logout_admin.png">
				</div></a>
				<c:if test="${!empty sessionScope.admin}">
					<div id="user">${sessionScope.admin.adminName}</div>
				</c:if>
		</div>
		<div id="main">
			<ul>
				<a href="${APP_PATH }/activAdmin"><li class="table_li" id="activ_mamager">活动管理</li></a>
				<a href="${APP_PATH }/commentAdmin"><li class="table_li" id="cmt_mamager">评论管理</li></a>
				<a href="${APP_PATH }/userAdmin"><li class="table_li" id="user_mamager">用户管理</li></a>
			</ul>
		</div>
		<div id="bottom">
			<center>
				<img src="${APP_PATH }/static/image/SayHi_white.png" id="bottom_img">
			</center>
		</div>
	</div>


</body>
</html>