<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>拖车信息</title>
	<link href="static/css/cmtinform.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="scripts/window.js"></script>
	<script type="text/javascript" src="scripts/jquery-3.4.1.js"></script>
</head>
<body >
	<jsp:include page="sidebar.jsp" flush="true"/>
	<form action="" method="get">
	<div id="counter">
		<div id="inform">
			<div id="inform_top">
				<a href=""><img src="static/image/return_admin.png" id="img_return"></a>
				<input type="image" src="static/image/modify_admin.png" id="img_modify">
			</div> 
			
			<div id="context">
				<div id="office">
					<div class="inform_top">评论信息：</div>
					<div id="office_inform" class="inform_table">
						<table style="border-collapse:separate; border-spacing:19px;">
							<tr>
								<td style="width: 100px;">活动编号:</td>
								<td><input type="text" name="activId" value=""></td>
							</tr>
							<tr>
								<td>用户编号: </td>
								<td><input type="text" name="userId" value="" ></td>
							</tr>
							<tr>
								<td style="vertical-align: top;">评论内容: </td>
								<td>
									<textarea name="cmtContent"  id="textarea"></textarea>

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