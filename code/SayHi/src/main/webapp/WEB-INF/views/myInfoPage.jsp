<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="head.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的账号</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
a{
 text-decoration:none;
  color:black;
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

#head_imag{
  height:30px;
  width:30px;
  float:right;
  border-radius:50%; 
	overflow:hidden;
	margin-top:7px;
	margin-right:5px;
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
	margin-left: 250px;
	margin-bottom: 100px;
	border-radius: 5px;
}

#mid_table1 {
	margin-left: 80px;
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
	border-radius:50%; 
	overflow:hidden;
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
	font-size:19px;
	border: none;
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
	float:left;
	visibility: hidden;
	
}

body {
	font-family: "PingFang SC";
}

#img_upload {
	visibility: hidden;
}

#save_button {
	width: 200px;
	height: 50px;
	visibility: hidden;
	font-size: 15px;
	border: none;
	margin-top: 20px;
	margin-left: 200px;
	color: black;
	outline: none;
	border-radius:5px;
}

#labels{
	visibility:visible;
}

#test{
}
#mid_add{
 right:150px;
    position: fixed;
    z-index: 999;
    bottom:100px;
}
#mid_add_img{
   height:80px;
   width:80px;
} 
</style>
<script src="static/js/jquery-1.12.4.min.js"></script>
<script>
   function change(){
	   mid_msg_name_input.style.border='solid';
	   mid_msg_name_input.style.borderWidth='1px'; 
	   labels.style.visibility="hidden";
	   
	   mid_msg_name_input.readOnly=false;
	    /* img_upload.style.visibility='visible';   */
	   save_button.style.visibility='visible';
	   var list = document.getElementsByTagName("input");
	   var inputList = document.getElementsByName("test");
	   $(document).ready(function(){
		    $('#mid_msg_head_img').click(function(){
		        $('#img_upload').click();
		    });

		});
	
	for(i=0;i<list.length;i++){

	
	inputList[i].style.visibility = 'visible';

	}
}
   function change1(){
	   mid_msg_name_input.style.border='none';
	   save_button.style.visibility='hidden';
	   /* img_upload.style.visibility='hidden';  */
	   mid_msg_name_input.readOnly=true;
	   var list = document.getElementsByTagName("input");
	   var inputList = document.getElementsByName("test");
	
	for(i=0;i<list.length;i++){
		inputList[i].style.visibility = 'hidden';
	
	}
	   
   }
   </script>

</head>
<body>
	<%-- <div id="top">
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
	
	<img  src="static/image/publish.png"  style="height:300px;width:1390px;">
	
	<div id="mid">
		<table  style="margin-left:80px;">
			<tr>
				<th id="th_bom"><a href="${APP_PATH }/myAttendingActiv">进行中的活动</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myFavoriteActiv">活动历史</a></th>
					<th id="th_bom1"><a href="${APP_PATH }/myUserInfo">我的账号</a></th>
					<th id="th_bom"><a href="${APP_PATH }/myMessage">消息</a></th>
			</tr>
		</table>
		<div id="mid_msg">
			<form action="updateUserInfo" method="post" enctype="multipart/form-data">
				<input type="button" value="修改" id="mid_msg_button" onclick=change()
					name="">
				<div id="mid_msg_head">头像:</div>
				<img src="${sessionScope.user.avatar}" id="mid_msg_head_img">
				<input type="file" id="img_upload" name="file" />
				<div id="mid_msg_num">SayHi号:<div style="margin-right:700px;float:right;">${sessionScope.user.userId}</div></div>
				<div id="mid_msg_name">
					用户名: <input id="mid_msg_name_input"
						value="${sessionScope.user.userName}" name="userName" type="text"
						readOnly>
				</div>
				<div id="mid_msg_tag">
					兴趣标签:
					<div id="labels">
					<div style="margin-left:150px;margin-top:-29px;">
					<c:if test="${empty requestScope.userLabels}">
					无标签
					</c:if>
					<c:if test="${!empty requestScope.userLabels}">
						<c:forEach items="${requestScope.userLabels }" var="userLabels">
						${userLabels.labelName}
					</c:forEach>
					</c:if>
					</div>
					</div>
					<div id="mid_msg_tag_check">
						<div name="test" id="checkbox"><input type="checkbox" value="摄影" name="userLabels">摄影</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="食品" name="userLabels">食品</div>
						<div name="test" id="checkbox"> <input type="checkbox" value="电影" name="userLabels">电影</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="宠物" name="userLabels" >宠物</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="艺术" name="userLabels">艺术</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="运动" name="userLabels">运动</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="游戏" name="userLabels">游戏</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="写作" name="userLabels">写作</div>
						 <div name="test" id="checkbox"><input type="checkbox" value="科技" name="userLabels">科技</div>
					</div>
				</div>
				<div>
					<input id="save_button" type="submit" value="保存" onclick=change1() />
				</div>
			</form>
			<div id="mid_add">
				<a href="toAddActiv"><img src="static/image/add.png" id="mid_add_img"></a>
			</div>
		</div>

	</div>
</body>
</html>