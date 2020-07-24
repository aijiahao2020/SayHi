<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script src="${APP_PATH }/static/js/jquery.min.js"></script>
<script src="${APP_PATH }/static/js/jquery.cookie.js"></script>
<script type="text/javascript"
	src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function() {

		var user = $("#sp1").text();//获取点赞对象：用户1
		var sum = $("#sp2").text();//获取当前赞的数量，这里获取的是字符串
		var bt1 = $("#bt1").text(); 
		var bt2 = $("#bt2").text(); 
		$("#bt1").click(function() {//给button设置点击事件
			$.ajax({
				url : "addZan",//这个对应Controller的URL，和你们以前表单里面的action一样
				data : { //data就是你想要传什么数据到Controller层，这里的数据是json数据。

					usera : user
				//多个数据用逗号隔开，usera其实相当于form里的name属性，这个名字和Controller层传过去的值对应

				//user就是刚刚获取到的值

				//其实这行代码可以写成 usera:$("#sp1").text()

				},
				type : "POST", //类型，POST或者GET,就和表单与超链接一样
				dataType : 'text', //Controller层返回类型，如果返回String，就用text,返回json,就用json
				success : function(data) { //成功，回调函数
					alert(data);//可以用data调用Controller返回的值
					$("#sp2").html(parseInt(sum) + 1);//点赞+1，先把sum强转为整再+1
					sum = parseInt(sum) + 1;
				},
				error : function() { //失败，回调函数
					alert("程序出错。。。");
				}
			})
		});
		$("#bt2").click(function() {//给button设置点击事件
			$.ajax({
				url : "delFavoriteInfo",//这个对应Controller的URL，和你们以前表单里面的action一样
				data : { //data就是你想要传什么数据到Controller层，这里的数据是json数据。

					usera : user
				//多个数据用逗号隔开，usera其实相当于form里的name属性，这个名字和Controller层传过去的值对应

				//user就是刚刚获取到的值

				//其实这行代码可以写成 usera:$("#sp1").text()

				},
				type : "POST", //类型，POST或者GET,就和表单与超链接一样
				dataType : 'text', //Controller层返回类型，如果返回String，就用text,返回json,就用json
				success : function(data) { //成功，回调函数
					alert(data);//可以用data调用Controller返回的值
					$("#sp2").html(parseInt(sum) - 1);//点赞+1，先把sum强转为整再+1
					sum = parseInt(sum) - 1;
				},
				error : function() { //失败，回调函数
					alert("程序出错。。。");
				}
			})
		});

	})
	
</script>
</head>
<body>

	<%-- <a href="index">首页</a>
	<a href="addFavoriteInfo1">首页</a> --%>
	<jsp:forward page="/index"></jsp:forward> 
<!-- <span id="sp1">用户1</span><br/>
<button id="bt1">点赞</button>
<span id="sp2">11</span>
<br>
<span id="sp1">用户1</span><br/>
<button id="bt2">取消点赞</button>
<span id="sp21">11</span>
</body>
</html> -->

<%-- $(function() {

	var id = $("#activId").text();//获取点赞对象：用户1
	var sum = $("#sp2").text();//获取当前赞的数量，这里获取的是字符串
	var bt1 = $("#bt1").text(); 
	var bt2 = $("#bt2").text(); 
	$("#bt1").click(function() {//给button设置点击事件
		$.ajax({
			url : "${APP_PATH }/addFavoriteInfo",//这个对应Controller的URL，和你们以前表单里面的action一样
			data : { //data就是你想要传什么数据到Controller层，这里的数据是json数据。

				activId : id
			//多个数据用逗号隔开，usera其实相当于form里的name属性，这个名字和Controller层传过去的值对应

			//user就是刚刚获取到的值

			//其实这行代码可以写成 usera:$("#sp1").text()

			},
			type : "POST", //类型，POST或者GET,就和表单与超链接一样
			dataType : 'text', //Controller层返回类型，如果返回String，就用text,返回json,就用json
			success : function(data) { //成功，回调函数
				alert(data);//可以用data调用Controller返回的值
				if(data != "请先登录，后点赞")
				$("#sp2").html(data);//点赞+1，先把sum强转为整再+1
				$("#bt1").html("已点赞");//点赞+1，先把sum强转为整再+1
			},
			error : function() { //失败，回调函数
				alert("程序出错。。。");
			}
		})
	});
	$("#bt2").click(function() {//给button设置点击事件
		$.ajax({
			url : "${APP_PATH }/delFavoriteInfo",//这个对应Controller的URL，和你们以前表单里面的action一样
			data : { //data就是你想要传什么数据到Controller层，这里的数据是json数据。

				activId : id
			//多个数据用逗号隔开，usera其实相当于form里的name属性，这个名字和Controller层传过去的值对应

			//user就是刚刚获取到的值

			//其实这行代码可以写成 usera:$("#sp1").text()

			},
			type : "POST", //类型，POST或者GET,就和表单与超链接一样
			dataType : 'text', //Controller层返回类型，如果返回String，就用text,返回json,就用json
			success : function(data) { //成功，回调函数
				alert(data);//可以用data调用Controller返回的值
				$("#sp2").html(data);//点赞+1，先把sum强转为整再+1
				
			},
			error : function() { //失败，回调函数
				alert("程序出错。。。");
			}
		})
	});

}) --%>