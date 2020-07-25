<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="head.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=wVZmkbFMtlrRgkkqWuDHm6GNbS7ciKGA"></script>
<script type="text/javascript">
	//通过百度地图成功转化经纬度并显示到界面
	function getPoi() {
		var x = $("#jd").val();
		var y = $("#wd").val();
		let point = new BMap.Point(x, y);
		let gc = new BMap.Geocoder();

		gc.getLocation(point, function(rs) {
			let addComp = rs.addressComponents;
			//详细地址为省，市，行政区，街道，街道地址
			address = addComp.province + addComp.city + addComp.district
					+ addComp.street + addComp.streetNumber;
			document.getElementById("location").value = address;
			//alert(addComp.city);
			//alert(address);
			//$("#apple").html(address);//显示到界面上
			//window.localStorage.city = addComp.city;//当前城市
			//window.localStorage.district = addComp.district;
		});
	}
</script>
<title>首页</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>

body {
	background-image: url("static/image/index.png");
	 background-position: 50% 0px; 
	background-size: 66%;
	background-repeat: no-repeat;
}
#top{
/* box-shadow:2px 2px 2px 1px darkgray; */
border:none;
height:65px;
position:static;
background:transparent;
}
/* #loginbutton {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 16px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 1%;
	margin-top:10px;
} */

/* #registerbutton {
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
	margin-top:10px;
} */

#middle {
	padding-top: 300px;

	margin-left: 240px;

}
#middle1 {
	width: 1050px;
	height: 50px;
    border:solid;
	border-radius: 10px;
	border-width:1px;
	border-color:white;
	box-shadow:0px 2px 2px 1px #E0E0E0;
}

#activity {
	background-image: url(static/image/search.png);
	background-size: 12px 12px;
	background-position: 15px 7px;
	background-repeat: no-repeat;
	border: 1px solid #ddd;
	width: 40%;
	height: 30px;
	margin-top: 9px;
	margin-left: 2%;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	padding-left: 4%;
	float: left;
}

#location {
	border: 1px solid #ddd;
	width: 35%;
	height: 30px;
	margin-top: 9px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding-left: 4%;
	float: left;
}

#search {
	border-radius: 5px;
	width: 20%;
	height: 30px;
	float: left;
	margin-top: 10px;
	background: white;
	border-style: solid;
	border-width: 1px;
	float: left;
	color: #99CEE1;
	border-color: #99CEE1;
	margin-left: 1.5%;
}

#bottom {
	margin-top: 50px;
	width: 1050px;
	margin-left: 240px;
	margin-botton: 5%;
}

#all {
	float: right;
	margin-top: -30px;
	border-style: none;
	background: white;
	color: #5B91A5;
	font-size:16px;
}

h1 {
	font-size: 30px;
	font-family: "PingFang SC";
}

#img_a {
	height: 100px;
	width:200px;
	border-radius:5px;
	
}
#img_1 {
	height: 30px;
	width:30px;
	border-radius:50%; 
	overflow:hidden;
    float:left;
	margin-top:5px;
}

h4 {
	margin-top:5px;
	color: #9A8A72;
	font-size:12px;
}

h3 {
	font-size:13px;
	margin-top:-5px;
}

#getlocation {
	height: 15px;
	float: left;
	margin-top: 15px;
	margin-left: -350px;
}

#num {
	margin-left: 10px;
	font-size: 16px;
	color: #767676;
	padding-top:10px;
	float:left;
	
}
#mid_act1{
  margin-top:30px;
   float:left;
   margin-bottom:20px;
}
a{
 text-decoration:none;
  color:black;
}
#mid_type{
  margin-bottom:50px;
  padding-top:30px;
  
  
}
#no_msg{
  margin-top:40px;
  font-size:20px;
  color:darkgray;
}
#mid_act1{
  margin-right:15px;
}
#black{
  width:100%;
