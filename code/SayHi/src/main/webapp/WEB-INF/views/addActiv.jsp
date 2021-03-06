<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="head.jsp" />
<!DOCTYPE html>
<html class="ui-mobile">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发起活动</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%-- <script type="text/javascript" src="${APP_PATH }/static/js/geo2.js"></script> --%>
<script type="text/javascript" src="${APP_PATH }/static/js/jsAddress.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {

		$("#order_table").css("background-color", "#8DB9CF");
		$("body").on("load", init());
	});
</script> -->
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

#top {
	border:none;
height:65px;
position:static;
background:transparent;
}

#quit {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 14px;
	color: gray;
	font-family: "PingFang SC";
	margin-right: 70px;
	margin-top: 14px;
	float: right;
	width: 50px;
}

#head_imag {
	height: 30px;
	width: 30px;
	float: right;
	border-radius: 50%;
	overflow: hidden;
	margin-top: 7px;
	margin-right: 5px;
}

#user {
	margin-right: 1%;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
}

#publish {
	width: 60%;
	margin-left: 20%;
	height: 800px;
	border-style: solid;
	border-width: 2px;
	border-color: #AFAFAF;
	margin-top: 30px;
}

#title {
	width: 15%;
	border-style: solid;
	border-color: #AFAFAF;
	border-width: 1px;
	background-color: #5C91A5;
	color: white;
	border-bottom-right-radius: 5px;
	height: 40px;
}

#title_wd {
	font-size: 20px;
	font-family: "PingFang SC";
	padding-top: 5px;
}

#act_name {
	margin-left: 290px;
	font-size: 18px;
	font-family: PingFang SC;
}

#act_name_input {
	margin-left: 4%;
	width: 30%;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
}

#act_location {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_location_input {
	margin-top: 10px;
	margin-left: 380px;
	width: 20%;
	height: 70px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	font-size: 13px;
	font-family: PingFang SC;
}

#act_starttime {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}
#act{
   margin-top:30px;
}
#act_endtime {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_tag {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_tag_select {
	margin-left: 30px;
	width: 60px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	font-size: 14px;
	font-family: PingFang SC;
}

#act_tag_select_option {
	margin-left: 50px;
}

#act_introduce_input {
	margin-top: -23px;
	margin-left: 110px;
	width: 280px;
	height: 100px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	font-size: 13px;
	font-family: PingFang SC;
}

#act_introduce {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_limit_input {
	margin-top: 10px;
	margin-left: 18px;
	width: 280px;
	height: 50px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	margin-top: -23px;
	margin-left: 110px;
	font-size: 13px;
	font-family: PingFang SC;
}

#act_limit {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_num_input {
	margin-top: 10px;
	margin-left: 18px;
	width: 140px;
	height: 20px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
}

#act_num {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_poster_input {
	margin-top: 10px;
	margin-left: 18px;
	width: 140px;
	height: 20px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
}

#act_poster {
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
	margin-top: 20px;
}

#act_poster_button {
	height: 20px;
	width: 80px;
	background-color: #AFAFAF;
	color: white;
	border: none;
	font-family: PingFang SC;
	font-size: 12px;
	margin-left: 20px;
	border-radius: 3px;
}

#act_button {
	height: 40px;
	width: 200px;
	background-color: #AFAFAF;
	color: white;
	border: none;
	font-family: PingFang SC;
	font-size: 15px;
	border-radius: 5px;
	margin-top: 50px;
}

#province {
	margin-left: 30px;
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	font-size: 14px;
	font-family: PingFang SC;
}

#city {
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	font-size: 14px;
	font-family: PingFang SC;
}

#county {
	border-radius: 5px;
	border-width: 1.5px;
	border-color: #8F8F8F;
	font-size: 14px;
	font-family: PingFang SC;
}
#black{
  width:100%;
background-color:#F5F9FA;
  height:200px;
  margin-top:250px;
  float:left;
}
</style>
<!-- <script type="text/javascript" src="static/js/jsAddress.js"></script> -->
<script src="static/js/My97DatePicker/WdatePicker.js"></script>

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

	<div id="publish">

		<div id="title">
			<center>
				<div id="title_wd">发起活动</div>
			</center>
		</div>
		
		<%-- <c:if test="${requestScope.isAdd != '未提交'}">
		<c:if test="${requestScope.isAdd}">
			<center><font>发布成功</font></center>
			<c:if test="${!requestScope.isAdd}">
			<center><font>发布失败</font></center>
			</c:if>
			</c:if>
		</c:if> --%>
		<div id="act">
			<form action="${APP_PATH }/addActiv" method="post"
				enctype="multipart/form-data" onsubmit="get();">
				<input type="hidden" name="userId"
					value="${sessionScope.user.userId}">
				<div id="act_name">
					活动名: <input value="${activity.activName}" type="text" id="act_name_input" name="activName">
				</div>


				<div id="act_location">
					活动地点:
					 <select id="province" runat="server" name="activState"
						onchange="provincechange(this.selectedIndex)">
					</select> <select id="city" runat="server" name="activCity">
					</select>
					 <script type="text/javascript">
						setup()
					</script>
				</div>
				<!-- 具体地址 -->
				<textarea id="act_location_input" name="activAddress">${activity.activAddress}</textarea>


				<div id="act_starttime">
					开始时间： <input value="<fmt:formatDate value="${activity.activStarttime}" pattern="yyyy-MM-dd hh:mm:ss" />" name="activStarttime" type="datetime"
						class="Wdate form-controls"
						onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}'})"
						id="startDate"
						style="margin-left: 13px; border-width: 1.5px; border-color: #8F8F8F;">
				</div>
				<div id="act_endtime">
					结束时间： <input value="<fmt:formatDate value="${activity.activEndtime}" pattern="yyyy-MM-dd hh:mm:ss" />" name="activEndtime" type="datetime"
						class="Wdate form-controls"
						onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'startDate\')}'})"
						id="endDate"
						style="margin-left: 13px; border-width: 1.5px; border-color: #8F8F8F;">
				</div>

				<div id="act_tag">
					活动标签: <select  id="act_tag_select" name="activLabel"
						style="margin-left: 30px; width: 60px; border-radius: 5px; border-width: 1.5px; border-color: #8F8F8F; font-size: 14px; font-family: PingFang SC;">
						<%-- <c:if test="${activity.activLabel=='摄影'}"> --%>
						<option selected="selected" value="摄影">摄影</option>
						<c:if test=""></c:if>
						<option value="食品">食品</option>
						<option value="电影">电影</option>
						<option value="宠物">宠物</option>
						<option value="艺术">艺术</option>
						<option value="运动">运动</option>
						<option value="游戏">游戏</option>
						<option value="写作">写作</option>
						<option value="科技">科技</option>
					</select>
				</div>
				<div id="act_introduce">
					<div>活动介绍：</div>
					<textarea id="act_introduce_input" name="activBrief">${activity.activBrief}</textarea>

				</div>
				<div id="act_limit">
					<div>特别限制：</div>
					<textarea id="act_limit_input" name="limitExplain">${activity.limitExplain}</textarea>

				</div>

				<div id="act_num">
					期望人数： <input value="${activity.expNum}" type="text" id="act_num_input" name="expNum" />
					<!-- <div
			style="margin-left: 300px; margin-top: -23px; font-size: 12px; color: #AFAFAF">
						不限制 <input type="checkbox">
					</div> -->
				</div>

				<div id="act_poster">
					活动海报： <input type="file" name="file">
				</div>

				<center>
					<input type="submit" id="act_button" value="确认发布">
				</center>
			</form>
		</div>
	</div>
	<div id="black"></div>
</body>
</html>