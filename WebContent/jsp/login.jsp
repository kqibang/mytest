<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>中小型医院预约诊疗小程序登录界面</title>
<script
	src="${pageContext.request.contextPath }/js/jquery-2.1.1-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/1.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/alertType.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript">


$(document).ready(function() {

})
	login = function() {
		//	alert($("#loginType").val());
		var loginType = $("#loginType").val();
		if (loginType == 1) { //如果是医生登录
			var doctor_id = $("#userid").val();
			var doctor_password = $("#password").val();
			$.ajax({
						url : "${pageContext.request.contextPath }/doctorSign",
						type : "post",
						//data表示发送的数据
						data : JSON.stringify({
							doctor_id : doctor_id,
							doctor_password : doctor_password
						}),
						//定义发送请求的数据格式为JSON字符串
						contentType : "application/json;charset=UTF-8",
						//定义毁掉的数据格式也是json格式，该属性可以省略
						dataType : "json",
						//成功响应结果
						success : function(data) {
							
							if (data != null) {
								if (data.doctor_name != null) {
									//alert("登录成功" + data.doctor_name);
									//window.location.href = 'doctor_index.jsp';
									success_prompt("登录成功")
									window.document.location.href = "${pageContext.request.contextPath }/jsp/doctor/doctor_index.jsp";
								} else {
									alert("密码错误")
								}

							} else {
								alert("账户不存在")
							}
						}
					});
		} else if (loginType == 2) { //如果是管理员登录
			var a_id = $("#userid").val();
			var a_password = $("#password").val();
			$.ajax({
						url : "${pageContext.request.contextPath }/adminSign",
						type : "post",
						//data表示发送的数据
						data : JSON.stringify({
							a_id : a_id,
							a_password : a_password,
						}),
						//定义发送请求的数据格式为JSON字符串
						contentType : "application/json;charset=UTF-8",
						//定义毁掉的数据格式也是json格式，该属性可以省略
						dataType : "json",
						//成功响应结果
						success : function(data) {
							if (data != null) {
								if (data.a_name != null) {
									//alert("请求发送成功" + data);
									success_prompt("登录成功")
									window.document.location.href = "${pageContext.request.contextPath }/jsp/admin/admin_index.jsp";
									//window.location.href = 'admin_index.jsp';
								} else {
									alert("密码错误")
								}
							} else {
								alert("账户不存在")
							}
						}
					});
		}
	}
</script>
</head>

<body class="backcol1">
	<div class="font-1">中小型医院预约诊疗小程序登录界面</div>

	<div class="container1">
		<!-- 左半部分 -->
		<div class="con1left">
			<img src="${pageContext.request.contextPath }/img/hospital.jpg" alt="医院">
		</div>
		<!-- 右半部分 -->
		<div class="con1right con1rightfont">
			<div class="rightposi">
				<div>
					登录类型：<select id="loginType" name="loginType">
						<option value="1" selected>医生</option>
						<option value="2">管理员</option>
					</select>
				</div>

				<!-- 账号 -->
				<div class="rightposi1">
					账号：<input type="text" id="userid" name="userid">
				</div>
				<div class="rightposi1">
					密码：<input type="text" id="password" name="password">
				</div>
				<div>
					<input type="button" value="登录" onclick="login()" class="loginBtn"/>
				</div>
			</div>
		</div>
	</div>

</body>
</html>