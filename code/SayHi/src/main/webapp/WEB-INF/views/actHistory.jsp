<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="head.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我发起的</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
a {
	text-decoration: none;
	color: black;
}
/* #top {
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
} */

/* #user {
	margin-right: 1%;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
}

#head_imag{
  height:30px;
  width:30px;
  float:right;
  border-radius:50%; 
	overflow:hidden;
	margin-top:7px;
	margin-right:5px;
} */
body {
	background-image: url(image/publish.png);
	background-position: 50px 50px;
	background-size: 1350px 330px;
	background-repeat: no-repeat;
}

#mid {
	width: 1130px;
	height: 450px;
	border: solid;
	border-top-color: #F7F7F7;
	border-bottom-color: #B1B1B1;
	border-left-color: #D3D3D3;
	border-right-color: #D3D3D3;
	margin-left: 250px;
	margin-bottom: 100px;
	border-radius: 5px;
}

#mid_msg_table1 {
	margin-left: 80px;
}

#mid_msg_table2 {
	margin-top: 20px;
	margin-left: 80px;
}

#th2 {
	width: 80px;
	font-size: 17px;
	font-family: "PingFang SC";
	height: 30px;
	border-bottom: solid;
	border-color: white;
}

#th1 {
	width: 90px;
	font-size: 17px;
	font-family: "PingFang SC";
	height: 30px;
	padding-left: 10px;
	border-bottom: solid;
	border-color: #5B91A5;
}

#th3 {
	width: 80px;
	font-size: 17px;
	font-family: "PingFang SC";
	height: 30px;
	border-bottom: solid;
	border-color: white;
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
	background-color: #5B91A5;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#th_bom2 {
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

#mid_act {
	margin-left: 50px;
	margin-top: 50px;
}

#mid_act1 {
	margin-left: 30px;
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

#mid_add {
	right: 150px;
	position: fixed;
	z-index: 999;
	bottom: 100px;
}

#mid_add_img {
	height: 80px;
	width: 80px;
}
</style>
<script>
            
            function change1(){
                th1.style.borderColor="#5B91A5";
                th2.style.borderColor="white";
                th3.style.borderColor="white";
             }
            function change2(){
               th2.style.borderColor="#5B91A5";
               th1.style.borderColor="white";
               th3.style.borderColor="white";
            }
            function change3(){
                th3.style.borderColor="#5B91A5";
                th1.style.borderColor="white";
                th2.style.borderColor="white";
             }
            </script>
</head>

<body>


	<img src="${APP_PATH }/static/image/publish.png"
		style="height: 300px; width: 1390px;">

	<div id="mid">
		<div id="mid_msg">
			<table id="mid_msg_table1">
				<tr>
					<th id="th_bom"><a href="${APP_PATH }/myAttendingActiv">进行中的活动</a></th>
					<th id="th_bom1"><a href="${APP_PATH }/myFavoriteActiv">活动历史</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myUserInfo">我的账号</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myMessage">消息</a></th>
				</tr>
			</table>
			<table id="mid_msg_table2">
				<tr>

					<th id="th1" onclick=change1()><a
						href="${APP_PATH }/myFavoriteActiv">点赞过的</a></th>
					<th id="th2" onclick=change2()><a
						href="${APP_PATH }/myCommentedActiv">评论过的</a></th>
					<th id="th3" onclick=change3()><a
						href="${APP_PATH }/myAttendedActiv">参加过的</a></th>
				</tr>

			</table>
		</div>

		<div id="mid_act">
			<c:if test="${empty requestScope.activityUsers}">
				<div style="margin-left: 50px; font-size: 25px;">无活动</div>
			</c:if>
			<c:if test="${!empty requestScope.activityUsers}">
				<c:forEach items="${requestScope.activityUsers }"
					var="activityUsers">
					<div id="mid_act1">
						<div style="float: left">
							<a href="${APP_PATH }/index/${activityUsers.activId}"><img
								src="${activityUsers.activBill}" id="img_a"></a>
							<h4>${activityUsers.activStart}</h4>
							<a href="${APP_PATH }/index/${activityUsers.activId}"><h3>${activityUsers.activName}</h3></a>
							<div id="buttom_buttom">
								<c:forEach items="${activityUsers.userList }" var="userList">
									<a href="getUserInfo/${userList.userId}"><img id="img_1"
										src="${userList.avatar}"></a>
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
		<div id="mid_add">
			<a href="toAddActiv"><img src="static/image/add.png"
				id="mid_add_img"></a>
		</div>
	</div>

</body>
</html>