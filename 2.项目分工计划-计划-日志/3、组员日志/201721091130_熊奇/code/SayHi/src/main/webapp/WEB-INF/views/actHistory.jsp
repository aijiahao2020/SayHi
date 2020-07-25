<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 #top {
	border:none;
	border-width: 2px;
	border-color: darkgray;
	margin-top:-8px;
	background:transparent;
	position:static;
}

/*#quit {
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
	border-color: white;
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
	margin-left: 60px;
	margin-top: 50px;
}

#mid_act1 {
	margin-left: 30px;
	float: left;
	
	margin-bottom:20px;
	margin-right:10px;
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
	margin-left: 10px;
	font-size: 16px;
	color: #767676;
    float:left;
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
<script>
            
function check()
{
	var a  = choose.value;    /*  x是input的id */
	if(a==1)
	{
	th1.style.borderColor='#5B91A5';   /* th1是点赞过的 */
	}
	else if(a==2){
	th2.style.borderColor='#5B91A5';   /* th2是评论过的 */
	}
	else{
	th3.style.borderColor='#5B91A5';  /* th3是参加过的 */
		
	}
	
}
</script>
</head>

<body onload = "check()";>

	<input id="choose" type="hidden" value="${requestScope.choose}">
	<img src="${APP_PATH }/static/image/publish.png" id="imag">
     <div id="mid1">
	<div id="mid">
		<div id="mid_msg">
			<table id="mid_msg_table1">
				<tr>
					<th id="th_bom"><a href="${APP_PATH }/myAttendingActiv">进行中的活动</a></th>
					<th id="th_bom1"><a href="${APP_PATH }/myFavoriteActiv" style="color:white">活动历史</a></th>
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
				<div style="margin-left: 500px; font-size: 20px; padding-top: 100px;color:#A4A4A4">无活动</div>
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
		</div>
		<div id="mid_add">
			<a href="toAddActiv"><img src="static/image/add.png"
				id="mid_add_img"></a>
		</div>
	</div>
<div id="black"></div>
</body>
</html>
<%-- <c:if test="${!empty requestScope.userLabels}">
					<c:forEach items="${requestScope.labels }" var="labels" begin="0" end="0">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="摄影" name="userLabels">摄影</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="摄影" name="userLabels">摄影</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="1" end="1">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="食品" name="userLabels">食品</div>						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input type="checkbox" value="食品" name="userLabels">食品</div>						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="2" end="2">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="电影" name="userLabels">电影</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="电影" name="userLabels">电影</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="3" end="3">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="宠物" name="userLabels">宠物</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="宠物" name="userLabels">宠物</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="4" end="4">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="艺术" name="userLabels">艺术</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="艺术" name="userLabels">艺术</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="5" end="5">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="运动" name="userLabels">运动</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="运动" name="userLabels">运动</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="6" end="6">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="游戏" name="userLabels">游戏</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="游戏" name="userLabels">游戏</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="7" end="7">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="写作" name="userLabels">写作</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="写作" name="userLabels">写作</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${requestScope.labels }" var="labels" begin="8" end="8">
						<c:if test="${labels == 1}">
						<div name="test" id="checkbox"><input checked="checked" type="checkbox" value="科技" name="userLabels">科技</div>
						</c:if>
						<c:if test="${labels == 0}">
						<div name="test" id="checkbox"><input  type="checkbox" value="科技" name="userLabels">科技</div>
						</c:if>
					</c:forEach>
					</c:if>
					<c:if test="${empty requestScope.userLabels}">
						<div name="test" id="checkbox"><input type="checkbox" value="摄影" name="userLabels">摄影</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="食品" name="userLabels">食品</div>
						<div name="test" id="checkbox"> <input type="checkbox" value="电影" name="userLabels">电影</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="宠物" name="userLabels" >宠物</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="艺术" name="userLabels">艺术</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="运动" name="userLabels">运动</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="游戏" name="userLabels">游戏</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="写作" name="userLabels">写作</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="科技" name="userLabels">科技</div>
					</c:if> --%>