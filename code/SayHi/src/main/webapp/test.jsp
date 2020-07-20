<%@ page contentType="text/html;charset=UTF-8"%>
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
			document.getElementById("address").value = address;
			//alert(addComp.city);
			//alert(address);
			//$("#apple").html(address);//显示到界面上
			//window.localStorage.city = addComp.city;//当前城市
			//window.localStorage.district = addComp.district;
		});
	}
</script>
</head>
<body>
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
		经度：<input type="hidden" id="jd" /> 纬度：<input type="hidden" id="wd" />
		<div id="apple"></div>
		<input type="text" id='address'> 
		<input type="button"
			value="获取位置" onclick="getPoi()"/>
	</form>
	</div>
</body>
</html>