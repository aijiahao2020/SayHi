<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a {
	text-decoration: none;
}

#left {
	width: 360px;
	height: 820px;
	background-color: #98C5CD;
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
	background-color: #98C5CD;
}

.table_li:hover {
	background-color: rgba(42, 182, 205, 0.7);
}

#activ_mamager {
	background-color: rgba(30, 110, 155, 0.7);
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
<script type="text/javascript" src="scripts/jquery-3.4.1.js"></script>

</head>
<body>
	<div id="left">
		<div id="top">

			<a href=""><div id="logout">
					<img src="static/image/logout_admin.png">
				</div></a>
			<div id="user">艾佳豪</div>
		</div>
		<div id="main">
			<ul>
				<a href=""><li class="table_li" id="activ_mamager">活动管理</li></a>
				<a href=""><li class="table_li" id="cmt_mamager">评论管理</li></a>
				<a href=""><li class="table_li" id="user_mamager">用户管理</li></a>
			</ul>
		</div>
		<div id="bottom">
			<center>
				<img src="static/image/SayHi_white.png" id="bottom_img">
			</center>
		</div>
	</div>


</body>
</html>