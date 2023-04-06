<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>管理员登录主界面</title>
<script
	src="${pageContext.request.contextPath }/js/jquery-2.1.1-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin_index.css">

<script href="${pageContext.request.contextPath }/js/1.js"></script>

<script>
function refresh(){
    url = location.href; //把当前页面的地址赋给变量 url
    //分切变量 url 分隔符号为 "#"
    if( url.indexOf("nowTime=") == -1){ //如果url后没有#
    	var date=new Date();
        url += "?nowTime="+ date.getTime(); //加入 #
        console.log("执行刷新",url);
        self.location.replace(url); //刷新页面
    }
  
}
var isSelected = 0;
$(document).ready(function () {
refresh();

var datalist = ['值班安排', '注册医生账户', '注销医生账户','修改医生信息']
var weblist = ['adminSetScheduleScene.jsp', 'doctor_register.jsp', 'adminCancelDoctorScene.jsp','chooseChangeInfoDoctor.jsp']
var temp = '<ul><img class="recordTypeImg" src="${pageContext.request.contextPath }/img/medicalrecords.png" /><div class="operationFontType">管理操作</div>';
for (var i = 0; i < datalist.length; i++) {
    temp += '<li data-src="' + weblist[i] + '" onclick="setActiveType(' + i + ')" class="">' + datalist[i] + '</li>';
    console.log(isSelected == i ? 'active_type' : " wu")
}
temp += '</ul>'
$("#main_left").html(temp);
});
setActiveType = function (i) {
    console.log("我被调用了，现在是", i)
    isSelected = i
    
        var a = document.getElementsByTagName("ul")
        console.log(a)
        console.log($(this).find('li').eq(1).val)
}
	$(function() {
		 $(".main_left li").click(function() {
				var address = $(this).attr("data-src");
				// alert(address);
				console.log(address);
				$("iframe").attr("src", address)
			});
	});
	logout = function() {
		$.ajax({
					url : "${pageContext.request.contextPath }/logout",
					type : "post",
					//data表示发送的数据
					data : JSON.stringify(),
					//定义发送请求的数据格式为JSON字符串
					contentType : "application/json;charset=UTF-8",
					//定义毁掉的数据格式也是json格式，该属性可以省略
					dataType : "json",
					//成功响应结果
					success : function(data) {
						window.document.location.href = "${pageContext.request.contextPath }/jsp/login.jsp";
					}
				});
	}
</script>

<script language='javascript'>
history.go(1);
</script>
<style type="text/css">
.sessionposition {
	margin-left: 200px;
	margin-top: 50px;
}

        .container_flex_colomn {
            text-align: right;
            width: 100%;
            display: flex;
            flex-direction: column;
            position: relative;
            top: 2.5rem;
        }
</style>
</head>


<body class="backcol">
	<%
	if (session.getAttribute("admin_session") == null) {
		// 重定向到新地址
		//String site = new String("${pageContext.request.contextPath }/jsp/login.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		//  response.setHeader("Location","/jsp/login.jsp");}
		response.setHeader("Location", "../login.jsp");
	}
	%>

	<div class="container2">
		<!-- 左侧导航 -->
		<div class="main_left" id="main_left">
		<!-- 	<ul>
				<li data-src="adminSetScheduleScene.jsp">值班安排</li>
				<li data-src="doctor_register.jsp">注册医生账户</li>
				<li data-src="adminCancelDoctorScene.jsp">注销医生账号</li>
				<li data-src="chooseChangeInfoDoctor.jsp">修改医生信息</li>
			</ul> -->
		</div>
		<!-- 右侧内容 -->
		<div class="main_right">
		<div class="fonttitle">医院信息管理操作平台</div>
	<div class="container_flex_colomn">
                <div class="doctorAlign">您好！
                    ${sessionScope.admin_session.getA_name() }
                    <button onclick="logout()" class="logoutBtn_type">退出登录</button></div>
            </div>
			<iframe frameborder="0" scrolling="yes" class="iframeType"
				src="adminSetScheduleScene.jsp" id="aa"></iframe>

		</div>
	</div>
</body>
</html>