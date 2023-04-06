<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath }/js/jquery-2.1.1-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/doctor_index.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/alertType.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/1.css">
<script href="${pageContext.request.contextPath }/js/1.js"></script>
<script type="text/javascript">
	doctorchangeInfo=function(){
		
		//alert(${sessionScope.doctor_session.getDoctor_id() });
		var oldPassword = $("#oldPassword").val();
		var newPassword= $("#newPassword").val();
		//alert(oldPassword==${sessionScope.doctor_session.getDoctor_password() })
		//alert(newPassword.length);
		//alert(newPassword);
		//如果要改密码则要核查旧密码是否正确
		if(newPassword.length!=0){
		 if(oldPassword.length==0){
				//alert("旧密码输入错误")
				$("#oldPasswordmsg").html("请输入旧密码");
			}
		else if(oldPassword!='${sessionScope.doctor_session.getDoctor_password() }'){
			//alert("旧密码输入错误")
			$("#oldPasswordmsg").html("旧密码错误");
			if(newPassword.length<=5){
				$("#newPasswordmsg").html("新密码长度应大于5位");
				}else $("#newPasswordmsg").html("√");
		}
		else if(newPassword.length<=5){
			$("#oldPasswordmsg").html("√");
			$("#newPasswordmsg").html("新密码长度应大于5位");
			//alert("新密码长度小于6")
			}
		else {
			var doctor_name=$("#doctor_name").val();
			var doctor_address=$("#doctor_address").val();
			var doctor_award=$("#doctor_award").val();
			var doctor_id= ${sessionScope.doctor_session.getDoctor_id()}; 
			
			$.ajax({
				url : "${pageContext.request.contextPath }/doctorChangeInfo",
				type:"post",
				//data表示发送的数据
				data : JSON.stringify({
					doctor_id : doctor_id,
					doctor_password : newPassword,
					doctor_name:doctor_name,
					doctor_award:doctor_award,
					doctor_address:doctor_address
				}),
				//定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=UTF-8",
				//定义毁掉的数据格式也是json格式，该属性可以省略
				dataType : "json",
				//成功响应结果
				success : function(data) {
					//alert(data);
					if(data=='1'){
						alert("修改成功，请重新登录！");
						window.document.location.href = "${pageContext.request.contextPath }/jsp/login.jsp";
						window.parent.location.href="${pageContext.request.contextPath }/jsp/login.jsp";
						//top.location.href("${pageContext.request.contextPath }/jsp/login.jsp");
						//session.removeAttribute("doctor_session");  //清除属性为doctor_session的session
						//session.invalidate();  //清除所有session
					}
					else{
						alert("修改失败");
					}
				}
			});
				//ajax请求结束
			
		}
		}
		else{  //不修改密码
			//alert("不修改密码")
			var doctor_password = $("#oldPassword").val();
			var doctor_old_name="${sessionScope.doctor_session.getDoctor_name()}";
			var doctor_old_address="${sessionScope.doctor_session.getDoctor_address()}";
			var doctor_old_award="${sessionScope.doctor_session.getDoctor_award()}"; 
			var doctor_name=$("#doctor_name").val(); 
			var doctor_address=$("#doctor_address").val();
			var doctor_award=$("#doctor_award").val();
		//	console.log(doctor_name==doctor_old_name);
			var doctor_id= ${sessionScope.doctor_session.getDoctor_id() };
			
			if(doctor_name==doctor_old_name&&doctor_old_address==doctor_address&&doctor_award==doctor_old_award){
				alert("未修改信息");
			}else
				if(doctor_password!='${sessionScope.doctor_session.getDoctor_password() }'){
				$("#oldPasswordmsg").html("密码错误");
			}else{
				$.ajax({
				url : "${pageContext.request.contextPath }/doctorChangeInfo",
				type : "post",
				//data表示发送的数据
				data : JSON.stringify({
					doctor_id : doctor_id,
					doctor_password : doctor_password,
					doctor_name:doctor_name,
					doctor_award:doctor_award,
					doctor_address:doctor_address
				}),
				//定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=UTF-8",
				//定义毁掉的数据格式也是json格式，该属性可以省略
				dataType : "json",
				//成功响应结果
				success : function(data) {
					//console.log(data)
					//alert(data);
					if(data=='1'){
						alert("修改成功，请重新登录！");
						window.document.location.href = "${pageContext.request.contextPath }/jsp/login.jsp";
						window.parent.location.href="${pageContext.request.contextPath }/jsp/login.jsp";
						//top.location.href("${pageContext.request.contextPath }/jsp/login.jsp");
						//session.removeAttribute("doctor_session");  //清除属性为doctor_session的session
						//session.invalidate();  //清除所有session
					}
					else{
						alert("修改失败");
					}
				}
			});
			//ajax请求结束
			}
		}
	}
	</script>
</head>
<body class="backcol_dson">
	<%
	if (session.getAttribute("doctor_session") == null) {
		// 重定向到新地址
		//String site = new String("${pageContext.request.contextPath }/jsp/login.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		//  response.setHeader("Location","/jsp/login.jsp");}
		response.setHeader("Location", "../login.jsp");
	}
	%>
	<h1>修改个人信息</h1>
	<div class="allposiType">
		<div class="controlPosiType">
            <div class="realcenter">
            <div class="container2">
				<div class="container2">
					<div class="aaaAttr">医&nbsp;生&nbsp;编&nbsp;号</div>

					<div>
						<div type="text" class="changeInfoInputType">
							${sessionScope.doctor_session.getDoctor_id() }</div>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</div>

					<div>
						<input type="text" id="doctor_name" name="doctor_name"
							class="changeInfoInputType"
							placeholder="${sessionScope.doctor_session.getDoctor_name() }"
							value="${sessionScope.doctor_session.getDoctor_name() }">
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</div>

					<div>
						<input type="text" id="doctor_address" name="doctor_address"
							class="changeInfoInputType"
							placeholder="${sessionScope.doctor_session.getDoctor_address() }"
							value="${sessionScope.doctor_session.getDoctor_address() }">
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">身份证号码</div>

					<div>
						<div type="text" class="changeInfoInputType">
							${sessionScope.doctor_session.getDoctor_identity_id() }</div>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室</div>

					<div type="text" class="changeInfoInputType">
						${sessionScope.doctor_session.getSub_name() }</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;诊</div>

					<div type="text" class="changeInfoInputType">
						${sessionScope.doctor_session.getSec_name() }</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						旧&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;</div>

					<div>
						<input type="text" class="changeInfoInputType" id="oldPassword"
							name="oldPassword" placeholder="请输入您的旧密码"> <span
							id="oldPasswordmsg" class="newpwdMSG"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;</div>

					<div>
						<input type="text" class="changeInfoInputType" id="newPassword"
							name="newPassword" placeholder="请输入您的新密码"> <span
							id="newPasswordmsg" class="newpwdMSG"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</div>

					<div>
						<div type="text" class="changeInfoInputType">
							${sessionScope.doctor_session.getPosition_name() }</div>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">个&nbsp;人&nbsp;介&nbsp;绍&nbsp;</div>

					<div>
						<textarea type="text" id="doctor_award" name="doctor_award"
							class="changeInfoTextarea"
							placeholder=" ${sessionScope.doctor_session.getDoctor_award() }">${sessionScope.doctor_session.getDoctor_award()}</textarea>
					</div>
				</div>
			</div>

			<div>
				<button class="chooseupload_btn" onclick="doctorchangeInfo()">确认修改</button>
			</div>
            </div>
		</div>
	</div>
</body>
</html>