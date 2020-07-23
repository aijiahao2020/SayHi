<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动查询</title>
<link href="static/css/activadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="sidebar.jsp" %>
	<div id="counter">
		<div id="activmag_search">
			<div id="activmag_search_top">搜索内容：</div>
			<form action="" method="get">
				<div id="activmag_search_content">
					<div style="width: 812px; float: left;">
						<table>
							<tr>
								<td>活动编号:</td>
								<td style="width: 202px;"><input type="text" name="activId"
									value=""></td>
								<td>用户编号:</td>
								<td style="width: 202px;"><input type="text" name="userId"
									value=""></td>
								<td>活动名:</td>
								<td><input type="text" name="officeNo" value=""></td>
							</tr>

						</table>
					</div>
					<div id="activmag_search_button">
						搜索
					</div>
				</div>
			</form>

		</div>
		<div id="activmag_result">
			<div id="activmag_result_top">搜索结果：</div>
			<div id="activmag_result_content">
				<table cellpadding="0" cellspacing="0" id="activmag_result_table">
					<tr>
						<th style="width: 51px;">序号</th>
						<th style="width: 235px;">活动编号</th>
						<th style="width: 211px;">用户编号</th>
						<th style="width: 307px;">活动名称</th>
						<th
							style="width: 148px; border-right: 1px solid rgba(0, 0, 0, 0.3)">
							操作</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href=""><img src="static/image/search_admin.png"
								class="img_search"></a> <a href=""><img
								src="static/image/add_admin.png" class="img_add"></a> <a href=""
							class="delete"><img src="static/image/delete_admin.png"
								class="img_delete"></a></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href=""><img src="static/image/search_admin.png"
								class="img_search"></a> <a href=""><img
								src="static/image/add_admin.png" class="img_add"></a> <a href=""
							class="delete"><img src="static/image/delete_admin.png"
								class="img_delete"></a></td>
					</tr>
				</table>
			</div>
			<div id="activmag_result_bottom">
				<div id="page">1</div>
				<div id="after_page">
					<a href="">上一页</a>
				</div>
				<div id="next_page">
					<a href="">下一页</a>
				</div>

				<div id="jump_page">
					跳转到 <select id="jpage">

					</select> 页
				</div>
			</div>
		</div>
	</div>
</body>
</html>