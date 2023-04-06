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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/1.css">
<script href="${pageContext.request.contextPath }/js/1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		refreshDate();
		
	})
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>简单日历</title>
<style type="text/css">
* {
	padding: 0%; /*设置内边距*/
	margin: 0%; /*设置外边距*/
}
/*设置日历的背景色 #f2f2f2*/
html, body {
	/*   background:#a3dfff;*/
	
}
/*设置整个页面的显示样式*/
/*设置整个页面的显示样式*/
.calendar {
	margin:0 auto;
	width: 70%;
	height:40rem;
	border-radius: .5rem;
	border:.125rem solid white;
	padding:5rem;
	/*  background: white;*/
	box-shadow: 0px .0625rem .0625rem rgba(0, 0, 0, .1);
	position: relative;
	top:5rem;
}
/*标题的显示样式*/
.title {
	height: 6.2rem;
	border-bottom: .1625rem solid rgba(0, 0, 0, .1);
	position: relative;
	text-align: center;
}
/*标题中的月份显示样式*/
#calendar-title {
	font-size: 2.875rem;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	padding: .75rem 0 0 0;
}
/*标题中的年份显示样式*/
#calendar-year {
	font-size: 1.55rem;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: normal;
}
/*上个月的超链接显示样式*/
#pre {
	position: absolute;
	top: 0px;
	left: 0px;
	background: url(${pageContext.request.contextPath }/img/last_arrow.png)
		no-repeat 50% 50%;
	/*没规定大小时，图片显示 0X0*/
	width: 3.75rem;
	height: 4.375rem;
}
/*下个月的超链接显示样式*/
#next {
	position: absolute;
	top: 0px;
	right: 0px;
	background: url(${pageContext.request.contextPath }/img/next_arrow.png)
		no-repeat 50% 50%;
	width: 3.75rem;
	height: 4.375rem;
}

.body-list ul {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	width: 100%;
	box-sizing: border-box;
}

.body-list ul li {
	font-size: 2.225rem;
	list-style: none;
	display: block;
	width: 14.28%;
	float: left;
	margin-top: 2.075rem;
	/*规定行高，垂直居中*/
	height: 2.225rem;
	line-height: 2.225rem;
	box-sizing: border-box;
	text-align: center;
	margin-left: 0px;
}
.body-list ul li div{
width:37.5rem;
}
/*类选择器：设置所有class属性为green的标签的样式*/
.green {
	color: #6ac13c;
}
/*设置已经过去的日期颜色*/
.lightgrey {
	/*color:black;*/
	color:white;
	font-weight: bold;
}
/*设置将来的日期颜色  color:#565656;*/
.darkgrey {
	color: black;
	font-weight: bold;
}
/*日期当天用绿色背景绿色文字加以显示border: 1px solid #6ac13c;background: #e9f8df;*/
.greenbox {
	border: .3125rem solid orange;
	background:white;
}

.start_endworktimeShow {
	/*    height: 100px;
      width: 100px;
     background-color: aqua;*/
	
}
/*start_endworktimeShow是没有安排值班的提示显示 */
.start_endworktimeShow {
	display: none;
	/*默认隐藏*/
}

.start_endworktimeShow:hover {
	display: initial;
	/*当鼠标hover时展示*/
}

.start_endworktimeShow div {
	display: none;
	/*默认隐藏*/
}

.start_endworktimeShow:hover div {
	display:initial;
	font-weight:normal;
	width: 18.75rem;
	color: white;
	z-index: 9999;
	/*当鼠标hover时展示*/
}
/*start_endworktimeShow1 是安排了值班的提示显示格式*/
.start_endworktimeShow1 {
	display: none;
	 transition: all .4s;
		z-index: 9999;
	/*默认隐藏*/
}

.start_endworktimeShow1:hover {
	display: initial;
		z-index: 9999;
				 /*鼠标经过添加放大效果*/
    transform: scale(1.2);
	/*当鼠标hover时展示*/
}

.start_endworktimeShow1 div {
	display: none;
		z-index: 9999;
	/*默认隐藏*/
}

