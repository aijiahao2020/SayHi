<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html class="ui-mobile">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发起活动</title>
<style type="text/css">
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
	margin-right: 3%;
	margin-top: 14px;
	float: right;
}

#user {
	margin-right: 1%;
	font-size: 14px;
	font-family: "PingFang SC";
	float: right;
}

#publish {
	width: 80%;
	margin-left: 10%;
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
	margin-left: 30%;
	font-size: 18px;
	font-family: PingFang SC;
}

#act_name_input {
	margin-left: 5%;
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
	margin-left: 39%;
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
</style>
<script type="text/javascript" src="static/js/jsAddress.js"></script>
<script src="static/js/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
	<div id="top">
		<img alt="" src="static/image/SayHi.png"
			style="padding-top: 10px; padding-left: 20px; height: 30px;"> <input
			type="submit" value="退出" id="quit">
		<div id="user">
			<p>某某某</p>
		</div>

	</div>

	<div id="publish">

		<div id="title">
			<center>
				<div id="title_wd">发起活动</div>
			</center>
		</div>

		<div id="act">
			<form action="addActiv" method="post" enctype="multipart/form-data"
				onsubmit="get();">
				<div id="act_name">
					活动名: <input type="text" id="act_name_input" name="activName">
				</div>


				<div id="act_location">
					活动地点: <select id="province" runat="server" name="activState"
						onchange="provincechange(this.selectedIndex)">
					</select> <select id="city" runat="server" name="activCity">
					</select>
					<!-- <select id="county" runat="server" >
				</select> -->
					<!-- <input  id="activState" value="" name="activState" >
				<input  id="activCity" value=""  name="activCity" > -->
					<script type="text/javascript">
						setup()
					</script>
				</div>
				<!-- 具体地址 -->
				<textarea id="act_location_input" name="activAddress"></textarea>


				<div id="act_starttime">
					开始时间：
					<input name="activStarttime" type="datetime"
						class="Wdate form-controls"
						onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}'})"
						id="startDate"
						style="margin-left: 13px; border-width: 1.5px; border-color: #8F8F8F;">
				</div>
				<div id="act_endtime">
					结束时间： <input name="activEndtime"  type="datetime" class="Wdate form-controls"
						onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'startDate\')}'})"
						id="endDate" style="margin-left: 13px; border-width: 1.5px; border-color: #8F8F8F;">
				</div>

				<div id="act_tag">
					活动标签: <select id="act_tag_select" name="activLabel"
						style="margin-left: 30px; width: 60px; border-radius: 5px; border-width: 1.5px; border-color: #8F8F8F; font-size: 14px; font-family: PingFang SC;">
						<option value="爬山">爬山</option>
						<option value="科技">科技</option>
						<option value="人文">人文</option>
						<option value="足球">足球</option>
						<option value="电影">电影</option>
						<option value="轰趴">轰趴</option>
					</select>
				</div>


				<div id="act_introduce">
					<div>活动介绍：</div>
					<textarea id="act_introduce_input" name="activBrief"></textarea>

				</div>
				<div id="act_limit">
					<div>特别限制：</div>
					<textarea id="act_limit_input" name="limitExplain"></textarea>

				</div>

				<div id="act_num">
					期望人数： <input type="text" id="act_num_input" name="expNum" />
					<!-- <div
			style="margin-left: 300px; margin-top: -23px; font-size: 12px; color: #AFAFAF">
						不限制 <input type="checkbox">
					</div> -->
				</div>

				<div id="act_poster">
					活动海报：
					<input type="file" name="file">
				</div>

				<center>
					<input type="submit" id="act_button" value="确认发布">
				</center>
			</form>
		</div>
	</div>
</body>
</html>