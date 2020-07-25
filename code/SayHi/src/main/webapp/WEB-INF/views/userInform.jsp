<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
	
	float: right;
}


#inform::-webkit-scrollbar {
	width: 0px;
}

#inform {
	width: 1000px;
	height: 650px;
	margin: 33px auto 45px auto;
	background: white;
	border-radius: 5px;
	overflow-y: auto;
	overflow-x: hidden;
}

#inform_top {
	width: 1000px;
	height: 99px;
}

#topplus {
	width: 1000px;
	height: 99px;
	position: fixed;
	background: rgba(255, 255, 255, 1);
}

#img_return {
	width: 30px;
	height: 30px;
	float: left;
	margin: 19px auto auto 32px;
}

#img_modify {
	width: 25px;
	height: 25px;
	float: right;
	border: 0;
	margin: 19px 32px auto auto;
}

.inform_top {
	width: 300px;
	font-size: 20px;
	margin-left: 108px;
	margin-bottom: 26px;
}

.inform_table {
	margin-left: 300px;
}

input {
	width: 292px;
	height: 19px;
	padding-left: 5px;
	border-color: #979797;
	border-radius: 5px;
	outline: 0;
	border-width: 1px;
	border-style: solid;
}

td {
	font-size: 16px;
}

#user_inform select {
	height: 19px;
	width: 80px;
	font-size: 12px;
	border-color: #979797;
	border-radius: 5px;
	outline: 0;
	border-width: 1px;
	border-style: solid;
	text-align: center;
	text-align-last: center;
}

#user_inform option {
	font-size: 12px;
}
#billSelect {
	width: 292px;
    height: 30px;
    margin-top:10px;
    margin-left:60px;
    border:0;
    outline: 0;
}
#show_avatar{
	width: 292px;
	height:292px;
	text-align: center;
}
#user_avatar {
	width:150px;
	height:150px;
	border-radius: 200px;
}
</style>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
					function() {
						if ($("#img_modify").attr("src") == '/SayHi/static/image/modify_admin.png') {

							$('input').attr("readonly", "readonly");
							$('textarea').attr("readonly", "readonly");
						}
						$("#billSelect").hide();
						$(".table_li").css("background-color", "#4f93b6");
						$("#user_mamager").css("background-color", "#4288aa");
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
												$('#user_name').removeAttr(
														"readonly");
												$("#billSelect").show();
												return false;
											}
										});
					});
</script>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<form action="${APP_PATH }/updateUserAdmin" method="post" enctype="multipart/form-data">
		<div id="counter">
			<div id="inform">
				<div id="inform_top">
					<a href="${APP_PATH }/userAdmin"><img
						src="${APP_PATH }/static/image/return_admin.png" id="img_return"></a>
					<input type="image" src="${APP_PATH }/static/image/${image}"
						id="img_modify">
				</div>

				<div id="context">
					<div id="office">
						<div class="inform_top">用户信息：</div>
						<div id="user_inform" class="inform_table">
							<table style="border-collapse: separate; border-spacing: 19px;">
								<tr>
									<td style="width: 100px;">用户编号:</td>
									<td><input type="text" name="userId"
										value="${user.userId }"></td>
								</tr>
								<tr>
									<td>用户名:</td>
									<td><input type="text" name="userName"
										value="${user.userName }" id="user_name"></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">用户头像:</td>
									<td>
										<div id="show_avatar">
											<input type="hidden" name="avatar" value="${user.avatar }">
											<img  src="${user.avatar }" id="user_avatar">
											<input type="file" name="file" id="billSelect">
											<!-- <input type="button" id="upload" name="" value="文件上传"> -->
										</div>
									</td>
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