.start_endworktimeShow1:hover div {
	display:inline-block;
	z-index: 9999;
	width: 28.75rem;
	color: white;
	font-size: 1.575rem;
	    transform: scale(1.2);
	    padding:.325rem;
	/*当鼠标hover时展示*/
}
.scheduled{ /*有值班安排的日期样式背景*/
background-color:lightgreen;
}
.start_end_time{
width:31.25rem;
border:.0625rem solid;
}
h1{
font-size: 3rem;
}
</style>
</head>
<body class="backcol_dson">
	<div class="calendar">
		<h1>值班信息表</h1>
		<div class="title">
			<h1 class="green" id="calendar-title">Month</h1>
			<h2 class="green" id="calendar-year">Year</h2>
			<a href="" id="pre"></a> <a href="" id="next"></a>
		</div>

		<div class="body">
			<div class="lightgrey body-list">
				<!--使用无序列表标签显示星期-->
				<ul>
					<li>日</li>
					<li>一</li>
					<li>二</li>
					<li>三</li>
					<li>四</li>
					<li>五</li>
					<li>六</li>
				</ul>
			</div>
			<!--使用无序列表标签显示日期，日期使用JavaScript动态获取，然后使用innerHTML设置<ul>标签之间的HTML-->
			<div class="darkgrey body-list">
				<ul id="days">

				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var month_olypic = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];//正常年份12个月对应的天数
		var month_normal = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];//闰年中12个月对应的天数
		var month_name = [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
				"9月", "10月", "11月", "12月" ];//定义要显示的月份数组
		//获取以上各个部分的id
		var holder = document.getElementById("days");
		var prev = document.getElementById("prev");//上个月份的超链接id
		var next = document.getElementById("next");//下个月份的超链接id
		var ctitle = document.getElementById("calendar-title");
		var cyear = document.getElementById("calendar-year");
		//获取当天的年月日
		var my_date = new Date();
		var my_year = my_date.getFullYear();//获取年份
		var my_month = my_date.getMonth(); //获取月份，下标从0开始
		var my_day = my_date.getDate();//获取当前日期

		//根据年月获取当月第一天是周几
		function dayStart(month, year) {
			var tmpDate = new Date(year, month, 1);
			return (tmpDate.getDay());
		}
		//根据年份判断某月有多少天，主要是区分闰年
		function daysMonth(month, year) {
			var tmp1 = year % 4;
			var tmp2 = year % 100;
			var tmp3 = year % 400;

			if ((tmp1 == 0 && tmp2 != 0) || (tmp3 == 0)) {
				return (month_olypic[month]);//闰年
			} else {
				return (month_normal[month]);//非闰年
			}
		}

		function refreshDate() {

			var doctor_id = ${sessionScope.doctor_session.getDoctor_id()};
			//alert(doctor_id);
			$.ajax({
				async : true,
				url : "${pageContext.request.contextPath }/doctorGetSchedule", //获取值班数据
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
					//console.log(data);
					var timearr = "";
					var c = ",";
					for (var i = 0; i < data.length; i++) {
						if(i==data.length-1){c=" "}
						data_name = data[i].data_name.split('-');
						timearr=timearr.concat(data_name);
						timearr = timearr.concat(c);
					}
					timearray=timearr.split(',');
					//console.log(timearray);  输出转换后的分割数组，即把xxxx-xx-xx的日期形式从 ‘-’分割开，然后通过取相应位置的值，遍历本月日期是否相同，若系统，则显示工作时间
					var msg = "";
					//my_month='0'.concat(my_month)
					//console.log(my_month==timearray[1]);
					var str = "";
					//计算当月的天数和每月第一天都是周几
					var totalDay = daysMonth(my_month, my_year);
					var firstDay = dayStart(my_month, my_year);
					//添加每个月前面的空白部分，即若某个月的第一天是从周三开始，则前面的周一，周二需要空出来
					for (var i = 0; i < firstDay; i++) {
						str += "<li>" + "</li>";
					}
					//从一号开始添加到totalDay（每个月的总天数），并为pre，next和当天添加样式
					var myclass;
					for (var i = 1; i <= totalDay; i++) {
						//如果是已经过去的日期，则用浅灰色显示
						if ((my_year < my_date.getFullYear())
								|| (my_year == my_date.getFullYear() && my_month < my_date
										.getMonth())
								|| (my_year == my_date.getFullYear()
										&& my_month == my_date.getMonth() && i < my_day)) {
							myclass = " class='lightgrey start_endworktimeShow'";
							myclass1="class= 'darkgrey start_endworktimeShow1 scheduled'";
					       
						}
						//如果正好是今天，则用绿色显示
						else if (my_year == my_date.getFullYear()
								&& my_month == my_date.getMonth() && i == my_day) {
							myclass = "class = 'green greenbox start_endworktimeShow'";
							myclass1="class= 'darkgrey start_endworktimeShow1 scheduled'";
						}
						//将来的日期用橙色色显示
						else {
							myclass = "class = 'darkgrey start_endworktimeShow'";
							myclass1="class= 'darkgrey start_endworktimeShow1 scheduled'";
						}
						var msg='';
						for(var a=1;a<=data.length;a++){
							//console.log(timearray[3*a-1]==i);
							if(timearray[3*a-3]==my_year&&timearray[3*a-2]==my_month+1&&timearray[3*a-1]==i)
								{
								msg+="<div>"+"时间段:"+data[a-1].startwork_time+"-"+data[a-1].endwork_time+"</br></div>";
								}
						}
						if(msg==''){
							str += "<li "+myclass+">" + i
							+ "<br><div>无安排</div></li>";
						}else{
							str += "<li "+myclass1+">" + i
							+ "<br><div  class='start_end_time'>"+msg+"</div></li>";
						}
				
					
					}
					//console.log(str);
					holder.innerHTML = str;//为日期的列表标签设置HTML；
					ctitle.innerHTML = month_name[my_month];//设置当前显示的月份
					cyear.innerHTML = my_year;//设置当前显示的年份
				
				}
			});//ajax结束
		
			/*
			var str = "";
			//计算当月的天数和每月第一天都是周几
			var totalDay = daysMonth(my_month, my_year);
			var firstDay = dayStart(my_month, my_year);
			//添加每个月前面的空白部分，即若某个月的第一天是从周三开始，则前面的周一，周二需要空出来
			for (var i = 0; i < firstDay; i++) {
				str += "<li>" + "</li>";
			}

			//从一号开始添加到totalDay（每个月的总天数），并为pre，next和当天添加样式
			var myclass;
			for (var i = 1; i <= totalDay; i++) {
				//如果是已经过去的日期，则用浅灰色显示
				if ((my_year < my_date.getFullYear())
						|| (my_year == my_date.getFullYear() && my_month < my_date
								.getMonth())
						|| (my_year == my_date.getFullYear()
								&& my_month == my_date.getMonth() && i < my_day)) {
					myclass = " class='lightgrey start_endworktimeShow'";
				}
				//如果正好是今天，则用绿色显示
				else if (my_year == my_date.getFullYear()
						&& my_month == my_date.getMonth() && i == my_day) {
					myclass = "class = 'green greenbox start_endworktimeShow'";
				}
				//将来的日期用橙色色显示
				else {
					myclass = "class = 'darkgrey start_endworktimeShow'";
				}
				str += "<li "+myclass+">" + i
						+ "<br><div id='start_end_time'>111</div></li>";
			}
			holder.innerHTML = str;//为日期的列表标签设置HTML；
			ctitle.innerHTML = month_name[my_month];//设置当前显示的月份
			cyear.innerHTML = my_year;//设置当前显示的年份*/
		}
		refreshDate();//显示日期，更新界面
		//上个月的点击事件
		pre.onclick = function(e) {
			e.preventDefault();
			my_month--;
			if (my_month < 0) {
				my_year--;
				my_month = 11;
			}
			refreshDate();//更新界面
		}
		//下个月的点击事件
		next.onclick = function(e) {
			e.preventDefault();
			my_month++;
			if (my_month > 11) {
				my_month = 0;
				my_year++;
			}
			refreshDate();//更新界面
		}
	</script>
</body>
</html>