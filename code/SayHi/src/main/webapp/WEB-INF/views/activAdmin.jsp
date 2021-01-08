<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动管理</title>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
 <script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.4.1.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link href="${APP_PATH }/static/css/activadmin.css" rel="stylesheet"
	type="text/css" />
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#counter {
	width: 1143px;
	height: 820px;
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
#activmag_search {
	width: 1000px;
	height: 178px;
	margin: 25px auto 45px auto;
	background: white;
	border-radius: 5px;
	box-shadow: 0px 2px 2px 1px #E0E0E0;
}

#activmag_result {
	width: 1000px;
	height: 524px;
	margin: 0 auto;
	background: white;
	border-radius: 5px;
	box-shadow: 0px 2px 2px 1px #E0E0E0;
}
#activmag_search_button {
	width: 100px;
	height: 25px;
	background-color: #4f93b6;
	border-radius: 5px;
	text-align: center;
	line-height:25px;
	color: white;
	cursor: pointer;
	float: left;
	font-size: 13px;
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
			 $(".delete").click(function(){
				if(confirm("是否确认删除")){
					
				}else{return false;}
			 }); 
			$("body").css({
				   "overflow-x":"hidden",
				   "overflow-y":"hidden"
				 });
		});
/* $(document).ready(function(){
	$(".del").click(function(){
		if(confirm("是否确认删除")){
			var id = $(this).parent().parent().children().first().next().text();
			$.ajax({
				url : "${APP_PATH }/delActivAdminByAjax",//这个对应Controller的URL，和表单里面的action一样
				data : {
					"activId":id
				},//data就是你想要传什么数据到Controller层，这里的数据是json数据。
				type : "POST", //类型，POST或者GET,就和表单与超链接一样
				dataType : "text", //Controller层返回类型，如果返回String，就用text,返回json,就用json
				success : function(data) {
					
				},
				error:function(){
		            alert("错误类型");
				}
			});
		}else{return false;}
		
	});
}); */  
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
									<a href="toAddActivAdmin/${activs.userId}"><img src="static/image/add_admin.png"
										class="img_add"></a><!--  <span class="del"><button>删除</button></span> -->
											 <a href="delActivAdmin/${activs.activId}" class="delete"><img
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