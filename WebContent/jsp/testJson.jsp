<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
testJson = function(){
	var username=$("#username").val();
	var password=$("#password").val();
	$.ajax({
		url:"${pageContext.request.contextPath }/insertuser.action",
		type:"post",
		//data表示发送的数据
		data:JSON.stringify({
			username:username,
			password:password
		}),
		//定义发送请求的数据格式为JSON字符串
		contentType:"application/json;charset=UTF-8",
		//定义毁掉的数据格式也是json格式，该属性可以省略
		dataType="json",
		//成功响应结果
		sucess:function(data){
			if(data!=null){
				alert("您输入的名字为"+data.username+"密码为："+data.password);
			}
		}
	});
}
</script>
</head>
<body>
	<form>
	<input type="text" id="username" name="username" />
	<input type="password" id="password" name="password" />
	<button onclick="testJson()">testJson</button></form>
</body>
</html>