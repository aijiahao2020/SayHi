<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动信息</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/css/activinform.css" rel="stylesheet"
	type="text/css" />

<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
	
	float: right;
}

#inform_top {
	width: 1000px;
	height: 119px;
	position:fixed;
	background-color:white;
}
#inform_top_info {
	width: 800px;
	height: 30px;
	margin: 60px auto 0 auto;
	font-size: 20px;
	margin-left: 108px;
	margin-bottom: 26px;
	position:fixed;
	background-color:white;
}

#inform_top_block {
	width: 1000px;
	height: 119px;
}

#inform::-webkit-scrollbar {
	width: 0px;
}
#billSelect {
	width: 292px;
    height: 30px;
    border:0;
    outline: 0;
}
</style>
<script src="${APP_PATH }/static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/geo2.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/window.js"></script>
<link href="${APP_PATH }/static/css/window.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//转化时间格式
	/* var format = function(time, format) {
		var t = new Date(time);
		var tf = function(i) {
			return (i < 10 ? '0' : '') + i
		};
		return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a) {
			switch (a) {
			case 'yyyy':
				return tf(t.getFullYear());
				break;
			case 'MM':
				return tf(t.getMonth() + 1);
				break;
			case 'mm':
				return tf(t.getMinutes());
				break;
			case 'dd':
				return tf(t.getDate());
				break;
			case 'HH':
				return tf(t.getHours());
				break;
			case 'ss':
				return tf(t.getSeconds());
				break;
			}
		});
	} */
	$(document)
			.ready(
					function() {

						$("#order_table").css("background-color", "#4f93b6");
						$("body").on("load", init());
						$("#billSelect").hide();
						/* 对活动地点进行选择 */
						var province = $("#sageState").val();
						var city = $("#sageCity").val();
						if (province != '' && city != '') {
							//查询对应的省份，触发地址级联函数
							$("#param_province").find(
									"option:contains('" + province + "')")
									.attr("selected", true);
							$("#param_province").trigger("change");
							$("#param_city").find(
									"option:contains('" + city + "')").attr(
									"selected", true);
						}
						/* 对活动时间进行处理进行选择 */
						/* var sageStarttime = $("#sageStarttime").val();
						var sageEndtime = $("#sageEndtime").val();
						var startTime = sageStarttime.Format("yyyy-MM-dd HH:mm:ss");
						var endTime = sageEndtime.Format("yyyy-MM-dd HH:mm:ss"); 
						var startTime = format(sageStarttime,
								'yyyy-MM-dd HH:mm:ss');
						var endTime = format(sageEndtime, 'yyyy-MM-dd HH:mm:ss');
						$("#startDate").val(startTime);
						$("#endDate").val(endTime); */
						/* 对活动的标签进行选择 */
						var activLabel = $("#stage_label").val();
						$(".type_li").css("background-color", "white").css(
								"color", "black");
						$(".type_li").each(
								function() {
									if ($(this).text() == activLabel) {
										$(this).css("background-color",
												"#5e93a7")
												.css("color", "white");
									}
								});
						if ($("#img_modify").attr("src") == '/SayHi/static/image/modify_admin.png') {

							$('input').attr("readonly", "readonly");
							$('textarea').attr("readonly", "readonly");
							$('#param_province').attr("disabled", "disabled");
							$('#param_city').attr("disabled", "disabled");
							$("#billSelect").hide();
						}
						$("#user_id").attr("readonly", "readonly");
					});
	$(document).ready(
			function() {
				$(".type_li").click(
						function() {
							var value = $(this).first().text();
							$(this).parent().siblings().children().css(
									"background-color", "white").css("color",
									"black");

							$(this).first().css("background-color", "#5e93a7")
									.css("color", "white");
							$("#stage_label").val(value);
							$("#img_modify").attr("src",
									"/SayHi/static/image/hold_admin.png")
							$('.elm').removeAttr("readonly");
							$('textarea').removeAttr("readonly");
							$('#param_province').removeAttr("disabled");
							$('#param_city').removeAttr("disabled");
							$("#billSelect").show();
							$("#user_id").attr("readonly", "readonly");
						});
				$("body").css({
					   "overflow-x":"hidden",
					   "overflow-y":"hidden"
					 });
			});
	$(document)
			.ready(
					function() {
						$("#img_modify")
								.click(
										function() {
											if ($("#img_modify").attr("src") == '/SayHi/static/image/modify_admin.png') {

												$("#img_modify")
														.attr("src",
																"/SayHi/static/image/hold_admin.png")
												$('.elm').removeAttr(
														"readonly");
												$('textarea').removeAttr(
														"readonly");
												$('#param_province')
														.removeAttr("disabled");
												$('#param_city').removeAttr(
														"disabled");
												$("#billSelect").show();
												return false;
											}
										});
						
					});

	$(document).ready(function() {

		$(".type_li").hover(function() {
			var activLabel = $("#stage_label").val();
			if ($(this).text() != activLabel) {
				$(this).css("background-color", "#BFBFBF");
			}

		}, function() {
			var activLabel = $("#stage_label").val();
			if ($(this).text() != activLabel) {
				$(this).css("background-color", "white");
			}
		});
		$(".table_li").css("background-color", "#4f93b6");
		$("#activ_mamager").css("background-color","#4288aa");
		var ret = $("input[name='ret']").val();
		if(ret != ""){
			TS.successAlert(ret);
		}
	});
