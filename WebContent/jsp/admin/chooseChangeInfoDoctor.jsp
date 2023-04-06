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
            	var msg = "<option value='-1' selected></option>";
            	for(var i=0;i<data.length;i++){
            	msg+="<option value="+data[i].sub_id+">"+data[i].sub_name+"</option>";
            	}     	
        $("#sub").html(msg);
            }
        });
        getAllDoctors();
    });
  //选择科室时请求相应门诊
    chooseSub = function(that){
    	//console.log(that.value)
    	var sub_id = $("#sub option:selected").val();
    	if(sub_id==-1){
    		 $("#sec").html("<option value='-1'></option>");
    		getAllDoctors();
    	}
    	else{
    		getDoctorsAndSecBySub(sub_id);
    	}
    }
 
  //通过科室 门诊id选择医生
    selectDoctorBySubAndSec = function(that){
    //	console.log($("#sub option selected").val());
    	var sub_id = $("#sub option:selected").val();
    	var sec_id = $("#sec option:selected").val();
    	if(sec_id==-1&&sub_id!=-1){
    		getDoctorsAndSecBySub(sub_id);
   	}
   	else{
    	 $.ajax({
    		 async: true,
 	        url: "${pageContext.request.contextPath }/selectDoctorBySubAndSec",
 	        type: "post",
 	        data : JSON.stringify({sub_id:sub_id,sec_id:sec_id}),
 	      //定义发送请求的数据格式为JSON字符串
 			contentType : "application/json;charset=UTF-8",
 			//定义毁掉的数据格式也是json格式，该属性可以省略
 			dataType : "json",
 	        success: function (data) {
 	        	//console.log(data.length)
 	        	//console.log(data)
 	        	var msg="";
 	        	if(data!=""){
 	        	 msg = "<h1>"+data[0].sub_name+data[0].sec_name+"医生</h1> ";
 	            for(var i=0;i<data.length;i++){
 	            	msg +=  '<div class="partdoctor" ><div class="container2" ><div class="setScheduleDoctorInfoTypeLeft" >';
 	            	msg +=  '<div class="container2">';
 	            	msg +=  '<div class="container2">';
 	            	msg +=  '<div class="partdoctorAttr">编&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;号:</div>';
                    msg +=  "<div class='partdoctorValue'>"+data[i].doctor_id+"</div>";
                    msg +=  "</div>&nbsp; &nbsp; &nbsp; &nbsp;<div class='container2'>";
                    msg +=  '<div class="partdoctorAttr">医生姓名:</div>';
                    msg +=  '<div class="partdoctorValue">'+data[i].doctor_name+'</div></div></div>';
                    msg +=  '<div class="container2"><div class="container2"><div class="partdoctorAttr">科&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;室:</div>';
                    msg +=  ' <div class="partdoctorValue">'+data[i].sub_name+'</div></div>&nbsp; &nbsp; &nbsp; &nbsp;';
                    msg +=  '<div class="container2"><div class="partdoctorAttr">门 &nbsp; &nbsp; &nbsp;&nbsp;诊:</div>';
                    msg +=  ' <div class="partdoctorValue">'+data[i].sec_name+'</div></div></div></div>';
                    msg +=  ' <div class="setScheduleDoctorInfoTypeRight"><button class="changeDoctor_btn1" onclick="doctorChangeInfo('+data[i].doctor_id+')">修改信息</button></div></div></div><hr />';
 	            }
 	           $("#doctors_place").html(msg);
 	           }
 	        	else{
 	        		msg="<div class='nodoctype'>无该医生!</div>";
 	        		$("#doctors_place").html(msg);
 	        	}
 	        }
 	    });}
    }
    getDoctorsByDocName=function(){
    	var doctor_name = $("#doctor_name").val();
    	//console.log(doctor_name);
    	$.ajax({
    		 async: true,
	 	        url: "${pageContext.request.contextPath }/getDoctorsByDocName",
	 	        type: "post",
	 	        data : JSON.stringify({doctor_name:doctor_name}),
	 	      //定义发送请求的数据格式为JSON字符串
	 			contentType : "application/json;charset=UTF-8",
	 			//定义毁掉的数据格式也是json格式，该属性可以省略
	 			dataType : "json",
	 	        success: function (data) {
	 	        	//console.log(data.length)
	 	        	//console.log(data)
	 	        	var msg="";
	 	        	if(data!=""){
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
	 	                    	var msg = "<option value='-1' selected></option>";
	 	                    	for(var i=0;i<data.length;i++){
	 	                    	msg+="<option value="+data[i].sub_id+">"+data[i].sub_name+"</option>";
	 	                    	}     	
	 	                $("#sub").html(msg);
	 	                    }
	 	                });
	 	        		 $("#sub").html("<option value='-1'></option>");
		 	            for(var i=0;i<data.length;i++){
		 	            	msg +=  '<div class="partdoctor" ><div class="container2" ><div class="setScheduleDoctorInfoTypeLeft" >';
		 	            	msg +=  '<div class="container2">';
		 	            	msg +=  '<div class="container2">';
		 	            	msg +=  '<div class="partdoctorAttr">编&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;号:</div>';
		                    msg +=  "<div class='partdoctorValue'>"+data[i].doctor_id+"</div>";
		                    msg +=  "</div>&nbsp; &nbsp; &nbsp; &nbsp;<div class='container2'>";
		                    msg +=  '<div class="partdoctorAttr">医生姓名:</div>';
		                    msg +=  '<div class="partdoctorValue">'+data[i].doctor_name+'</div></div></div>';
		                    msg +=  '<div class="container2"><div class="container2"><div class="partdoctorAttr">科&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;室:</div>';
		                    msg +=  ' <div class="partdoctorValue">'+data[i].sub_name+'</div></div>&nbsp; &nbsp; &nbsp; &nbsp;';
		                    msg +=  '<div class="container2"><div class="partdoctorAttr">门 &nbsp; &nbsp; &nbsp;&nbsp;诊:</div>';
		                    msg +=  ' <div class="partdoctorValue">'+data[i].sec_name+'</div></div></div></div>';
		                    msg +=  ' <div class="setScheduleDoctorInfoTypeRight"><button class="changeDoctor_btn1" onclick="doctorChangeInfo('+data[i].doctor_id+')">修改信息</button></div></div></div><hr />';
		 	            }
		 	           $("#doctors_place").html(msg);
		 	           }
		 	        	else{
		 	        		msg="<div class='nodoctype'>无该名字医生!</div>";
		 	        		$("#doctors_place").html(msg);
		 	        	}
	 	        }
    	});
    }
    
    getAllDoctors = function(){
    	//自动加载得到所有医生信息
        $.ajax({
    		 async: true,
 	        url: "${pageContext.request.contextPath }/getAllDoctors",
 	        type: "post",
 	        data : JSON.stringify({}),
 	      //定义发送请求的数据格式为JSON字符串
 			contentType : "application/json;charset=UTF-8",
 			//定义毁掉的数据格式也是json格式，该属性可以省略
 			dataType : "json",
 	        success: function (data) {
 	        	//console.log(data.length)
 	        	//console.log(data)
 	        	var msg="";
 	        	if(data!=""){
 	        	 msg = "<h1>所有医生</h1> ";
 	            for(var i=0;i<data.length;i++){
 	            	msg +=  '<div class="partdoctor" ><div class="container2" ><div class="setScheduleDoctorInfoTypeLeft" >';
 	            	msg +=  '<div class="container2">';
 	            	msg +=  '<div class="container2">';
 	            	msg +=  '<div class="partdoctorAttr">编&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;号:</div>';
                    msg +=  "<div class='partdoctorValue'>"+data[i].doctor_id+"</div>";
                    msg +=  "</div>&nbsp; &nbsp; &nbsp; &nbsp;<div class='container2'>";
                    msg +=  '<div class="partdoctorAttr">医生姓名:</div>';
                    msg +=  '<div class="partdoctorValue">'+data[i].doctor_name+'</div></div></div>';
                    msg +=  '<div class="container2"><div class="container2"><div class="partdoctorAttr">科&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;室:</div>';
                    msg +=  ' <div class="partdoctorValue">'+data[i].sub_name+'</div></div>&nbsp; &nbsp; &nbsp; &nbsp;';
                    msg +=  '<div class="container2"><div class="partdoctorAttr">门 &nbsp; &nbsp; &nbsp;&nbsp;诊:</div>';
                    msg +=  ' <div class="partdoctorValue">'+data[i].sec_name+'</div></div></div></div>';
                    msg +=  ' <div class="setScheduleDoctorInfoTypeRight"><button class="changeDoctor_btn1" onclick="doctorChangeInfo('+data[i].doctor_id+')"> 修改信息</button></div></div></div><hr />';
 	            }
 	           $("#doctors_place").html(msg);}
 	        	else{
 	        		msg="<div class='nodoctype'>无该医生!</div>";
 	        		$("#doctors_place").html(msg);
 	        	}
 	        }
 	    });
    }
    
    getDoctorsAndSecBySub = function(sub_id){
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
  	        	var msg = "<option value='-1'></option>";
  	        	for(var i=0;i<data.length;i++){
  	            	msg+="<option value="+data[i].sec_id+">"+data[i].sec_name+"</option>";
  	            	}
  	        $("#sec").html(msg);
  	        }
  	    });

  	 $.ajax({
  		 async: true,
          url: "${pageContext.request.contextPath }/selectDoctorBySub",
          type: "post",
          data : JSON.stringify({sub_id:sub_id}),
        //定义发送请求的数据格式为JSON字符串
  		contentType : "application/json;charset=UTF-8",
  		//定义毁掉的数据格式也是json格式，该属性可以省略
  		dataType : "json",
          success: function (data) {
          	//console.log(data.length)
          	//console.log(data)
          	var msg="";
          	if(data!=""){

          	 msg = "<h1>"+data[0].sub_name+"医生</h1> ";
              for(var i=0;i<data.length;i++){
              	msg +=  ' <div class="partdoctor" ><div class="container2" ><div class="setScheduleDoctorInfoTypeLeft" >';
              	msg +=  '<div class="container2">';
              	msg +=  '<div class="container2">';
              	msg +=  '<div class="partdoctorAttr">编&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;号:</div>';
                 msg +=  "<div class='partdoctorValue'>"+data[i].doctor_id+"</div>";
                 msg +=  "</div>&nbsp; &nbsp; &nbsp; &nbsp;<div class='container2'>";
                 msg +=  '<div class="partdoctorAttr">医生姓名:</div>';
                 msg +=  '<div class="partdoctorValue">'+data[i].doctor_name+'</div></div></div>';
                 msg +=  '<div class="container2"><div class="container2"><div class="partdoctorAttr">科&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;室:</div>';
                 msg +=  ' <div class="partdoctorValue">'+data[i].sub_name+'</div></div>&nbsp; &nbsp; &nbsp; &nbsp;';
                 msg +=  '<div class="container2"><div class="partdoctorAttr">门 &nbsp; &nbsp; &nbsp;&nbsp;诊:</div>';
                 msg +=  ' <div class="partdoctorValue">'+data[i].sec_name+'</div></div></div></div>';
                 msg +=  ' <div class="setScheduleDoctorInfoTypeRight"><button class="changeDoctor_btn1" onclick="doctorChangeInfo('+data[i].doctor_id+')"> 修改信息</button></div></div></div><hr />';
              }
             $("#doctors_place").html(msg);}
          	else{
         		msg="<div class='nodoctype'>无该医生!</div>";
         		$("#doctors_place").html(msg);
         	}
          }
      });
    }
    
    doctorChangeInfo= function(doctor_id){
    	window.location.href="${pageContext.request.contextPath }/jsp/admin/adminchangInfoScene.jsp?doctor_id="+doctor_id;
    }
    
    </script>
