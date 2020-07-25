<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评论信息</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/css/cmtinform.css" rel="stylesheet"
	type="text/css" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if ($("#img_modify").attr("src") == '/SayHi/static/image/modify_admin.png') {
							$('input').attr("readonly", "readonly");
							$('textarea').attr("readonly", "readonly");
						}
						$(".table_li").css("background-color", "#4f93b6");
						$("#cmt_mamager").css("background-color", "#4288aa");
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
												$('#textarea').removeAttr(
														"readonly");
												return false;
											}
										});
						$("body").css({
							   "overflow-x":"hidden",
							   "overflow-y":"hidden"
							 });
					});
</script>
<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<form action="${APP_PATH }/updateCmtAdmin" method="get">
		<div id="counter">
			<div id="inform">
				<div id="inform_top">
					<a href="${APP_PATH }/commentAdmin"><img
						src="${APP_PATH }/static/image/return_admin.png" id="img_return"></a>
					<input type="image" src="${APP_PATH }/static/image/${image}"
						id="img_modify">
				</div>

				<div id="context">
					<div id="office">
						<div class="inform_top">评论信息：</div>
						<div id="office_inform" class="inform_table">
							<table style="border-collapse: separate; border-spacing: 19px;">
								<tr>
									<td style="width: 100px;">活动编号:</td>
									<td><input type="text" name="activId"
										value="${comment.activId }"></td>
								</tr>
								<tr>

									<td>用户编号:</td>
									<td><input type="text" name="userId"
										value="${comment.userId }"></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">评论内容:</td>
									<td><textarea name="cmtContent" id="textarea">${comment.cmtContent }</textarea>

									</td>
								</tr>
								<input type="hidden" name="cmtId"
									value="${comment.cmtId }">
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>
</body>
</html>