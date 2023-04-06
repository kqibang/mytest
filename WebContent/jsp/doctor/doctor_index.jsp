<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta charset="utf-8" />
<title>医生登录主界面</title>
<script
	src="${pageContext.request.contextPath }/js/jquery-2.1.1-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/doctor_index.css">

<script href="${pageContext.request.contextPath }/js/1.js"></script>

  <script>
        // $(function () {
        //     $(".main_left li").on("click", function () {
        //         var address = $(this).attr("data-src");
        //         // alert(address);
        //         $("iframe").attr("src", address);
        //     });
        // });
        var isSelected = 0;
        $(document).ready(function () {
        	
            var datalist = ['查看值班信息', '修改个人信息', '上传诊疗信息']
            var weblist = ['scheduleScene.jsp', 'changeInfo.jsp', 'allAppointedPatients.jsp']
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
        $(function () {
            $(".main_left li").click(function () {
                var address = $(this).attr("data-src");
                // alert(address);
                console.log(address);
                $("iframe").attr("src", address)
            });
        })
        logout = function () {
            $
                .ajax({
                    url: "${pageContext.request.contextPath }/logout",
                    type: "post",
                    //data表示发送的数据
                    data: JSON.stringify(),
                    //定义发送请求的数据格式为JSON字符串
                    contentType: "application/json;charset=UTF-8",
                    //定义毁掉的数据格式也是json格式，该属性可以省略
                    dataType: "json",
                    //成功响应结果
                    success: function (data) {
                        window.document.location.href = "${pageContext.request.contextPath }/jsp/login.jsp";
                    }
                });
        }
    </script>
    <script language='javascript'>
        history.go(1);
    </script>
    <style type="text/css">
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
    <!-- <%
	if (session.getAttribute("doctor_session") == null) {
		// 重定向到新地址
		//String site = new String("${pageContext.request.contextPath }/jsp/login.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		//  response.setHeader("Location","/jsp/login.jsp");}
		response.setHeader("Location", "../login.jsp");
	}
	%> -->

    <div class="container2">
        <!-- 左侧导航 -->
        <div class="main_left" id="main_left">
            <!-- <ul>
				<li data-src="scheduleScene.jsp">查看值班信息</li>
				<li data-src="changeInfo.jsp">修改个人信息</li>
				<li data-src="allAppointedPatients.jsp">上传诊疗信息</li>
			</ul> -->
        </div>
        <!-- 右侧内容 -->
        <div class="main_right">
            <div class="fonttitle">医生信息管理操作平台</div>
            <div class="container_flex_colomn">
                <div class="doctorAlign">您好！
                    ${sessionScope.doctor_session.getDoctor_name() }
                    <button onclick="logout()" class="logoutBtn_type">退出登录</button></div>
            </div>
            <iframe frameborder="0" scrolling="yes" class="iframeType" src="scheduleScene.jsp" id="aa"></iframe>

        </div>
    </div>
</body>
</html>