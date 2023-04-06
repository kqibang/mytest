<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath }/js/jquery-2.1.1-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/doctor_index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/1.css">
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
						var appointmentResultbtn = '修改诊疗结果';
						var appointmentResult = data.appoint_result;
						if (data.appoint_result == 'null') {
							appointmentResultbtn = '确认上传';
							appointmentResult = "请上传诊疗结果！"
						}
						var msg = "";
						msg += "<table><tr>";
						msg += "<th>姓名:</th>";
						msg += "<td>" + data.patient_name + "</td>";
						msg += "<th>性别:</th>";
						msg += "<td>" + data.patient_gender + "</td>";
						msg += "<th>年龄:</th>";
						msg += "<td>" + data.patient_age + "</td>";
						msg += "<th>就诊日期:</th>";
						msg += "<td class='timewidth'>" + data.data_name
								+ "</td>";
						msg += "</tr>";
						msg += "</table><div class='arstyle'><div>诊断结果</div><div><textarea name='appointment_result' id='appointment_result' cols='15' rows='15' placeholder="+appointmentResult+"></textarea>";
						// alert($('#appointment_result').val());
						msg += "</div><div><button id='uploadAppointResult' name='uploadAppointResult' onclick='uploadMedicalRecords("
								+ data.appointment_id
								+ ","
								+ $('#appointment_result').val()
								+ ")'>"
								+ appointmentResultbtn + "</button></div>";
						msg += "</div>";
						//alert(msg);
						$("#aaaa").html(msg);
						//  $("#table_align").html(msg);
					});

	uploadMedicalRecords = function(appointment_id) {
		var appoint_result = $('#appointment_result').val();
		alert(appoint_result);
		$.ajax({
			url : "${pageContext.request.contextPath }/uploadMedicalRecord",
			type : "post",
			//data表示发送的数据
			data : JSON.stringify({
				appointment_id : appointment_id,
				appoint_result : appoint_result
			}),
			//定义发送请求的数据格式为JSON字符串
			contentType : "application/json;charset=UTF-8",
			//定义毁掉的数据格式也是json格式，该属性可以省略
			dataType : "json",
			//成功响应结果
			success : function(data) {
				alert("上传成功");
				//window.loaction.href="${pageContext.request.contextPath }/jsp/doctor/allAppointedPatients.jsp";
			}
		});
	}
</script>
<style type="text/css">
.table_on_uploadappoint {
	width: 100%;
	margin-top: 60px;
	margin-left: 5%;
	border-radius: 8px;
}

table {
	width: 90%;
	font-size:25px;
	border-collapse: collapse;
	border-radius: 8px;
}

table tr th {
	text-align: right;
}

table tr td {
	
}

.timewidth {
	width: 300px;
}
</style>
</head>
<body class="backcol_dson">
	<div class="font-1">上传诊疗信息页</div>
	<div id="aaaa" class="table_on_uploadappoint"></div>

</body>

</html>