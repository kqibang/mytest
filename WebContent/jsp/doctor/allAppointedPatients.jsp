<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约病人</title>

<!-- 显示所有预约过本医生的病人 -->
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
	$(document).ready(function () {
		var doctor_id=${sessionScope.doctor_session.getDoctor_id()};
		//alert(doctor_id);
        $.ajax({
            async: true,
            url: "${pageContext.request.contextPath }/getAllAppointedPatient",
            type: "post",
            data : JSON.stringify({doctor_id:doctor_id}),
          //定义发送请求的数据格式为JSON字符串
			contentType : "application/json;charset=UTF-8",
			//定义毁掉的数据格式也是json格式，该属性可以省略
			dataType : "json",
            success: function (data) {
            	//console.log(data.length)
            	console.log(data)
            	var msg = "";
        for ( var i = 0; i < data.length; i++) {//循环json对象，拼接tr,td的html
        	var appoint_btn_state="已上传结果";
            var a='uploaded_btn';
        	if(data[i].appoint_result==null){
        		appoint_btn_state="未上传结果";
        		 a='chooseupload_btn';
        	}
           msg += "<table id='patientsInfo' class='tablePatients'><tr>";
           msg += "<th colspan='2'>"+ "姓名:"+data[i].patient_name+"</th>";
          // msg += "<td>" + data[i].patient_name + "</td>";
           msg += "<th colspan='2'>" + "性别:"+data[i].patient_gender+"</th>";
          // msg += "<td>" + data[i].patient_gender + "</td>";
           msg += "<td rowspan='2' colspan='3' class='uploadbtn_placetype'><button onclick='uploadAppointment("+data[i].patient_id+","+data[i].appointment_id+",&quot;"+data[i].data_name+"&quot;,"+data[i].patient_age+",&quot;"+data[i].appoint_result+"&quot;,&quot;"+data[i].patient_gender+"&quot;,&quot;"+data[i].patient_name+"&quot;)' class="+a+">"+appoint_btn_state +"</button></td>"
           msg += "</tr><tr>";
           msg += "<th rowspan='2'>" + "预约日期:"+data[i].data_name + "</th>";
       //    msg += "<td>" + data[i].data_name+ "</td>";
           msg += "<td colspan='2'>时间段:" + data[i].startwork_time+"-"+data[i].endwork_time + "</td>";
           msg += "";
           msg += "</tr></table>";
        }
        $("#table_align").html(msg);
            }
        });
    });
	</script>
	<script type="text/javascript">
	uploadAppointment=function(patient_id,appointment_id,data_name,patient_age,appoint_result,patient_gender,patient_name){
	window.location.href="${pageContext.request.contextPath }/jsp/doctor/uploadScene.jsp?patient_id="+patient_id+"&appointment_id="+appointment_id+"&data_name="+data_name+"&patient_age="+patient_age+"&appoint_result="+appoint_result+"&patient_gender="+patient_gender+"&patient_name="+patient_name;
	}
	</script>
	<style type="text/css">
	table tr td{
	width:20.75rem;
		text-align: left;
	}
	table tr th{
	width:20.75rem;
		text-align: left;
	}	
	.tablePatients{
	/*border:2px solid #ff8000;*/
	border-bottom:.125rem solid black;
	width:100%;
	text-align: center;
	 border-collapse: collapse;
	 margin-top: 1.25rem;
	 border-radius: 1.125rem;
	 font-size: 1.675rem;
	 padding:1rem;
	}
	</style>
</head>
<body class="backcol_dson">


	<h1>预约病人列表</h1>
	<div id="table_align" class="table_align "></div>
	<!-- <table id="patientsInfo" class="tablePatients"></table> -->

</body>

</html>