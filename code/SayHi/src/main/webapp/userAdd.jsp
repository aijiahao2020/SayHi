<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片测试</title>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	//业务指南上传图片
	function tijiao() {
		/* var node = $("#businessTypeList").tree("getSelected");
		if (node == null || node == "") {
			$.messager.alert("提示", "没有选择业务类型，无法上传文件！", "info");
		} else { */
			var form = new FormData(document.getElementById("ss"));
			$.ajax({
						url : '${APP_PATH}/upload',
						data : form,
						type : 'post',
						processData : false,
						contentType : false,
						success : function(data) {
							var data = JSON.parse(data);
							if (data.b == true) {
								$("#sql1").val(data.desc);
								$("#sql2").val(data.desc);
								//上传时回显图片
								$("#deli").show();
								$("#flowChartDiv")
										.html(
												"<img src='${pageContext.request.contextPath}/"+data.desc+"' style='width:200px; height:200px;'></img>");
								//$.messager.alert("提示","图片上传成功！"); 
							} else if (data.b == false) {
								$.messager.alert("提示", data.desc);
							}
						},
						error : function(data) {
							$.messager.alert("提示", data.error);
						}
					});
		}
	}
</script>
</head>
<body>


	<!--流程图上传的表单  -->
	<form name="dateupload" method="post" enctype="multipart/form-data"
		id="ss">
		<table width="80%" class="yewzn-tab" id="st">
			<td width='12%' class='gi'>经办流程图:</td>
			<td colspan="3"><input type="file" name="file" id="fil">
				<button type="button" οnclick="tijiao()" class="yewzn-but-change">提交</button>
				<input name="flowChart" type="hidden" id="sql2"></td>
		</table>
	</form>

	<form action="upload" method="post" enctype="multipart/form-data" id="ss">
		<label>用户名：</label><input type="text" name="userName"><br>
		<label>密码：</label><input type="password" name="password"><br>
		<label>上传头像：</label><input type="file" name="file" id="fil"><br>
		<button type="button" οnclick="tijiao()" class="yewzn-but-change">提交</button>
	</form>


</body>
</html>