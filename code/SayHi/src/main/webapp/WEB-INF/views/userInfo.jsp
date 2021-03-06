<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="head.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>他人视角</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
body {
	font-family: "PingFang SC";
}

a{
 text-decoration:none;
  color:black;
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
	margin-left: 1170px;
	border-radius:50%; 
	overflow:hidden;
}

#mid {
	height: 400px;
	width: 1000px;
	margin-left: 200px;
	margin-top: 100px;
}

#mid_head {
	height: 270px;
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
	margin-top: -60px;
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
	 height: 110px;
	width: 200px;
	border-radius: 5px;
}

#img_1 {
	height: 25px;
	width:25px;
	border-radius:50%; 
	overflow:hidden;
    float:left;
	
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
<%-- 	<div id="top">
		<a href="../index"><img alt="" src="../static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"></a> <img
			src="${sessionScope.user.avatar}" id="head_imag"> <a href=""><input
			value="退出" id="quit"></a>
		<div id="user">
			<p style="float: right;">
				<a href="../myAttendingActiv">${sessionScope.user.userName}</a>
			</p>
		</div>

	</div> --%>

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
									<a href="${APP_PATH }/index/${activityUsers.activId}"><img
										src="${activityUsers.activBill}" id="img_a"></a>
									<h4><fmt:formatDate value="${activityUsers.activStart}" pattern="yyyy-MM-dd hh:mm:ss" /></h4>
									<a href="${APP_PATH }/index/${activityUsers.activId}"><h3>${activityUsers.activName}</h3></a>
									<div id="buttom_buttom">
										<c:forEach items="${activityUsers.userList }" var="userList">
											<a href="${APP_PATH }/getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
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