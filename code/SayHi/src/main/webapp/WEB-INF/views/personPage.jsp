<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="head.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我发起的</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			var content = $(this).parent().parent().find("#name1").text();
			var flag = confirm("确定要删除 "+ content +"活动的信息吗？");
			return flag;
		});
	});
</script>
<style>
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
}

#user {
	margin-right: 1%;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
} */

#head_imag {
	  height:30px;
  width:30px;
  float:right;
  border-radius:50%; 
	overflow:hidden;
	margin-top:7px;
	margin-right:5px;
}

#imag{
   width:1150px;
   height:330px;
   margin-top:-55px;
   margin-left:150px;
}
body {
	
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
	width: 70px;
	font-size: 17px;
	font-family: "PingFang SC";
	height: 30px;
	border-bottom: solid;
	border-color: white;
	padding-left:20px;
}

#th1 {
	width: 50px;
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
#delete_act{
  border:solid;
  border-color:#5B91A5;
  background-color:#5B91A5;
  border-width:1px;
  color:white;
  font-size:15px;
  width:150px;
  /* text-align:center; */
  border-radius:5px;
  margin-top:150px;
  float:left;
  margin-left:-40px;
}
a{
 text-decoration:none;
  color:black;
}
#mid_add{
 right: 380px;
    position: fixed;
    z-index: 999;
    bottom:50px;
}
#mid_add_img{
   height:80px;
   width:80px;
} 
#delete_act{
  border:solid;
  border-color:#5B91A5;
  background-color:#5B91A5;
  border-width:1px;
  color:white;
  font-size:17px;
  width:200px;
 text-align:center;
  border-radius:5px;
  margin-top:40px;
  float:left;
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
	th1.style.borderColor='#5B91A5';   /* th1是全部 */
	}
	else
	{
	th2.style.borderColor='#5B91A5';
	}
	
}
</script>

</head>

<body onload = "check()";>

<%-- 	<div id="top">
		<a href="index"><img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"></a> 
			 <a href=""><input value="退出" id="quit"></a>
		<div id="user">
			<p style="float: right;">
				<a href="myAttendingActiv">${sessionScope.user.userName}</a>
			</p>
		</div>
         <img src="${sessionScope.user.avatar}" id="head_imag">
	</div> --%>
	<input id="choose" type="hidden" value="${requestScope.choose}">
	 <img  src="static/image/publish.png"  id="imag">
	 
	 <div  id="mid1">
	<div id="mid">
		<div id="mid_msg">
			<table id="mid_msg_table1">
				<tr>
					<th id="th_bom1"><a href="${APP_PATH }/myAttendingActiv" style="color:white">进行中的活动</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myFavoriteActiv">活动历史</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myUserInfo">我的账号</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myMessage">消息</a></th>
				</tr>
			</table>
			<table id="mid_msg_table2">
				<tr>
					<th id="th1" onclick=change() ><a href="myAttendingActiv">全部</a></th>
					<th id="th2" onclick=change1() ><a href="myLaunchedActiv">我发起的</a></th>
				</tr>

			</table>
		</div>

		<div id="mid_act">
			<c:if test="${empty requestScope.activityUsers}">
    		<div style="margin-left:50px;font-size:25px;">无活动</div>
		</c:if>
			<c:if test="${!empty requestScope.activityUsers}">
				<c:forEach items="${requestScope.activityUsers }"
					var="activityUsers">
					<div id="mid_act1">
						<div style="float: left;">
							<a href="index/${activityUsers.activId}"><img
								src="${activityUsers.activBill}" id="img_a"></a>
							<h4><fmt:formatDate value="${activityUsers.activStart}" pattern="yyyy-MM-dd hh:mm:ss" /></h4>
							<a href="index/${activityUsers.activId}"><h3 id="name1">${activityUsers.activName}</h3></a>
							<div id="buttom_buttom">
								<c:forEach items="${activityUsers.userList }" var="userList">
									<a href="getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
								</c:forEach>
								<div id="num">${activityUsers.activNum}</div>
								<c:if test="${requestScope.isDel == 'isDel'}">
									<div id="delete_act"><a class="delete" href="${APP_PATH }/delActiv/${activityUsers.activId}" style="color:white">删除活动</div></a>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		</div>
		</div>
		
		<div id="mid_add">
			<a href="toAddActiv"><img src="${APP_PATH }/static/image/add.png" id="mid_add_img"></a>
		</div>
	
<div id="black"></div>
</body>
</html>