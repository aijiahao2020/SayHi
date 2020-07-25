<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发起活动</title>
<style type="text/css">
#top{
   border-bottom:solid;
   border-width:2px;
   border-color:darkgray;
}
#quit{
cursor: pointer; 
   border:none;
   background:white;
   outline: 0;
  font-size: 14px;
 color:gray;
    font-family:"PingFang SC";
     margin-right:3%;
     margin-top:14px;
    float:right;
}
#user{
    margin-right:1%;
   font-size: 14px;
    font-family:"PingFang SC";
    float:right;
}
#publish{
    width:80%;
    margin-left:10%;
    height:800px;
    border-style:solid;
    border-width:1.5px;
    border-color:#AFAFAF;
    margin-top:30px;
    
}
#title{
   width:15%;
   border-style:solid;
   border-color:#AFAFAF;
   border-width:1px;
   background-color:#5C91A5;
   color:white;
   border-bottom-right-radius:5px;
   height:40px;
}
#title_wd{
   font-size: 20px;
   font-family:"PingFang SC";
   padding-top:5px;
}
#act_name{
   margin-left:30%;
   font-size:18px;
   font-family:PingFang SC;
}
#act_name_input{
  margin-left:5%;
  width:30%;
  border-radius:5px;
  border-width:1px;
}
#act_location{
   margin-left:30%;
   font-size:18px;
   font-family:PingFang SC;
   margin-top:20px;
}
#act_location_input{
   margin-top:10px;
   margin-left:40%;
   width:20%;
   height:70px;
   border-radius:5px;
  border-width:1px;
}
#act_starttime{
   margin-left:30%;
   font-size:18px;
   font-family:PingFang SC;
   margin-top:20px;
}
#act_endtime{
   margin-left:30%;
   font-size:18px;
   font-family:PingFang SC;
   margin-top:20px;
}
#act_tag{
 margin-left:30%;
   font-size:18px;
   font-family:PingFang SC;
   margin-top:20px;
  
}

</style>
<script type="text/javascript"  src="Script/aaa.js" language="javascript">

	$(document).ready(function(){

		addressInit('cmbProvince', 'cmbCity', 'cmbArea');  

		});
	

</script>

</head>
<body>
<div id="top">
    <img alt="" src="static/image/SayHi.png" style="padding-top:10px;padding-left:20px;height:30px;">
     <input type="submit" value="退出" id="quit">
    <div id="user"><p><a href="myAttendingActiv">${sessionScope.user.userName}</a></p></div>
   
</div>

<div id="publish">

<div id="title">
  <center><div id="title_wd">发起活动</div> </center>
</div>

<div id="act">
      <div id="act_name">
                        活动名:
           <input type="text" id="act_name_input">
      </div>
      <div id="act_location">
                       活动地点:
           <select class="form-control" id="cmbProvince" name="cmbProvince" ></select>
           <select class="form-control" id="cmbCity" name="cmbCity" ></select>
            <select class="form-control" id="cmbArea" name="cmbArea" ></select>
      </div>
       <input type="text" id="act_location_input">
       
       <div id="act_starttime">
                    开始时间:
          <select style="margin-left:3%">
          
          </select>
          
          <select style="margin-left:1%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
          <select style="margin-left:1%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
          <select style="margin-left:1%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
       </div>
       <div id="act_endtime">
                    结束时间:
          <select style="margin-left:3%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
          
          <select style="margin-left:1%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
          <select style="margin-left:1%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
          <select style="margin-left:1%">
          <option value="河南">河南</option>
           <option value="湖北">湖北</option>
          </select>
       </div>
       <div id="act_tag">
               活动标签:
       <input type="checkbox" style="margin-left:3%;">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       <input type="checkbox">爬山
       </div>
       

</div>
</div>
</body>
</html>