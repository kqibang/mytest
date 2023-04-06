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
	href="${pageContext.request.contextPath }/css/admin_index.css">
<script 
	href="${pageContext.request.contextPath }/js/1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
<script type="text/javascript">
$(document).ready(function () {
	//alert(doctor_id);
	//初始自动加载  得到科室信息
    $.ajax({
        async: true,
        url: "${pageContext.request.contextPath }/getSubidAndName",
        type: "post",
        data : JSON.stringify(),
      //定义发送请求的数据格式为JSON字符串
		contentType : "application/json;charset=UTF-8",
		//定义毁掉的数据格式也是json格式，该属性可以省略
		dataType : "json",
        success: function (data) {
        	//console.log(data.length)
        	//console.log(data)
        	var msg = "";
        	for(var i=0;i<data.length;i++){
        	msg+="<option value="+data[i].sub_id+">"+data[i].sub_name+"</option>";
        	}     	
    $("#sub_id").html(msg);
        }
    });
  //初始自动加载  得到相应门诊信息
    $.ajax({
        async: true,
        url: "${pageContext.request.contextPath }/chooseTypeDepartment",   
        type: "post",
        data : JSON.stringify({sub_id:1}),
      //定义发送请求的数据格式为JSON字符串
		contentType : "application/json;charset=UTF-8",
		//定义毁掉的数据格式也是json格式，该属性可以省略
		dataType : "json",
        success: function (data) {
        	//console.log(data.length)
        	//console.log(data)
        	var msg = "";
        	for(var i=0;i<data.length;i++){
            	msg+="<option value="+data[i].sec_id+">"+data[i].sec_name+"</option>";
            	}
        $("#sec_id").html(msg);
        }
    });
    //自动加载 获取职位信息
    $.ajax({
        async: true,
        url: "${pageContext.request.contextPath }/getPositionInfo",
        type: "post",
        data : JSON.stringify({sub_id:1}),
      //定义发送请求的数据格式为JSON字符串
		contentType : "application/json;charset=UTF-8",
		//定义毁掉的数据格式也是json格式，该属性可以省略
		dataType : "json",
        success: function (data) {
        	//console.log(data.length)
        	//console.log(data)
        	var msg = "";
        	for(var i=0;i<data.length;i++){
            	msg+="<option value="+data[i].doctor_position_id+">"+data[i].position_name+"</option>";
            	}
        $("#doctor_position").html(msg);
        }
    });
});
//选择科室时请求相应门诊
chooseSub = function(that){
	//console.log(that.value)
	var sub_id = $("#sub_id option:selected").val();
	 $.ajax({
	        async: true,
	        url: "${pageContext.request.contextPath }/chooseTypeDepartment",
	        type: "post",
	        data : JSON.stringify({sub_id:sub_id}),
	      //定义发送请求的数据格式为JSON字符串
			contentType : "application/json;charset=UTF-8",
			//定义毁掉的数据格式也是json格式，该属性可以省略
			dataType : "json",
	        success: function (data) {
	        	//console.log(data.length)
	        	//console.log(data)
	        	var msg = "";
	        	for(var i=0;i<data.length;i++){
	            	msg+="<option value="+data[i].sec_id+">"+data[i].sec_name+"</option>";
	            	}
	        $("#sec_id").html(msg);
	        }
	    });
}
//注册医生用户时
   insertDoctor = function()
    {
	var doctor_name=$("#d_name").val();
	var doctor_address=$("#d_address").val();
	var doctor_award=$("#d_award").val();
	var doctor_identity_id=$("#d_identity_id").val();
	var sub_id=$("#sub_id option:selected").val();
	var sec_id=$("#sec_id option:selected").val();
	var doctor_password=$("#d_password").val();
	var doctor_position_id=$("#doctor_position option:selected").val();
	//alert("${pageContext.request.contextPath }");
	//console.log(sub_id);console.log(sec_id);
	if(doctor_name==null||doctor_address==null||doctor_identity_id==null||sub_id==null||
			sec_id==null||doctor_password==null||doctor_position_id==null){
		alert("医生信息不可为空");
	}else if(doctor_identity_id.length!=18){
		$("#doctor_identity").html("身份证号码应为18位！")
	}else if(doctor_password.length<=5){
		$("#doctor_identity").html("√")
		$("#passwordInfo").html("密码长度应大于6位！")
	}else{
		$("#doctor_identity").html("√")
		$("#passwordInfo").html("√")
	$.ajax({
		url:"${pageContext.request.contextPath }/insertDoctor.action",
		type:"post",
		
		//data表示发送的数据
		//JSON.stringify
		data:JSON.stringify({
			doctor_name:doctor_name,
			doctor_address:doctor_address,
			doctor_award:doctor_award,
			doctor_identity_id:doctor_identity_id,
			sub_id:sub_id,
			sec_id:sec_id,
			doctor_password:doctor_password,
			doctor_position_id:doctor_position_id
		}),
		//定义发送请求的数据格式为JSON字符串
		contentType:"application/json;charset=UTF-8",
		//定义毁掉的数据格式也是json格式，该属性可以省略
		dataType:"json",
		//成功响应结果
		success:function(data){
			if(data==1){
			//	console.log("请求发送成功"+data);
				//alert(data.sub_id);
				alert("注册成功");
			}
			else{
				alert("注册失败，请检查信息");
			}
		}
	});
	}
};  

</script>
</head>

<body class="backcol_dson">
	<h1>注册医生</h1>
	<div class="allposiType">
		<div class="controlPosiType">
			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名
					</div>

					<div>
						<input type="text" class="changeInfoInputType" placeholder="请输入医生姓名" id="d_name">
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						住   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址
					</div>

					<div>
						<input type="text" class="changeInfoInputType" placeholder="请输入医生住址" id="d_address">
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						身份证号码
					</div>

					<div>
						<input type="text" class="changeInfoInputType" placeholder="请输入医生身份证号码"  id="d_identity_id"><span id="doctor_identity"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						科 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室
					</div>

					<div>
						<!-- <input type="text" class="changeInfoInputType" placeholder="" value=""> -->
						<select name="sub_id" id="sub_id" class="selectSubSecidType" onchange="chooseSub(this)">
							
						</select>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						门 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;诊
					</div>

					<div>
						<!-- <input type="text" class="changeInfoInputType" placeholder="" value=""> -->
						<select name="sec_id" id="sec_id" class="selectSubSecidType">
						</select>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码
					</div>

					<div>
						<input type="text" class="changeInfoInputType" placeholder="请输入密码" id="d_password"><span id="passwordInfo"></span>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						职 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位
					</div>

					<div>
						<select name="doctor_position" id="doctor_position" class="selectSubSecidType">
						</select>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="container2">
					<div class="aaaAttr">
						个&nbsp;人&nbsp;介&nbsp;绍&nbsp;
					</div>

					<div>
						<textarea type="text" class="changeInfoTextarea" placeholder="个人介绍" id="d_award"></textarea>
					</div>
				</div>
			</div>

			<div><button class="chooseupload_btn1" onclick="insertDoctor();">注册</button></div>
		</div>
	</div>
</body>
</html>