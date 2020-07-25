<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="head.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>活动界面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
a {
	text-decoration: none;
	color: black;
}

#top {
	border-bottom: solid;
	border-width: 1px;
	border-color: #E0E0E0;
	margin-top: -8px;
	height: 60px;
	width: 101% margin-left:-8px;
}

#head_img {
	height: 30px;
	width: 30px;
	float: right;
	border-radius: 50%;
	overflow: hidden;
	margin-top: 7px;
	margin-right: 5px;
}

#loginbutton {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 16px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 1%;
	margin-top: 10px;
}

#registerbutton {
	cursor: pointer;
	color: black;
	outline: 0;
	background: white;
	font-size: 16px;
	border-left: solid;
	border-right: none;
	border-top: none;
	border-bottom: none;
	border-width: 1px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 3%;
	padding-left: 1%;
	margin-top: 10px;
}

#title {
	border-bottom: none;
	height: 150px;
	position: fixed;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	margin-left: -8px;
	width: 101%;
	background-color: white;
	padding-left: 30px;
}

#main_title {
	margin-left: 90px;
	margin-top: 57px;
}

#join {
	cursor: pointer;
	border: none;
	background: #ED6363;
	outline: 0;
	width: 150px;
	height: 30px;
	font-size: 14px;
	color: white;
	font-family: "PingFang SC";
	margin-right: 180px;
	margin-top: -50px;
	float: right;
	border-radius: 5px;
}

#mid {
	padding-top: 170px;
	height: 670px;
}

#introduce {
	margin-left: 110px;
	border-right: solid;
	border-width: 1px;
	border-color: #979797;
	margin-top: 50px;
	width: 900px;
	float: left;
}

#poster {
	height: 300px;
	width: 690px;
	border-radius: 10px;
	margin-top: -5px;
}

#poster1 {
	margin-top: 1%;
	width: 230px;
	height: 100px;
	border-radius: 5px;
}

#recommend {
	margin-left: 1250px;
	margin-top: 40px;
}

#mem {
	width: 100px;
	height: 130px;
	border: solid;
	border-width: 1px;
	border-color: darkgray;
	float: left;
	margin-right: 20px;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px darkgray;
}

#mem_img {
	margin-top: 20px;
	height: 50px;
	width: 50px;
	border-radius: 50%;
	overflow: hidden;
}

#comment {
	margin-left: 8%;
	margin-top: 270px;
	margin-bottom: 5%;
	width: 600px;
}

#comment_mem {
	width: 500px;
	height: 170px;
	margin-left: 110px;
}

#comment_mem_img {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	overflow: hidden;
}

#commit {
	margin-top: 5%;
	margin-bottom: 5%;
	float: left;
}

#comment_mem_line {
	border-bottom: solid;
	border-width: 1px;
	margin-bottom: 10px;
	float: left;
}

#comment_comment {
	height: 105px;
	border-bottom: dashed;
	border-width: 1px;
	border-color: darkgray;
}

#comment_msg {
	padding-left: 70px;
	margin-top: -105px;
	width: 400px;
}

#img_1 {
	height: 30px;
	width: 30px;
	border-radius: 50%;
	margin-top: 20px;
	overflow: hidden;
	float: left;
}

#pubcom_input {
	height: 100px;
	width: 460px;
	border-radius: 5px;
	border: 1px solid gray;
}

p {
	font-family: PingFang SC;
}

#pubcom_button1 {
	margin-top: 10px;
	margin-left: 400px;
	width: 70px;
	height: 20px;
	background-color: #5B91A5;
	cursor: pointer;
	color: white;
	border-radius: 5px;
	outline: 0;
	font-size: 12px;
	border-style: solid;
	border-color: #5B91A5;
	border-width: 1px;
	font-family: "PingFang SC";
}

#good {
	height: 20px;
	width: 20px;
	margin-left: 350px;
	margin-top: 35px;
	position: absolute;
	visibility: visible;
}