</script>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<form action="${APP_PATH }/updateActivAdmin" method="post"
			enctype="multipart/form-data">
		<div id="counter">
			<div id="inform">
			
				<div id="inform_top">
					<a href="${APP_PATH }/activAdmin"><img
						src="${APP_PATH }/static/image/return_admin.png" id="img_return"></a>
					<input type="image" src="${APP_PATH }/static/image/${image}"
						id="img_modify">
				</div>
				<div id="inform_top_info">活动信息:</div>
				<div id="inform_top_block">
				</div>

				<div id="context">
					<div id="order">
						<div id="order_inform" class="inform_table">
							<table style="border-collapse: separate; border-spacing: 19px;">
								<tr>
									<td style="width: 100px;">用户编号:</td>
									<td><input type="text" name="userId"
										value="${userId }" id="user_id"></td>
									</tr>
									<td style="width: 100px;">活动名:</td>
									<td><input type="text" name="activName"
										value="${activity.activName }" class="elm"></td>
								</tr>
								<tr>

									
								<tr>
									<td>活动地点:</td>
									<td><select class="pc" name="activState"
										id="param_province"
										onchange="provincechange(this.selectedIndex)"><option>${activity.activState }</option></select>
										<select class="pc" name="activCity" id="param_city"><option>${activity.activCity }</option></select>
									</td>
								</tr>
								<tr>
									<td></td>
									<td><textarea name="activAddress"
											placeholder="详细地址信息,如街道、门牌号、小区、楼栋号、单元等信息" class="textarea">${activity.activAddress }</textarea></td>
								</tr>
								<tr>
									<td>开始时间:</td>
									<td class="activStarttime"><input type="hidden"
										id="sageStarttime" value="${activity.activStarttime}">
										<input name="activStarttime" type="datetime"
										class="Wdate form-controls"
										onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}'})"
										id="startDate" value="<fmt:formatDate value="${activity.activStarttime}" pattern="yyyy-MM-dd hh:mm:ss" />"></td>
								</tr>
								<tr>
									<td>结束时间:</td>
									<input type="hidden" id="sageEndtime"
										value="${activity.activEndtime}">
									<td class="activEndtime"><input name="activEndtime"
										type="datetime" class="Wdate form-controls"
										onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'startDate\')}'})"
										id="endDate" value="<fmt:formatDate value="${activity.activEndtime}" pattern="yyyy-MM-dd hh:mm:ss" />"></td>
								</tr>
								<tr>
									<td style="padding-bottom: 60px;">活动标签:</td>
									<td id="label_select">
										<ul class="label">
											<li><div class="type_li">摄影</div></li>
											<li><div class="type_li">食品</div></li>
											<li><div class="type_li">电影</div></li>
											<li><div class="type_li">宠物</div></li>
											<li><div class="type_li">艺术</div></li>
											<li><div class="type_li">运动</div></li>
											<li><div class="type_li">游戏</div></li>
											<li><div class="type_li">写作</div></li>
											<li><div class="type_li">科技</div></li>
										</ul></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">活动简介:</td>
									<td><textarea name="activBrief"
											placeholder="关于活动开展的方式以及大概流程、要求等..." class="textarea"
											style="height: 60px;">${activity.activBrief }</textarea></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">特别限制:</td>
									<td><textarea name="limitExplain"
											placeholder="关于参加活动需要注意的事项、参加条件等..." class="textarea">${activity.limitExplain }</textarea>
									</td>
								</tr>
								<tr>
									<td>期望人数:</td>
									<td><input type="text" name="expNum" style="width: 150px;"
										value="${activity.expNum }" class="elm"> <!-- <font>人数不限</font>
									<input type="checkbox" name="expNumPlus" style="width: 40px; background-color: white;" /> -->
									</td>

								</tr>
								<tr>
									<td>活动海报:</td>
									<td>
										<input type="hidden" name="activBill"
										 value="${activity.activBill }">  
										<div style="height: 170px;width: 292px;">
										<img src="${activity.activBill }" style="height: 140px;width: 292px; border-radius: 5px;"> 
										<input type="file" name="file" id="billSelect">
										</div>
										 
									</td>
								</tr>
								<tr>
									<td>点赞人数:</td>
									<td><input type="text" name="favorNum"
										style="width: 292px;" value="${activity.favorNum }" class="elm"></td>
								</tr>
								<tr>
									<td>评论人数:</td>
									<td><input type="text" name="cmtNum" style="width: 292px;"
										value="${activity.cmtNum }"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
		<input type="hidden" name="activId" value="${activity.activId}">
		<input type="hidden" name="activLabel" id="stage_label"
			value="${activity.activLabel}">
	</form>

	<input type="hidden" id="sageState" value="${activity.activState}">
	<input type="hidden" id="sageCity" value="${activity.activCity}">
	<input type="hidden" name="activLabel" id="stage_label"
		value="${activity.activLabel}">
	<input type="hidden" name="ret" value="${ret}">
</body>
</html>