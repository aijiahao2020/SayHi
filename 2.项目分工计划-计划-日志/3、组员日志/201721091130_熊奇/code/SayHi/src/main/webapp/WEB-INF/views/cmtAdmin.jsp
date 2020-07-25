<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评论管理</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${APP_PATH }/static/css/activadmin.css" rel="stylesheet"
	type="text/css" />
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
	margin-left: 9px;
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
	line-height: 25px;
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
	text-align: center;
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

#row_info {
	float: left;
	margin-top: 10px;
	padding-left: 40px;
}

#row_select {
	float: right;
	text-align: right;
	padding-right: 40px;
}

#submitSearch{
visibility: hidden;
}
</style>
<script type="text/javascript">
$(document).ready(
		function() {
			$("#cmtmag_search_button").click(
					function() {
						$("#submitSearch").trigger("click");
					});
		});
</script>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<div id="counter">
		<div id="cmtmag_search">
			<div id="cmtmag_search_top">搜索内容：</div>
			<form action="commentSearchAdmin" method="get">
				<div id="cmtmag_search_content">
					<div style="width: 812px; float: left;">
						<table>
							<tr>
								<td>活动编号:</td>
								<td style="width: 202px;"><input type="text" name="activId"
									value="${comment.activId }"></td>
								<td>用户编号:</td>
								<td style="width: 202px;"><input type="text" name="userId"
									value="${comment.userId }"></td>
								<td>评论内容:</td>
								<td><input type="text" name="cmtContent"
									value="${comment.cmtContent }"></td>
							</tr>

						</table>
					</div>
					<div id="cmtmag_search_button">搜索</div>
					<input type="submit" id="submitSearch">
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
					<c:if test="${empty pageInfo.list }">
						没有任何活动信息.
					</c:if>
					<c:if test="${!empty pageInfo.list}">
						<c:forEach items="${pageInfo.list }" var="comments" varStatus="id">
							<tr>
								<td>${id.index + 1 }</td>
								<td>${comments.activId }</td>
								<td>${comments.userId }</td>
								<td>${comments.cmtContent }</td>
								<td><a href="commentAdmin/${comments.cmtId}"><img
										src="static/image/search_admin.png" class="img_search"></a>
									<a href=""><img src="static/image/add_admin.png"
										class="img_add"></a> <a
									href="delCommentAdmin/${comments.cmtId}" class="delete"><img
										src="static/image/delete_admin.png" class="img_delete"></a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<!-- 显示分页信息 -->
			<c:if test="${empty comment }">
				<div class="row">
					<!--分页文字信息  -->
					<div class="col-md-6" id="row_info">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
						页,总 ${pageInfo.total } 条记录</div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="row_select">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li><a href="${APP_PATH }/commentAdmin?pn=1">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li><a
										href="${APP_PATH }/commentAdmin?pn=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="#">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a href="${APP_PATH }/activAdmin?pn=${page_Num }">${page_Num }</a></li>
									</c:if>

								</c:forEach>
								<c:if test="${pageInfo.hasNextPage }">
									<li><a
										href="${APP_PATH }/commentAdmin?pn=${pageInfo.pageNum+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<li><a
									href="${APP_PATH }/commentAdmin?pn=${pageInfo.pages}">末页</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty comment }">
				<div class="row">
					<!--分页文字信息  -->
					<div class="col-md-6" id="row_info">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
						页,总 ${pageInfo.total } 条记录</div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="row_select">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li><a href="${APP_PATH }/commentSearchAdmin?pn=1&&activId=${comment.activId}&&userId=${comment.userId}&&cmtContent=${comment.cmtContent}">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li><a
										href="${APP_PATH }/commentSearchAdmin?pn=${pageInfo.pageNum-1}&&activId=${comment.activId}&&userId=${comment.userId}&&cmtContent=${comment.cmtContent}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="#&&activId=${comment.activId}&&userId=${comment.userId}&&cmtContent=${comment.cmtContent}">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a href="${APP_PATH }/commentSearchAdmin?pn=${page_Num }&&activId=${comment.activId}&&userId=${comment.userId}&&cmtContent=${comment.cmtContent}">${page_Num }</a></li>
									</c:if>

								</c:forEach>
								<c:if test="${pageInfo.hasNextPage }">
									<li><a
										href="${APP_PATH }/commentSearchAdmin?pn=${pageInfo.pageNum+1 }&&activId=${comment.activId}&&userId=${comment.userId}&&cmtContent=${comment.cmtContent}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<li><a
									href="${APP_PATH }/commentSearchAdmin?pn=${pageInfo.pages}&&activId=${comment.activId}&&userId=${comment.userId}&&cmtContent=${comment.cmtContent}">末页</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>