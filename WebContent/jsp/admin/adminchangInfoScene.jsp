<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改医生个人信息</title>
<script
	src="${pageContext.request.contextPath }/js/jquery-2.1.1-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin_index.css">
<script href="${pageContext.request.contextPath }/js/1.js"></script>
<script type="text/javascript">
	function GetRequest() {
		var url = location.search;//获取url  ?后面的字符
		var request = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");//以&为分界，拿取参数
			for (var i = 0; i < strs.length; i++) {
				// request[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);  乱码
				request[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
			}
		}
		//  console.log(request);
		return request;
	}
	$(document)
			.ready(
					function() {
						var data = GetRequest();
						console.log(data);
						var doctor_id = data.doctor_id;
						var msg = "";
						//初始自动加载  得到科室信息
						$
								.ajax({
									async : true,
									url : "${pageContext.request.contextPath }/getSubidAndName",
									type : "post",
									data : JSON.stringify(),
									//定义发送请求的数据格式为JSON字符串
									contentType : "application/json;charset=UTF-8",
									//定义毁掉的数据格式也是json格式，该属性可以省略
									dataType : "json",
									success : function(data) {
										//console.log(data.length)
										//console.log(data)
										var msg = "";
										for (var i = 0; i < data.length; i++) {
											msg += "<option value="+data[i].sub_id+">"
													+ data[i].sub_name
													+ "</option>";
										}
										$("#sub").html(msg);
									}
								});

						$
								.ajax({
									async : true,
									url : "${pageContext.request.contextPath }/chooseTypeDepartment",
									type : "post",
									data : JSON.stringify({
										sub_id : 1
									}),
									//定义发送请求的数据格式为JSON字符串
									contentType : "application/json;charset=UTF-8",
									//定义毁掉的数据格式也是json格式，该属性可以省略
									dataType : "json",
									success : function(data) {
										//console.log(data.length)
										console.log(data)
										var msg = "";
										for (var i = 0; i < data.length; i++) {
											msg += "<option value="+data[i].sec_id+">"
													+ data[i].sec_name
													+ "</option>";
										}
										$("#sec").html(msg);
									}
								});

						//自动加载 获取职位信息
						$
								.ajax({
									async : true,
									url : "${pageContext.request.contextPath }/getPositionInfo",
									type : "post",
									data : JSON.stringify({
										sub_id : 1
									}),
									//定义发送请求的数据格式为JSON字符串
									contentType : "application/json;charset=UTF-8",
									//定义毁掉的数据格式也是json格式，该属性可以省略
									dataType : "json",
									success : function(data) {
										//console.log(data.length)
										//console.log(data)
										var msg = "";
										for (var i = 0; i < data.length; i++) {
											msg += "<option value="+data[i].doctor_position_id+">"
													+ data[i].position_name
													+ "</option>";
										}
										$("#doctor_position").html(msg);
									}
								});
						$
								.ajax({
									async : true,
									url : "${pageContext.request.contextPath }/getDoctorInfoWhenModify",
									type : "post",
									data : JSON.stringify({
										doctor_id : doctor_id
									}),
									//定义发送请求的数据格式为JSON字符串
									contentType : "application/json;charset=UTF-8",
									//定义毁掉的数据格式也是json格式，该属性可以省略
									dataType : "json",
									success : function(data) {
										//console.log(data.length)
										// console.log(data);
										var my_id = data.doctor_id;
										var my_name = data.doctor_name;
										//console.log(my_name);
										var my_address = data.doctor_address;
										var my_identity = data.doctor_identity_id;
										var my_sub_id = data.sub_name;
										var my_sec_id = data.sec_name;
										var my_password = data.doctor_password;
										var my_position = data.position_name;
										var my_introduction = data.doctor_award;
										document.getElementById("my_name").value = my_name;
										document.getElementById("my_address").value = my_address;
										document.getElementById("my_sub_id").innerHTML = my_sub_id;
										document.getElementById("my_sec_id").innerHTML = my_sec_id;
										document.getElementById("my_identity").value = my_identity;
										document.getElementById("my_password").value = my_password;
										document.getElementById("my_position").innerHTML = my_position;
										document
												.getElementById("my_introduction").value = my_introduction;
										document.getElementById("my_id").innerHTML = my_id;
									}
								});

					});

	//选择科室时请求相应门诊
	chooseSub = function(that) {
		//console.log(that.value)
		var sub_id = $("#sub option:selected").val();
		$.ajax({
			async : true,
			url : "${pageContext.request.contextPath }/chooseTypeDepartment",
			type : "post",
			data : JSON.stringify({
				sub_id : sub_id
			}),
			//定义发送请求的数据格式为JSON字符串
			contentType : "application/json;charset=UTF-8",
			//定义毁掉的数据格式也是json格式，该属性可以省略
			dataType : "json",
			success : function(data) {
				//console.log(data.length)
				console.log(data)
				var msg = "";
				for (var i = 0; i < data.length; i++) {
					msg += "<option value="+data[i].sec_id+">"
							+ data[i].sec_name + "</option>";
				}
				$("#sec").html(msg);
			}
		});

	}
	adminModifydoctorInfo = function() {
		var doctor_name = $("#my_name").val();
		var doctor_address = $("#my_address").val();
		var doctor_award = $("#my_introduction").val();
		var doctor_id = $("#my_id").text();
		var doctor_identity_id = $("#my_identity").val();
		var sub_id = $("#sub option:selected").val();
		var sec_id = $("#sec option:selected").val();
		var doctor_password = $("#my_password").val();
		var doctor_position_id = $("#doctor_position").val();
		if (doctor_identity_id.length != 18) {
			$("#indentityMSG").html("身份证号码长度应为18位");
			$("#passwordMSG").html(" ");
		} else if (doctor_password.length <= 6) {
			$("#passwordMSG").html("密码长度不少于6位");
			$("#indentityMSG").html(" ")
		} else {
			$("#passwordMSG").html(" ");
			$("#indentityMSG").html(" ")
			$
					.ajax({
						async : true,
						url : "${pageContext.request.contextPath }/adminModifydoctorInfo",
						type : "post",
						data : JSON.stringify({
							doctor_name : doctor_name,
							doctor_address : doctor_address,
							doctor_award : doctor_award,
							doctor_id : doctor_id,
							doctor_identity_id : doctor_identity_id,
							sub_id : sub_id,
							sec_id : sec_id,
							doctor_password : doctor_password,
							doctor_position_id : doctor_position_id
						}),
						//定义发送请求的数据格式为JSON字符串
						contentType : "application/json;charset=UTF-8",
						//定义毁掉的数据格式也是json格式，该属性可以省略
						dataType : "json",
						success : function(data) {
							//console.log(data.length)
							//console.log(data)
							if (data == 1) {
								alert("修改成功");
							} else {
								alert("修改失败");
							}
						}
					});
		}
	}
