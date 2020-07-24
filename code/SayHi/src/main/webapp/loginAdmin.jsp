<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<style>
body{
   font-family: "PingFang SC";
}

#head {
  margin:100px auto 80px auto;
  height:170px;
  width:317px;
}
#head_img{
  height:170px;
  width:317px;
}
#bottom{
   margin:0 auto;
   width:470px;
   height:300px;
   border:solid;
   border-radius:5px;
   border-width:1px;
    border-top-color:#F7F7F7;
   border-bottom-color:#B1B1B1;
   border-left-color:#D3D3D3;
   border-right-color:#D3D3D3;
}
#bottom_msg{
   font-size:18px;
   color:#CBCACA;
   margin-top:40px;
   margin-left:150px;
}
#bottom_account{
   margin-top:50px;
   margin-left:50px;
   font-size:18px;
   color:#CBCACA;
}
#bottom_account_input{
   margin-left:30px;
   width:260px;
   height:30px;
   border:solid;
   outline: 0;
   color:#607d8b;
   padding-left:10px;
   border-color:#CBCACA;
   border-radius:5px;
   border-width:1px;
   
}
#bottom_password{
   margin-top:20px;
   margin-left:50px;
   font-size:18px;
   color:#CBCACA;
}
#bottom_password_input{
   margin-left:30px;
   width:260px;
   height:30px;
   border:solid;
   outline: 0;
   color:#607d8b;
   padding-left:10px;
   border-color:#CBCACA;
   border-radius:5px;
   border-width:1px;
}
#bottom_login{
   border:none;
   outline: 0;
   background-color:#CBCACA;
   color:white;
   font-size:15px;
   margin-left:160px;
   margin-top:40px;
   width:150px;
   height:30px;
   cursor: pointer;
   border-radius:5px;
}
</style>
</head>
<body>
<div id="head">
    <img src="static/image/sayhi_admin.png" id="head_img">
</div>
 <div id="bottom">
      <div id="bottom_msg">SayHi后台管理平台</div> 
      <form action="loginAdmin" method="post">
      <div id="bottom_account">账号:<input id="bottom_account_input" type="text" name="adminName"></div>
      <div id="bottom_password">密码:<input id="bottom_password_input" type="password" name="password"></div>
      <div><input id="bottom_login" value="登录" type="submit"></div>
      </form>
</div>
</body>
</html>