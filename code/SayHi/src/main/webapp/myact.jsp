<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我发起的</title>

<style>
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
	width:50px;
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
   margin-left:1170px;
}
body{
   background-image:url(image/publish.png);
   background-position:50px 50px;
   background-size:1350px 330px;
   background-repeat:no-repeat;
}
#mid{
   width:1130px;
   height:470px;
   border:solid;
   border-top-color:#F7F7F7;
   border-bottom-color:#B1B1B1;
   border-left-color:#D3D3D3;
   border-right-color:#D3D3D3;
   margin-top:330px;
   margin-left:250px;
   margin-bottom:100px;
   border-radius:5px;
}
#mid_msg_table1{
 
   margin-left:80px;
	
}
#mid_msg_table2{
   margin-top:20px;
   margin-left:80px;
	
}
#th1{
   width:70px;
   font-size:17px;
   font-family:"PingFang SC";
   height:30px;
   border-bottom:solid;
   border-color:white;
   
}
#th2{
   width:70px;
   font-size:17px;
   font-family:"PingFang SC";
   height:30px;
   border-bottom:solid;
   border-color:#5B91A5;
}
#th_bom{
  width:100px;
   font-size:16px;
   font-family:"PingFang SC";
   height:30px;
}
#th_bom:hover{

background-color: #BFBFBF;

}
#th_bom1{
    width:100px;
    font-size:16px;
    font-family:"PingFang SC";
    height:50px;
    background:#5B91A5;
    border-style: solid;
    border-color: #5B91A5;
	border-width: 1px;
	color:white;
	border-bottom-left-radius:5px;
	border-bottom-right-radius:5px;
}
#mid_act{
     margin-left:50px;
     margin-top:50px;
    }
#mid_act1{
    margin-left:30px;
  
    float:left;
}


#img_a{
  height:140px;
  width:250px;
}
#img_1{
  height:20px;
  width:20px;
  position:absolute;
 
}
#img_2{
  height:20px;
  width:20px;
  position:absolute;
  margin-left:15px;
}
#img_3{
  height:20px;
  width:20px;
  position:absolute;
  margin-left:30px;
}
h4{
   margin-top:10px;
    color:#9A8A72;
    font-size:14px;
     font-family:"PingFang SC";
}
h3{
   margin-top:-8px;
   font-size:15px;
    font-family:"PingFang SC";
}
#delete{
   width:250px;
   height:25px;
   font-size:16px;
    font-family:"PingFang SC";
    background:#5B91A5;
    border-style: solid;
    border-color: #5B91A5;
	border-width: 1px;
	color:white;
	border-radius:5px;
	margin-top:10px;
	
}
#num{
   margin-left:70px;
   font-size:15px;
   color:#767676;
}
</style>
</head>

<body>

<div id="top">
		<img alt="" src="image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"> 
			<img src="image/ren.jpg" id="head_imag">
			<a href=""><input
			 value="退出" id="quit"></a>
		<div id="user">
			<p style="float:right;"><a href="" >某某某</a></p>
		</div>

	</div>

<div id="mid">
    <div id="mid_msg">
    <table id="mid_msg_table1">
        <tr>
            <th id="th_bom1" ><a>进行中的活动</a></th>
            <th id="th_bom"><a>活动历史</a></th>
            <th id="th_bom"><a>我的账号</a></th>
             <th id="th_bom"><a>消息</a></th>
       </tr>
    </table>
       <table id="mid_msg_table2">
         <tr>
            <th id="th1"><a>全部</a></th>
            <th id="th2"><a>我发起的</a></th>
         </tr>
       
       </table>
    </div>
    
    <div id="mid_act">
    <div id="mid_act1">
         <div style="float:left">
         <img src="image/ren.jpg" id="img_a">
         <h4>星期六，8/1，2:00，下午</h4>
         <h3>公园野餐</h3>
         <div id="buttom_buttom">
      <img id="img_1" src="image/search.png">
      <img id="img_2" src="image/search.png">
      <img id="img_3" src="image/search.png">
      <div id="num">16</div>
      <input type="submit" id="delete" value="删除活动">
    </div>
       </div>
      
    </div>
    
    <div id="mid_act1">
         <div style="float:left">
         <img src="image/ren.jpg" id="img_a">
         <h4>星期六，8/1，2:00，下午</h4>
         <h3>公园野餐</h3>
         <div id="buttom_buttom">
      <img id="img_1" src="image/search.png">
      <img id="img_2" src="image/search.png">
      <img id="img_3" src="image/search.png">
      <div id="num">16</div>
      <input type="submit" id="delete" value="删除活动">
    </div>
       </div>
      
       </div>
    </div>
</div>
</body>
</html>