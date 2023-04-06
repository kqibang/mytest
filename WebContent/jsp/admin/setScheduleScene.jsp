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
$(document).ready(
				function() {
					var data = GetRequest();
					//console.log(data);
					var doctor_id = data.doctor_id;
					var sub_name = data.sub_name;
					var sec_name =data.sec_name;
					var doctor_name = data.doctor_name;
					document.getElementById("doctor_name").innerHTML=doctor_name;
					document.getElementById("sub_name").innerHTML=sub_name;
					document.getElementById("sec_name").innerHTML=sec_name;
					document.getElementById("doctor_id").innerHTML=doctor_id;
					var msg = "";
					//初始自动加载  得到时间信息
			        $.ajax({
			            async: true,
			            url: "${pageContext.request.contextPath }/getDateFromNowOn",
			            type: "post",
			            data : JSON.stringify(),
			          //定义发送请求的数据格式为JSON字符串
			    		contentType : "application/json;charset=UTF-8",
			    		//定义毁掉的数据格式也是json格式，该属性可以省略
			    		dataType : "json",
			            success: function (data) {
			            	console.log(data)
			            	var msg = "";
			            	for(var i=0;i<data.length;i++){
			            		msg += "<option value="+data[i].date_id+">"+data[i].data_name+"</option>";
			            	}
			            	$("#date_id").html(msg);
			            }
			        });
				});

uploadScheduleInfo=function(){
	var timeControl = document.querySelector('input[type="time"]');
	var startwork_time = $("#startwork_time").val();
	var endwork_time=$("#endwork_time").val();
	console.log(timeControl)
	console.log(startwork_time);
	console.log(endwork_time);
	var doctor_id = $("#doctor_id").text();
	var date_id = $("#date_id option:selected").val();
	 $.ajax({
         async: true,
         url: "${pageContext.request.contextPath }/setScheduleDoc",
         type: "post",
         data : JSON.stringify({
        	 startwork_time:startwork_time,
         endwork_time:endwork_time,
         doctor_id:doctor_id,
         date_id:date_id
         }),
       //定义发送请求的数据格式为JSON字符串
 		contentType : "application/json;charset=UTF-8",
 		//定义毁掉的数据格式也是json格式，该属性可以省略
 		dataType : "json",
         success: function (data) {
         	console.log(data)
         	var msg = "";
         	if(data==0){
         		alert("上传排班信息失败");
         	}else{
         		alert("上传排版信息成功！");
         		window.document.location.href = "${pageContext.request.contextPath }/jsp/admin/adminSetScheduleScene.jsp";
         	}
         }
     });
	
}	
</script>
  <style>
        h1 {
            text-align: center;
            margin-top: 10px;
        }

        .whole_ {
            width: 100%;
            text-align: center;
        /*    border: 2px solid;*/
            margin: 0 auto;
        }

        .whole_div {
            width: 90%;
            text-align: center;
            align-items: center;
            /* border: 1px solid; */
            font-size: 25px;
            font-weight: bold;
            margin: 0 auto;
        }
         
        .while_div_margin {
            margin-top: 60px;
           
        }

        .attr_ {
            margin-left: 30px;
            margin-right: 5px;
        }
         .firstrowwhile_div_margin{
         margin-top:10px;
         }
        .upload_scheduleInfo_btn {
            margin: 0 auto;
            font-size: 20px;
            color: rgb(0, 0, 0);
            background-color: coral;
            width: 180px;
            height: 40px;
            margin-bottom: 20px;
            border: 2px solid;
            border-radius: 10px;
        }

        .time_select_type {
            /* width: 120px; */
            border: 3px solid lightgreen;
            border-radius: 8px;
        }
    </style>
</head>

<body class="backcol_dson">
    <h1>值班安排</h1>
    <div class="whole_">
        <div class="whole_div container2 firstrowwhile_div_margin">
        <div class="attr_">编号:</div>
        <div class="attr_" id="doctor_id"></div>
            <div class="attr_">医生姓名:</div>
            <div class="" id="doctor_name" name="doctor_name">移山</div>
            <div class="attr_">科室:</div>
            <div class="" id="sub_name">123123321312</div>
            <div class="attr_">门诊:</div>
            <div class="" id="sec_name">2132312312</div>
        </div><hr/>
        <div class="whole_div container2 while_div_margin">
            <div class="attr_">请选择值班日期:</div>
            <select name="date_id" id="date_id">
                <option value="">2023-03-07</option>
            </select>
        </div><hr/>
        <div class="whole_div container2 while_div_margin">
            <div class="attr_">请选择值班时间段:</div>
            <input type="time" step="2" name="startwork_time" id="startwork_time" class="time_select_type">--
            <input type="time" step="2" name="endwork_time" id="endwork_time" class="time_select_type">
        </div><hr/>
        <div class="whole_div container2 while_div_margin">
            <button class="upload_scheduleInfo_btn" onclick="uploadScheduleInfo()">上传值班信息</button>
        </div><hr/>
    </div>
</body>
</html>