#gooded {
	height: 20px;
	width: 20px;
	margin-left: 350px;
	margin-top: 35px;
	position: absolute;
	visibility: hidden;
}

#goodnum {
	height: 20px;
	width: 40px;
	margin-left: 380px;
	margin-top: 35px;
	position: absolute;
	border: none;
}

#black {
	width: 100%;
	background-color: #F5F9FA;
	height: 200px;
	margin-top: 250px;
	float: left;
}

#bt1{
    background-size: 20px 20px;
	background-position: 0px 0px;
	background-repeat: no-repeat;
    width:20px;
    height:20px;
    border:none;
    background-color:white;
    color:white;
    margin-left:400px;
    margin-top:-45px;
    border-radius:5px;
    border-radius: 5px;
    border-radius: 5px !important;
    outline:none;
    cursor:pointer;
    float: left;
}
</style>
<script>
	function good() {

		var a = goodnum.value;
		b = 1;
		var c = parseInt(a) + parseInt(b);
		goodnum.value = c;
		var x = document.getElementById("good");
		x.style.visibility = 'hidden';
		var y = document.getElementById("gooded");
		y.style.visibility = 'visible';

	}

	function gooded() {
		var a = goodnum.value;
		b = 1;
		var c = parseInt(a) - parseInt(b);
		goodnum.value = c;
		var x = document.getElementById("gooded");
		x.style.visibility = 'hidden';
		var y = document.getElementById("good");
		y.style.visibility = 'visible';
	}
	
	function check(){
	      var a = document.getElementById("bt1");
	      var b = a.value;
	      var c = document.getElementById("bt1");
	      if(b=="点赞")
	    	  {
	    	      //c.style.backgroundColor = 'gray';
	    	      //c.style.color = 'gray';
	    	  document.getElementById("bt1").style.backgroundImage='url(../static/image/good.png)';
	    	  
	    	  }
	      else  {
	    	  //c.style.backgroundColor = 'red';
	      //c.style.color = 'red';
	    	  document.getElementById("bt1").style.backgroundImage='url(../static/image/gooded.png)';
	      }
	}
</script>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		var id = $("#activId").text();//获取点赞对象：用户1
		var sum = $("#sp2").text();//获取当前赞的数量，这里获取的是字符串
		var bt1 = $("#bt1").text();
		$("#bt1").click(function() {//给button设置点击事件
			$.ajax({
				url : "${APP_PATH }/addFavoriteInfo",//这个对应Controller的URL，和你们以前表单里面的action一样
				data : { //data就是你想要传什么数据到Controller层，这里的数据是json数据。

					activId : id,
					isFavor : bt1

				},
				type : "POST", //类型，POST或者GET,就和表单与超链接一样
				dataType : 'text', //Controller层返回类型，如果返回String，就用text,返回json,就用json
				success : function(data) { //成功，回调函数
					if(data=='请先登录，后点赞'){
						alert(data);
					}
					if (data == "已点赞") {
						sum = parseInt(sum) + 1;
						$("#sp2").html(sum);
						$("#bt1").html(data);
						//document.getElementById("bt1").style.color="red";
						//document.getElementById("bt1").style.backgroundColor="red";
						document.getElementById("bt1").style.backgroundImage='url(../static/image/gooded.png)';
						//document.getElementById("bt1").style.backgroundImage='url(../static/image/gooded.png)';
						bt1 = data;
					}
					if (data == "点赞") {
						sum = parseInt(sum) - 1;
						$("#sp2").html(sum);
						$("#bt1").html(data);
						document.getElementById("bt1").style.backgroundImage='url(../static/image/good.png)';
						//document.getElementById("bt1").style.color="gray";
						//document.getElementById("bt1").style.backgroundColor="gray";
						//document.getElementById("bt1").style.backgroundImage='url(../static/image/good.png)';
						bt1 = data;
					}
					/* $("#sp2").html(data);//点赞+1，先把sum强转为整再+1
					$("#bt1").html("已点赞");//点赞+1，先把sum强转为整再+ */1
				},
				error : function() { //失败，回调函数
					alert("程序出错。。。");
				}
			})
		});
	})
