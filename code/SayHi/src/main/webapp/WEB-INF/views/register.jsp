<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="head.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<style>
#top {
	border-bottom-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	height: 50px;
	width: 88%;
	margin-left: 10%;
	
}

img {
	height: 30px;
}
#login1{
    padding-top:30px;
}
#login {
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	margin-top: 3%;
	height: 600px;
	width: 50%;
	margin-left: 25%;
	margin-right: 25%;
	border-radius: 5px;
}

#logintop {
	border-style: solid;
	border-color: #5B91A5;
	border-width: 1px;
	height: 80px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	background-color: #5B91A5;
}

#users {
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	border-radius: 5px;
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	height: 50px;
	margin-top: -1%;
	padding-left: 2%;
}

#password {
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	border-radius: 5px;
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	height: 50px;
	margin-top: -1%;
	padding-left: 2%;
}

#passwordConfig {
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	border-radius: 5px;
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	height: 50px;
	margin-top: -1%;
	padding-left: 2%;
}

#button1 {
	margin-left: 5%;
	margin-top: 5%;
	width: 15%;
	height: 30px;
	background-color: #d8d8d8;
	cursor: pointer;
	color: white;
	border-radius: 5px;
	outline: 0;
	font-size: 16px;
	border-style: solid;
	border-color: #d8d8d8;
	border-width: 1px;
	font-family: "PingFang SC";
	visibility: visible;
}

#button1:hover {
	background-color: #5B91A5;
}


h1 {
	font-family: "PingFang SC";
	color: white;
}
</style>
<script language="javascript">
function checkPassword()
{
 if(document.getElementById("password").value==null||document.getElementById("password").value=="")
 {
  document.getElementById("spanPassword").innerHTML = "<font color='red' style='margin-left:50px'>请输入密码 </font>";
  return false;
 }
}

function checkPasswordConfig()
{
 var a=document.getElementById("password").value;
 var b=document.getElementById("passwordConfig").value;
 if(a!="") document.getElementById("spanPassword").innerHTML = "";
 if(b==null||b=="")
 {
  document.getElementById("spanPasswordConfig").innerHTML = "<font color='red' style='margin-left:50px'>请您确认密码！ </p>";
  return false;
 }
 if(a!=b)
 {
  document.getElementById("spanPasswordConfig").innerHTML = "<font color='red'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp您两次输入的密码不一致！ </font>";
  return false;
 }
 
 if(a==b)
	 {
/* 	 document.getElementById("button3").style.visibility="visible";
	 document.getElementById("button1").style.visibility="hidden"; */
	 document.getElementById("spanPasswordConfig").innerHTML = "<font color='red'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp密码一致！ </font>";
	 }
}

function tip(){
	var a=document.getElementById("password").value;
	var b=document.getElementById("passwordConfig").value;
	
	if(users.value!=""&&a==b&&a!="")
	window.alert("注册成功！");
	else
	window.alert("注册失败！");
}
</script>
</head>
<body>

	<!-- <div id="top">
		<a href="index"><img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px;"></a>
	</div> -->
<div id="login1">
	<div id="login">
		<div id="logintop">
			<h1 style="padding-left: 5%;">注册</h1>
		</div>
		<div id="loginbottom">
			<form action="register" method="post">
				<div id="user">
					<h3 style="padding-left: 5%; margin-top: 5%;">账号:</h3>
					<input type="text" id="users" name="userName" onkeyup=checkPassword()>
				</div>
				<div id="psw">
					<h3 style="padding-left: 5%; margin-top: 5%;">密码:</h3>
					<input type="password" id="password" name="password"
						onkeyup=checkPasswordConfig()><span id="spanPassword"></span>
				</div>
				<div id="comfirm">
					<h3 style="padding-left: 5%; margin-top: 5%;">确认密码:</h3>
					<input type="password" id="passwordConfig"
						onkeyup=checkPasswordConfig()><span
						id="spanPasswordConfig"></span>
				</div>
				<div id="button">
					<input type="submit" value="注册" id="button1" onclick=tip()>
					<c:if test="${!empty requestScope.msg}"></c:if>
					<font color="red">
						${requestScope.message }
					</font>
				</div>
			</form>
		</div>

        </div>
	</div>
</body>
</html>