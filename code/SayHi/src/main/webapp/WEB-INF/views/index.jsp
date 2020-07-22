<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
body {
	background-image: url(image/index.png);
	background-position: 250px 50px;
	background-size: 1050px 270px;
	background-repeat: no-repeat;
}

#loginbutton {
	cursor: pointer;
	border: none;
	background: white;
	outline: 0;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 1%;
}

#registerbutton {
	cursor: pointer;
	color: black;
	outline: 0;
	background: white;
	font-size: 14px;
	border-left: solid;
	border-right: none;
	border-top: none;
	border-bottom: none;
	border-width: 1px;
	font-family: "PingFang SC";
	float: right;
	margin-right: 3%;
	padding-left: 1%;
}

#middle {
	margin-top: 300px;
	border: 1px solid #ddd;
	width: 1050px;
	height: 50px;
	margin-left: 240px;
	border-radius: 10px;
}

#activity {
	background-image: url(image/search.png);
	background-size: 12px 12px;
	background-position: 5px 9px;
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
	margin-top: -4%;
	border-style: none;
	background: white;
	color: #99CEE1;
}

h1 {
	font-size: 30px;
	font-family: "PingFang SC";
}

#img_a {
	height: 100px;
}

h4 {
	margin-top: -0.5%;
	color: #9A8A72;
}

h3 {
	margin-top: -1.5%
}

#getlocation {
	height: 15px;
	float: left;
	margin-top: 15px;
	margin-left: -350px;
}

#num {
	margin-left: 70px;
	font-size: 15px;
	color: #767676;
}
</style>
</head>
<body>

	<div id="top">
		<img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;">
		<c:if test="${empty sessionScope.user}">
			<a href="register1" id="registerbutton">注册</a>
			<a href="login1" id="loginbutton">登录</a>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
			<a href="logout" id="registerbutton">退出</a>
			<%-- <img alt="" src="${sessionScope.user.avatar}" style="size: 10px "> --%>
			<a href="myAttendingActiv" id="loginbutton">${sessionScope.user.userName}</a>
		</c:if>
	</div>

	<div id="middle">
		<form action="search" method="post">
			<input name="activName" type="text" id="activity" placeholder=" 活动名">
			<input type="text" id="location" placeholder=" 地点" name="address">
			<img alt="" src="static/image/location.png" onclick="getPoi()"
				id="getlocation"> <input type="submit" value="搜索" id="search">
		</form>
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
		<div id="bottom_top">
			<h1>活动推荐</h1>
			<a id="all" href="getAll">全部</a>
		</div>
		<c:if test="${empty requestScope.activityUsers }">
		没有任何活动信息.
		</c:if>
		<c:if test="${!empty requestScope.activityUsers}">
			<c:forEach items="${requestScope.activityUsers }" var="activityUsers">
				<div id="mid_act1">
					<div style="float: left">
						<a href="index/${activityUsers.activId}"><img
							src="${activityUsers.activBill}" id="img_a"></a>
						<h4>${activityUsers.activStart}</h4>
						<a href="index/${activityUsers.activId}"><h3>${activityUsers.activName}</h3></a>
						<div id="buttom_buttom">
							<c:forEach items="${activityUsers.userList }" var="userList">
								<a href="getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
							</c:forEach>
							<div id="num">${activityUsers.activNum}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<div><font size="20px">${ requestScope.userLabel1}</font></div>
		<c:if test="${empty requestScope.activUsers1 }">
		没有任何活动信息.
		</c:if>
		<c:if test="${!empty requestScope.activUsers1}">
			<c:forEach items="${requestScope.activUsers1 }" var="activUsers1">
				<div id="mid_act1">
					<div style="float: left">
						<a href="index/${activUsers1.activId}"><img
							src="${activUsers1.activBill}" id="img_a"></a>
						<h4>${activUsers1.activStart}</h4>
						<a href="index/${activUsers1.activId}"><h3>${activUsers1.activName}</h3></a>
						<div id="buttom_buttom">
							<c:forEach items="${activUsers1.userList }" var="userList">
								<a href="getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
							</c:forEach>
							<div id="num">${activUsers1.activNum}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<div><font size="20px">${ requestScope.userLabel2}</font></div>
		<c:if test="${empty requestScope.activUsers2 }">
		没有任何活动信息.
		</c:if>
		<c:if test="${!empty requestScope.activUsers2}">
			<c:forEach items="${requestScope.activUsers2 }" var="activUsers2">
				<div id="mid_act1">
					<div style="float: left">
						<a href="index/${activUsers2.activId}"><img
							src="${activUsers2.activBill}" id="img_a"></a>
						<h4>${activUsers2.activStart}</h4>
						<a href="index/${activUsers2.activId}"><h3>${activUsers2.activName}</h3></a>
						<div id="buttom_buttom">
							<c:forEach items="${activUsers2.userList }" var="userList">
								<a href="getUserInfo/${userList.userId}"><img id="img_1" src="${userList.avatar}"></a>
							</c:forEach>
							<div id="num">${activUsers2.activNum}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>