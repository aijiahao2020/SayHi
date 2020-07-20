<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="static/js/My97DatePicker/WdatePicker.js"></script>
<body>
	<!-- <input type="text" class="Wdate" onClick="WdatePicker()">
	<input class="Wdate"
		onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm'})"
		name="date" />  -->开始时间：
	<input type="text" class="Wdate form-controls"
		onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}'})"
		id="startDate"> 结束时间：
	<input type="text" class="Wdate form-controls"
		onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'startDate\')}'})"
		id="endDate">
</body>
</html>