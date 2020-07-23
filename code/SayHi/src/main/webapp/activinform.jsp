<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客戶订单信息</title>
<link href="static/css/activinform.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/js/geo2.js"></script>
<script type="text/javascript" src="static/js/jquery-3.4.1.js"></script>
<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
	background: url(static/image/back_admin.png) no-repeat;
	float: right;
}

#inform::-webkit-scrollbar {
	width: 0px;
}
</style>
	<script type="text/javascript">
	$(document).ready(function(){
			
			$("#order_table").css("background-color","#8DB9CF");
			$("body").on("load",init());
		});
	</script>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<form action="clientOrderServlet" method="get">
		<div id="counter">
			<div id="inform">
				<div id="inform_top">
					<a href=""><img src="static/image/return_admin.png" id="img_return"></a>
					<input type="image" src="static/image/modify_admin.png" id="img_modify">
				</div>

				<div id="context">
					<div id="order">
						<div class="inform_top">活动信息:</div>
						<div id="order_inform" class="inform_table">
							<table style="border-collapse: separate; border-spacing: 19px;">
								<tr>
									<td style="width: 100px;">活动名:</td>
									<td><input type="text" name="activName" value=""></td>
								</tr>
								<tr>
									<td>活动地点:</td>
									<td><select class="pc" name="province" id="param_province"
										onchange="provincechange(this.selectedIndex)"><option></option></select>
										<select class="pc" name="city" id="param_city"><option>城市</option></select>
									</td>
								</tr>
								<tr>
									<td></td>
									<td><textarea name="activAddress"
											placeholder="详细地址信息,如街道、门牌号、小区、楼栋号、单元等信息" class="textarea"></textarea>

									</td>
								</tr>
								<tr>
									<td>开始时间:</td>
									<td class="activStarttime"></td>
								</tr>
								<tr>
									<td>结束时间:</td>
									<td class="activEndtime"></td>
								</tr>
								<tr>
									<td style="padding-bottom: 60px;">活动标签:</td>
									<td id="label_select">
										<ul class="label">
											<li><div class="type_li">摄影</div></li>
											<li><div class="type_li">食品</div></li>
											<li><div class="type_li">电影</div></li>
										</ul>
										<ul class="label">
											<li><div class="type_li">宠物</div></li>
											<li><div class="type_li">艺术</div></li>
											<li><div class="type_li">运动</div></li>
										</ul>
										<ul class="label">
											<li><div class="type_li">游戏</div></li>
											<li><div class="type_li">写作</div></li>
											<li><div class="type_li">科技</div></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td style="vertical-align: top;">活动简介:</td>
									<td><textarea name="activBrief"
											placeholder="关于活动开展的方式以及大概流程、要求等..." class="textarea"
											style="height: 60px;"></textarea></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">特别限制:</td>
									<td><textarea name="limitExplain"
											placeholder="关于参加活动需要注意的事项、参加条件等..." class="textarea"></textarea>
									</td>
								</tr>
								<tr>
									<td>期望人数:</td>
									<td><input type="text" name="expNum" style="width: 150px;"
										value=""> <!-- <font>人数不限</font>
									<input type="checkbox" name="expNumPlus" style="width: 40px; background-color: white;" /> -->
									</td>

								</tr>
								<tr>
									<td>活动海报:</td>
									<td><input type="text" name="activBill"
										style="width: 250px;" value=""> <!-- <img src="images/tx3.png" style="width: 292px;"> -->
										<!-- <input type="button" name="activBill"  style="width: 100px;height: 25px;" value="文件上传"> -->
									</td>
								</tr>
								<tr>
									<td>点赞人数:</td>
									<td><input type="text" name="favorNum"
										style="width: 292px;" value=""></td>
								</tr>
								<tr>
									<td>评论人数:</td>
									<td><input type="text" name="cmtNum" style="width: 292px;"
										value=""></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>
</body>
</html>