<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评论管理</title>
<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
	background: url(static/image/back_admin.png) no-repeat;
	float: right;
}

#cmtmag_search {
	width: 1000px;
	height: 178px;
	margin: 25px auto 45px auto;
	background: white;
	border-radius: 5px;
}

#cmtmag_search_top {
	width: 1000px;
	height: 56px;
	line-height: 56px;
	margin-left: 20px;
	font-size: 16px;
	color: #4A4A4A;
}

#cmtmag_search_content {
	width: 1000px;
	height: 80px;
	margin-left: 30px;
	margin-top: 20px;
}
#cmtmag_search_content  td {
	font-size: 14px;
	color: #4A4A4A;
}

#cmtmag_search_content  input {
	font-size: 14px;
	color: #4A4A4A;
	border-radius: 5px;
	margin-left:9px;
	outline: 0;
	width: 170.4px;
	padding-left: 3px;
	border-width: 1px;
	border-style: solid;
}

#cmtmag_search_content  select {
	width: 176.4px;
	height: 20.8px;
	font-size: 14px;
	color: #4A4A4A;
	border-radius: 5px;
	outline: 0;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}

#cmtmag_search_button {
	width: 100px;
	height: 25px;
	background-color: #6dbecb;
	border-radius: 5px;
	text-align: center;
	line-height:25px;
	color: white;
	cursor: pointer;
	float: left;
	font-size: 13px;
}

#button {
	width: 76px;
	height: 74px;
	background-color: #4B8EAE;
	border-radius: 10px;
	text-align: center;
	line-height: 74px;
	font-size: 18px;
	cursor: pointer;
}

#cmtmag_result {
	width: 1000px;
	height: 524px;
	margin: 0 auto;
	background: white;
	border-radius: 5px;
}

#cmtmag_result_top {
	width: 1000px;
	height: 59px;
	line-height: 66px;
	margin-left: 20px;
	font-size: 16px;
	color: #4A4A4A;
}

#cmtmag_result_content {
	width: 1000px;
	height: 375px;
	margin-left: 20px;
}

#cmtmag_result_table {
	border: 1px;
	border-color: white;
}

#cmtmag_result_content table tr:nth-child(odd) {
	background: #F4F4F4;
}

#cmtmag_result_content table {
	border-top: 1px solid rgba(0, 0, 0, 0.3);
	border-left: 1px solid rgba(0, 0, 0, 0.3);
	border-collapse: collapse;
}

#cmtmag_result_content  th {
	height: 33px;
	font-size: 16px;
	color: white;
	font-weight: normal;
	background-color: #4F93B6;
	border-bottom: 1px solid rgba(0, 0, 0, 0.3);
	border-right: 1px solid #F4F4F4;
}

#cmtmag_result_content  td {
	height: 33px;
	font-size: 16px;
	color: #4A4A4A;
	text-align: center;
	border-bottom: 1px solid rgba(0, 0, 0, 0.3);
	border-right: 1px solid rgba(0, 0, 0, 0.3);
}

.img_search {
	margin-right: 10px;
	cursor: pointer;
}

.img_add {
	cursor: pointer;
}

.img_delete {
	margin-left: 10px;
	cursor: pointer;
}

#cmtmag_result_bottom {
	width: 1000px;
	height: 90px;
	line-height: 90px;
}

#page {
	width: 35px;
	height: 35px;
	background-color: #62A1C2;
	border-radius: 5px;
	text-align: center;
	line-height: 35px;
	color: white;
	margin-top: 27.5px;
	margin-left: 22px;
	margin-right: 22px;
	float: left;
}

#after_page {
	color: #4A4A4A;
	font-size: 16px;
	float: left;
}

#next_page {
	color: #4A4A4A;
	font-size: 16px;
	float: left;
}

#jump_page {
	width: 170px;
	height: 90px;
	font-size: 16px;
	color: #4A4A4A;
	float: right;
}

#jump_page select {
	width: 69px;
	height: 22px;
	border-radius: 5px;
	color: #4A4A4A;
	text-align: center;
	text-align-last: center;
}
</style>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<div id="counter">
		<div id="cmtmag_search">
			<div id="cmtmag_search_top">搜索内容：</div>
			<form action="" method="get">
				<div id="cmtmag_search_content">
					<div style="width: 812px; float: left;">
						<table>
							<tr>
								<td>活动编号:</td>
								<td style="width: 202px;"><input type="text" name="activId"
									value=""></td>
								<td>用户编号:</td>
								<td style="width: 202px;"><input type="text" name="userId"
									value=""></td>
								<td>评论内容:</td>
								<td><input type="text" name="cmtContent" value=""></td>
							</tr>

						</table>
					</div>
					<div id="cmtmag_search_button">
						搜索
					</div>
				</div>
			</form>

		</div>
		<div id="cmtmag_result">
			<div id="cmtmag_result_top">搜索结果：</div>
			<div id="cmtmag_result_content">
				<table cellpadding="0" cellspacing="0" id="cmtmag_result_table">
					<tr>
						<th style="width: 51px;">序号</th>
						<th style="width: 235px;">活动编号</th>
						<th style="width: 211px;">用户编号</th>
						<th style="width: 307px;">评论内容</th>
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
			<div id="cmtmag_result_bottom">
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