</head>
<body class="backcol_dson">
    <h1>选择修改医生账号</h1>
    <div class="container2">
        <div class="container2  selectheight">
            <div class=" subsecname">科室：</div>
            <div>
                <select name="sub" id="sub" onchange="chooseSub(this)">

                </select>
            </div>
        </div>
        <div class="container2 selectheight">
            <div class="subsecname">门诊：</div>
            <div>
                <select name="sec" id="sec" class="select_sec" onchange="selectDoctorBySubAndSec(this)">

                </select>
                </select>
            </div>

        </div>
        <div class="container2 selectheight">
            <div class="subsecname">医生名字：</div>
            <div>
                <input id="doctor_name" name="doctor_name" class="doctorinpuType" /> <button
                    class="searcheDoctorBTNtype" onclick="getDoctorsByDocName()">搜索</button>
            </div>
        </div>
    </div>
    <hr />
    <div class="doctorshowdiv1">
        <div class="doctorsShowTypeAll" id="doctors_place">
            <!-- 边框开始 -->
            <div class="partdoctor">
                <div class="container2">
                    <!-- 医生信息部分开始 -->
                    <div class="setScheduleDoctorInfoTypeLeft">
                        <div class="container2">
                            <div class="container2">
                                <div class="partdoctorAttr">编&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;号:</div>
                                <div class="partdoctorValue">230001</div>
                            </div>
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <div class="container2">
                                <div class="partdoctorAttr">医生姓名:</div>
                                <div class="partdoctorValue">移山</div>
                            </div>
                        </div>
                        <div class="container2">
                            <div class="container2">
                                <div class="partdoctorAttr">科&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;室:</div>
                                <div class="partdoctorValue">230001</div>
                            </div>
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <div class="container2">
                                <div class="partdoctorAttr">门&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;诊:</div>
                                <div class="partdoctorValue">111</div>
                            </div>
                        </div>
                    </div>
                    <!-- 医生信息部分结束 -->
                    <!-- 添加值班按钮开始 -->
                    <div class="setScheduleDoctorInfoTypeRight">
                        <button class="changeDoctor_btn1">修改信息</button>
                    </div>
                    <!-- 添加值班按钮结束 -->

                </div>


            </div>
            <!-- 边框结束 -->
        </div>
    </div>

</body>

</html>