</script>
<style type="text/css">
.my_id_html_type {
	text-align: center;
	margin-top: 1.875rem;
	margin-left: 20px;
	font-size: 2.315rem;
	height: 2.4rem;
	line-height: 2.4rem;
}

select {
	font-size: 2.315rem;
	height: 2.8rem;
	line-height: 2.8rem;
	margin-top: 1.875rem;
}

.spanMSG {
	font-size: 10px;
}
</style>
</head>
<body class="backcol_dson">
	<h1>修改个人信息</h1>
	<div class="allposiType">
		<div class="controlPosiType">

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</div>

					<div>
						<div id="my_id" class="my_id_html_type" style="width:30rem;text-align: center;"></div>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</div>

					<div>
						<input type="text" class="changeInfoInputType"
							placeholder="请输入您的姓名" id="my_name">
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</div>

					<div>
						<input type="text" class="changeInfoInputType"
							placeholder="请输入您的住址" id="my_address">
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">身份证号码</div>

					<div>
						<input type="text" class="changeInfoInputType" placeholder=""
							value="" id="my_identity"><span id="indentityMSG"
							class="spanMSG"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室</div>

					<div>
						<select id="sub" name="sub" onchange="chooseSub(this)"></select>&nbsp;&nbsp;&nbsp;&nbsp;当前情况:<span
							id="my_sub_id"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;诊</div>

					<div>
						<select id="sec" name="sec"></select>&nbsp;&nbsp;&nbsp;&nbsp;当前情况:<span
							id="my_sec_id"></span>
					</div>
				</div>
			</div>


			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码</div>

					<div>
						<input type="text" class="changeInfoInputType"
							placeholder="请输入您的新密码" id="my_password"><span
							id="passwordMSG" class="spanMSG"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">
						职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</div>

					<div>
						<select id="doctor_position" name="doctor_position">

						</select>&nbsp;&nbsp;&nbsp;&nbsp;当前情况:<span id="my_position"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr111">个&nbsp;人&nbsp;介&nbsp;绍&nbsp;</div>

					<div>
						<textarea type="text" class="changeInfoTextarea"
							placeholder="个人介绍" id="my_introduction"></textarea>
					</div>
				</div>
			</div>

			<div>
				<button class="chooseupload_btn" onclick="adminModifydoctorInfo()">确认修改</button>
			</div>
		</div>
	</div>
</body>
</html>