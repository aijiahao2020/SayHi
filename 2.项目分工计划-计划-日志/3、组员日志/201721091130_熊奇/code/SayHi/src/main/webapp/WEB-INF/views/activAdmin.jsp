<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动查询</title>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${APP_PATH }/static/css/activadmin.css" rel="stylesheet"
	type="text/css" />
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
	background: url(static/image/back_admin.png) no-repeat;
	float: right;
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

a {
	text-decoration: none;
	outline: 0;
}

#submitSearch{
visibility: hidden;
}
</style>
<script type="text/javascript">
$(document).ready(
		function() {
			$("#activmag_search_button").click(
					function() {
						$("#submitSearch").trigger("click");
					});
		});
</script>
</head>
<body>
	<jsp:include page="sidebar.jsp" flush="true" />
	<div id="counter">
		<div id="activmag_search">
			<div id="activmag_search_top">搜索内容：</div>
			<form action="activSeachAdmin" method="get">
				<div id="activmag_search_content">
					<div style="width: 812px; float: left;">
						<table>
							<tr>
								<td style="width: 70px;">活动编号:</td>
								<td style="width: 202px;"><input type="text" name="activId"
									value="${activity.activId }"></td>
								<td style="width: 70px;">用户编号:</td>
								<td style="width: 202px;"><input type="text" name="userId"
									value="${activity.userId }"></td>
								<td style="width: 60px;">活动名:</td>
								<td><input type="text" name="activName"
									value="${activity.activName }"></td>
							</tr>

						</table>
					</div>
					<div id="activmag_search_button">搜索</div>
					<input type="submit" id="submitSearch">
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
					<c:if test="${empty pageInfo.list }">
						没有任何活动信息.
					</c:if>
					<c:if test="${!empty pageInfo.list}">
						<c:forEach items="${pageInfo.list }" var="activs" varStatus="id">
							<tr>
								<td>${id.index + 1 }</td>
								<td>${activs.activId }</td>
								<td>${activs.userId }</td>
								<td>${activs.activName }</td>
								<td><a href="activAdmin/${activs.activId}"><img
										src="static/image/search_admin.png" class="img_search"></a>
									<a href=""><img src="static/image/add_admin.png"
										class="img_add"></a> <a
									href="delActivAdmin/${activs.activId}" class="delete"><img
										src="static/image/delete_admin.png" class="img_delete"></a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<!-- 显示分页信息 -->
			<!-- 对全部的内容进行分页 -->
			<c:if test="${empty activity }">
				<div class="row">
					<!--分页文字信息  -->
					<div class="col-md-6" id="row_info">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
						页,总 ${pageInfo.total } 条记录</div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="row_select">
						<nav aria-label="Page navigation">
							<ul class="pagination">
							<a href="${APP_PATH }/activAdmin?pn=1">测试</a>
								<li><a href="${APP_PATH }/activAdmin?pn=1">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li><a
										href="${APP_PATH }/activAdmin?pn=${pageInfo.pageNum-1}"
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
										href="${APP_PATH }/activAdmin?pn=${pageInfo.pageNum+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<li><a href="${APP_PATH }/activAdmin?pn=${pageInfo.pages}">末页</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty activity }">
				<div class="row">
					<!--分页文字信息  -->
					<div class="col-md-6" id="row_info">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
						页,总 ${pageInfo.total } 条记录</div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="row_select">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li><a href="${APP_PATH }/activSeachAdmin?pn=1&&activId=${activity.activId}&&userId=${activity.userId}&&activName=${activity.activName}">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li><a
										href="${APP_PATH }/activSeachAdmin?pn=${pageInfo.pageNum-1}&&activId=${activity.activId}&&userId=${activity.userId}&&activName=${activity.activName}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="#&&activId=${activity.activId}&&userId=${activity.userId}&&activName=${activity.activName}">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a href="${APP_PATH }/activSeachAdmin?pn=${page_Num }&&activId=${activity.activId}&&userId=${activity.userId}&&activName=${activity.activName}">${page_Num }</a></li>
									</c:if>

								</c:forEach>
								<c:if test="${pageInfo.hasNextPage }">
									<li><a
										href="${APP_PATH }/activSeachAdmin?pn=${pageInfo.pageNum+1 }&&activId=${activity.activId}&&userId=${activity.userId}&&activName=${activity.activName}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<li><a href="${APP_PATH }/activSeachAdmin?pn=${pageInfo.pages}&&activId=${activity.activId}&&userId=${activity.userId}&&activName=${activity.activName}">末页</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>