background-color:#F5F9FA;
  height:200px;
  margin-top:250px;
  float:left;
}
</style>
</head>
<body>

	<%-- <div id="top">
		<a href="index"><img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 45px;"></a>
		<c:if test="${empty sessionScope.user}">
			<a href="register1" id="registerbutton">注册</a>
			<a href="login1" id="loginbutton">登录</a>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="logout" id="registerbutton">退出</a>
			 
			<a href="myAttendingActiv" id="loginbutton">${sessionScope.user.userName}</a>
		<a href="myAttendingActiv"><img alt="" src="${sessionScope.user.avatar}" id="head_img"></a>
		</c:if>
	</div> --%>

	<div id="middle">
	<div id="middle1">
		<form action="${APP_PATH }/getAll/search" method="post">
			<input name="activName" type="text" id="activity" placeholder=" 活动名">
			<input type="text" id="location" placeholder=" 地点" name="address">
			<img alt="" src="${APP_PATH }/static/image/location.png" onclick="getPoi()"
				id="getlocation"> <input type="submit" value="搜索" id="search">
		</form>
	</div>
	</div>



	<div id="allmap"></div>
	<script type="text/javascript">
		var map = new BMap.Map("allmap");
		var point = new BMap.Point(116.331398, 39.897445);
		map.centerAndZoom(point, 12);

		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r) {
			if (this.getStatus() == BMAP_STATUS_SUCCESS) {
				var mk = new BMap.Marker(r.point);
				map.addOverlay(mk);
				map.panTo(r.point);
				document.getElementById("jd").value = r.point.lng;
				document.getElementById("wd").value = r.point.lat;
				//alert('您的位置：' + r.point.lng + ',' + r.point.lat);
			} else {
				alert('failed' + this.getStatus());
			}
		});
	</script>
	<div class="container">
		<form action="">
			<input type="hidden" id="jd" /> <input type="hidden" id="wd" />
		</form>
	</div>

	<div id="bottom">
		<div >
			<h1 style="font-size:42px;">活动推荐</h1>
			<a id="all" href="${APP_PATH }/getAll/全部+全部+全部+综合推荐">全部</a>
		</div>
		
		<div id="mid_type">
		<c:if test="${empty requestScope.activUsers }">
		<div style="margin-top:20px;"><div id="no_msg">没有任何活动信息</div></div>
		</c:if>
		<c:if test="${!empty requestScope.activUsers}">
			<c:forEach items="${requestScope.activUsers }" var="activUsers" begin="0" end="3">
				<div id="mid_act1">
					<div style="">
						<a href="index/${activUsers.activId}"><img
							src="${activUsers.activBill}" id="img_a"></a>
						<h4><fmt:formatDate value="${activUsers.activStart}" pattern="yyyy-MM-dd hh:mm:ss" /></h4>
						<a href="index/${activUsers.activId}"><h3>${activUsers.activName}</h3></a>
						<div id="buttom_buttom">
							<c:forEach items="${activUsers.userList }" var="userList">
								<a href="${APP_PATH }/getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
							</c:forEach>
							<div id="num">${activUsers.activNum}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		</div>
		<div id="mid_type">
		<div style="margin-top:200px;"><c:if test="${ !empty requestScope.userLabel1}">
				<h1 style="font-size:42px;">${ requestScope.userLabel1}</h1>
			</c:if>
			<a id="all" href="${APP_PATH }/getAll/${ requestScope.userLabel1}+全部+全部+综合推荐">全部</a></div>
		<c:if test="${empty requestScope.activUsers1 }">
		<div style="margin-top:20px;"><div id="no_msg">没有任何活动信息.</div></div>
		</c:if>
		<c:if test="${!empty requestScope.activUsers1}">
			<c:forEach items="${requestScope.activUsers1 }" var="activUsers1" begin="0" end="3">
				<div id="mid_act1">
					<div style="">
						<a href="${APP_PATH }/index/${activUsers1.activId}"><img
							src="${activUsers1.activBill}" id="img_a"></a>
						<h4><fmt:formatDate value="${activUsers1.activStart}" pattern="yyyy-MM-dd hh:mm:ss" /></h4>
						<a href="${APP_PATH }/index/${activUsers1.activId}"><h3>${activUsers1.activName}</h3></a>
						<div id="buttom_buttom">
							<c:forEach items="${activUsers1.userList }" var="userList">
								<a href="${APP_PATH }/getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
							</c:forEach>
							<div id="num">${activUsers1.activNum}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
         </div>
         <div id="mid_type">
		<div style="margin-top:250px;"><c:if test="${ !empty requestScope.userLabel2}">
				<h1 style="font-size:42px;">${ requestScope.userLabel2}</h1>
			</c:if>
			<a id="all" href="${APP_PATH }/getAll/${ requestScope.userLabel2}+全部+全部+综合推荐">全部</a></font></div>
		<c:if test="${empty requestScope.activUsers2 }">
		<div style="margin-top:10px;"><div id="no_msg">没有任何活动信息.</div></div>
		</c:if>
		<c:if test="${!empty requestScope.activUsers2}">
			<c:forEach items="${requestScope.activUsers2 }" var="activUsers2" begin="0" end="3">
				<div id="mid_act1" ">
					<div >
						<a href="${APP_PATH }/index/${activUsers2.activId}"><img
							src="${activUsers2.activBill}" id="img_a"></a>
					<h4><fmt:formatDate value="${activUsers2.activStart}" pattern="yyyy-MM-dd hh:mm:ss" /></h4>
						<a href="${APP_PATH }/index/${activUsers2.activId}"><h3>${activUsers2.activName}</h3></a>
						<div id="buttom_buttom">
							<c:forEach items="${activUsers2.userList }" var="userList">
								<a href="${APP_PATH }/getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
							</c:forEach>
							<div id="num">${activUsers2.activNum}</div>
						</div>
					</div>
				</div>
				
			</c:forEach>
		</c:if>
		</div>
	</div>
	<div id="black"></div>
</body>
</html>