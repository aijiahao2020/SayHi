<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>拖车信息</title>
	<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>
	<link href="${APP_PATH }/static/css/cmtinform.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<jsp:include page="sidebar.jsp" flush="true"/>
	<form action="" method="get">
	<div id="counter">
		<div id="inform">
			<div id="inform_top">
				<a href="${APP_PATH }/commentAdmin"><img src="../static/image/return_admin.png" id="img_return"></a>
				<input type="image" src="../static/image/modify_admin.png" id="img_modify">
			</div> 
			
			<div id="context">
				<div id="office">
					<div class="inform_top">评论信息：</div>
					<div id="office_inform" class="inform_table">
						<table style="border-collapse:separate; border-spacing:19px;">
							<tr>
								<td style="width: 100px;">活动编号:</td>
								<td><input type="text" name="activId" value="${comment.activId }"></td>
							</tr>
							<tr>
								<td>用户编号: </td>
								<td><input type="text" name="userId" value="${comment.userId }" ></td>
							</tr>
							<tr>
								<td style="vertical-align: top;">评论内容: </td>
								<td>
									<textarea name="cmtContent"  id="textarea">${comment.cmtContent }</textarea>

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