</script>
</head>
<body onload="check()">
	<%-- <div id="top">
		<c:if test="${empty sessionScope.user}">
			<a href="../index"><img alt="" src="../static/image/SayHi.png"
				style="padding-top: 10px; padding-left: 20px; height: 30px;"></a>
		</c:if>
		
		<c:if test="${!empty sessionScope.user}">
			<a href="../index"><img alt="" src="../static/image/SayHi.png"
				style="padding-top: 10px; padding-left: 20px; height: 30px;"></a>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<a href="../login1" id="loginbutton">登录</a>
			<a href="../register1" id="registerbutton">注册</a>

		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="../logout" id="registerbutton">退出</a>
			
			<a href="../myAttendingActiv" id="loginbutton">${sessionScope.user.userName}</a>
		    <img  src="${sessionScope.user.avatar}" id="head_img">
		</c:if> 
	</div>--%>
	<div id="title">
		<div id="main_title">
			<p
				style="padding-top: 10px; font-size: 35px; font-family: PingFang SC;">${activity.activName}</p>
			<div style="margin-left: 0px; margin-top: -35px;">
				<img src="${APP_PATH }/static/image/location.png"
					style="height: 20px;">
				<p
					style="padding-left: 25px; margin-top: -17px; font-family: PingFang SC; color: gray">${activity.activState}${activity.activCity}${activity.activAddress}</p>
			</div>

			<p
				style="font-size: 14px; color: gray; margin-top: -35px; margin-left: 190px;">
				<fmt:formatDate value="${activity.activStarttime}"
					pattern="yyyy-MM-dd hh:mm:ss" />
			</p>


		</div>
		<c:if test="${!requestScope.isSponsor}">
			<c:if test="${!empty sessionScope.user }">
				<c:if test="${requestScope.isAttented}">
					<form action="${APP_PATH }/leaveActiv" method="post">
						<input type="hidden" name="userId"
							value="${sessionScope.user.userId}"> <input type="hidden"
							name="activId" value="${activity.activId}"> <input
							type="submit" value="已参加" id="join">
					</form>
				</c:if>
				<c:if test="${!requestScope.isAttented}">
					<form action="${APP_PATH }/attendActiv" method="post">
						<input type="hidden" name="userId"
							value="${sessionScope.user.userId}"> <input type="hidden"
							name="activId" value="${activity.activId}"> <input
							type="submit" value="参加" id="join">
					</form>
				</c:if>
			</c:if>
		</c:if>
		<c:if test="${requestScope.isSponsor}">
			<input type="button" value="已参加" id="join">
		</c:if>
	</div>
	<div id="mid">
		<div id="introduce">
			<img src="${activity.activBill}" id="poster">
			<p style="font-family: PingFang SC; font-size: 26px;">活动码:</p>
			<p style="font-size: 18px;">
				<span style="float: left; margin-top: -50px; margin-left: 150px;"
					id="activId">${activity.activId}</span>
			</p>
			<p style="font-family: PingFang SC; font-size: 26px;">活动简介:</p>
			<p style="font-size: 12px;">${activity.activBrief}</p>
			<p style="font-family: PingFang SC; font-size: 26px;">特别限制:</p>
			<p style="font-size: 12px;">${activity.limitExplain}</p>
			<p style="font-family: PingFang SC; font-size: 26px;">期望人数：${activity.expNum}人</p>
			<div id="joinmem">
				<p style="font-family: PingFang SC; font-size: 26px;">参加人员（${memberNum}）</p>
				<c:forEach items="${requestScope.activMem }" var="activMem"
					varStatus="status">
					<div id="mem">
						<center>
							<a href="${APP_PATH }/getUserInfo/${activMem.userId}"><img
								id="mem_img" src="${activMem.avatar}"></a>
						</center>
						<center>
							<p style="font-family: PingFang SC; font-size: 13px;">${activMem.userName}</p>
							<c:if test="${status.count == 1}">
								<p
									style="font-family: PingFang SC; font-size: 5px; margin-top: -10px; color: darkgray">主办方</p>
							</c:if>
							<c:if test="${status.count != 1}">
								<p
									style="font-family: PingFang SC; font-size: 5px; margin-top: -10px; color: darkgray">参与者</p>
							</c:if>
						</center>
					</div>
				</c:forEach>
			</div>
		</div>

		<div id="recommend">
			<h1 style="font-size: 30px; font-family: PingFang SC;">活动推荐</h1>
			<c:if test="${empty requestScope.activUsers}">
		无类似推荐
		</c:if>
			<c:if test="${!empty requestScope.activUsers}">
				<c:forEach items="${requestScope.activUsers }" var="activUsers"
					begin="0" end="2">
					<div style="float: left; margin-top: 10px;">
						<a href="${APP_PATH }/index/${activUsers.activId}"><img
							src="${activUsers.activBill}" id="poster1"></a>
						<div style="margin-top: -1px; color: #9A8A72;">
							<fmt:formatDate value="${activUsers.activStart}"
								pattern="yyyy-MM-dd hh:mm:ss" />
						</div>
						<a href="${APP_PATH }/index/${activUsers.activId}"><div
								style="margin-top: 3px">${activUsers.activName}</div></a>
						<c:forEach items="${activUsers.userList }" var="userList">
							<a href="${APP_PATH }/getUserInfo/${userList.userId}"><img
								id="img_1" src="${userList.avatar}"></a>
						</c:forEach>
						<div
							style="margin-left: 100px; font-size: 20px; color: #767676; margin-top: 25px;">${activUsers.activNum}</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div id="comment">

		<p style="font-family: PingFang SC; font-size: 26px;">评论（${activity.cmtNum}）</p>
		<div>
			<c:if test="${!empty sessionScope.user}">
				<button id="bt1" value="${requestScope.isF}">${requestScope.isF}</button>
			</c:if>
			<c:if test="${empty sessionScope.user}">
				<button id="bt1">点赞</button>
			</c:if>
			<span id="sp2" style="margin-left: 440px;margin-top:-44px;float:left">${activity.favorNum}</span> <br>
		</div>

		<div>
			<form action="../addComment" method="post">
				<input type="hidden" name="activId" value="${activity.activId}">
				<input type="hidden" name="userId"
					value="${sessionScope.user.userId}">
				<textarea id="pubcom_input" name="cmtContent"></textarea>
				<div id="pubcom_button">
					<input type="submit" value="发布" id="pubcom_button1">
				</div>
			</form>
			<font color="red">${requestScope.message}</font>
		</div>
	</div>

	<c:if test="${empty requestScope.comments }">
		<div style="margin-left: 300px; font-size: 16px;">没有任何评论.</div>
	</c:if>
	<c:if test="${!empty requestScope.comments }">
		<c:forEach items="${requestScope.comments }" var="comments">
			<div id="comment_mem">
				<div style="height: 150px;">
					<div style="font-family: PingFang SC; font-size: 10px;">
						<a href="../getUserInfo/${comments.userId}"><img
							id="comment_mem_img" src="${comments.avatar}"></a>
						<p>${comments.userName}</p>
						<p>
							<fmt:formatDate value="${comments.cmtTime}"
								pattern="yyyy-MM-dd hh:mm:ss" />
						</p>
					</div>
					<div id="comment_comment">
						<div id="comment_msg">${comments.cmtContent}</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>


	<div id="black"></div>
</body>
</html>