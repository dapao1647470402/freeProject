<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- include Js and Css and so on of BootStrap file [Start]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
<!-- include Js and Css and so on of BootStrap file [End]-->

<!-- JSP Configure[Start] -->
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- JSP Configure[End] -->

<!-- inclued JS and Css at Internet [Start] -->
<!-- <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- inclued JS and Css at Internet [End] -->

<script type="text/javascript">
	/* Global Constants[20180818 Cao] */
	window.EMPTY = "";
	window.STRING_TRUE = "true";
	window.STRING_NULL = "null";
	window.STRING_FALSE = "false";
	window.STRING_SUCCESS = "success";
	window.STRING_FAULT = "fault";
	window.currentPageId = "";
	window.SYSTIME = "";
	window.LOGIN_TIME = new Date('<%=session.getAttribute("loginTime")%>');
	window.LOGOUT_TIME = "";
	window.DATE_FROMAT_YYYYMMDDHHMMSS = "yyyy/MM/dd hh:mm:ss";
	
	/**
	 * Login After Join default join to Page[20180818 Cao]
	 */
	 $(function(){
		 $('.underNavBar').load('<%=request.getContextPath()%>/index/init');
		 window.currentPageId = 'index';
		 $("[data-toggle='tooltip']").tooltip();
		 setSearchDisabled();
		 $("#search").attr("disabled", "true");
	});
	
	function setSearchDisabled() {
		
	}
	
	/**
	 * pageId : current page Id
	 * actionId : current action Id 
	 * [20180818 Cao]
	 */
	function transitionHtml(pageId, actionId) {
		if (actionId) {
			$('.underNavBar').load('<%=request.getContextPath()%>/'+ pageId + '/' + actionId);
		} else {
			console.log(pageId);
			window.currentPageId = pageId;
			$('.underNavBar').load('<%=request.getContextPath()%>/'+ pageId + '/init');
		}
	}
	
	/**
	 * get time of System 
	 * param : docId (current document elements)
	 * param : format (date format)
	 */
	 function getSysTime(docId, format) {
		window.SYSTIME = new Date();
		var date = window.SYSTIME;
		var y = date.getFullYear();     //获取年份  
		var m =date.getMonth()+1;   //获取月份  返回0-11  
		if (m < 10) {
			m = "0" + m;
		}
		var d = date.getDate(); // 获取日  
		if (d < 10) {
			d = "0" + d;
		}
		var w = date.getDay();   //获取星期几  返回0-6   (0=星期天) 
		var ww = ' 星期'+'日一二三四五六'.charAt(new Date().getDay()) ;//星期几
		var h = date.getHours();  //时
		if (h < 10) {
			h = "0" + h;
		}
		var minute = date.getMinutes()  //分
		if (minute < 10) {
			minute = "0" + minute;
		}
		var s = date.getSeconds(); //秒
		if (s < 10) {
			s = "0" + s;
		}
		var sss = date.getMilliseconds() ; //毫秒
		if (docId && !format) {
			$(docId).html(y + "年" + m + "月" + d + "日" + ww + h + "：" + minute + ":" + s + ":" + sss);
		} else if (docId && format){
			if (format == (window.DATE_FROMAT_YYYYMMDDHHMMSS) ) {
				$(docId).html(y + "/" + m + "/" + d + ww + h + ":" + minute + ":" + s + ":" + sss);
			} else {
				
			}
		}
	}
</script>
<style type="text/css">
	.btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover,
		.btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover,
		.open>.dropdown-toggle.btn-primary.focus, .open>.dropdown-toggle.btn-primary:focus,
		.open>.dropdown-toggle.btn-primary:hover {
		color: #000;
		background-color: #d2d2d2;
		border-color: #204d74;
	}
	
	.btn-primary.active, .btn-primary:active, .open>.dropdown-toggle.btn-primary
		{
		color: #fff;
		background-color: #ff192e;
		border-color: #204d74;
	}
	
	.content {
		width: 90%;
		height: 90%;
		overflow: auto;
		margin: 5px;
		border: none;
	}
	
	.scrollbar {
		width: 90%;
		height: 550px;
		margin: 0 auto;
	}
	
	.content-1::-webkit-scrollbar { /*滚动条整体样式*/
		width: 10px; /*高宽分别对应横竖滚动条的尺寸*/
		height: 5px;
	}
	
	.content-1::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
		border-radius: 10px;
		-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
		background: #535353;
	}
	
	.content-1::-webkit-scrollbar-track { /*滚动条里面轨道*/
		-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
		border-radius: 10px;
		background: #EDEDED;
	}
	.nav>li>a:focus, .nav>li>a:hover {
		text-decoration: none;
		background-color: #05c5f1d4;
	}
</style>
</head>
<body>
<!-- Page Content Area[Start] -->
	<!-- Page Header Area[Start] -->
	<div>
		<!-- import common Menu[Start] -->
		<div class="col-lg-1" style="background: #fd9e10bf;">
			<c:import url="../template/menu.jsp" />
		</div>
		<!-- import common Menu[End] -->
		<div class="col-lg-11" style="background: #fd9e10bf;">
			<!-- Navigation Bar Area [Start] -->
			<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#link-under-html">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="link-under-html">
					<ul class="nav nav-justified">
						<li class="active"><a onclick="transitionHtml(null,'search')" href="javascript:void(0)" id="search">
							<label for="name" style="color: #e4ff00">Search</label>
							<label style="color: #09f7d6b3">(检索)</label>
						</a></li>
						<li><a onclick="transitionHtml(null,'update')" href="#" id="update">
							<label for="name" style="color: #e4ff00">Update</label>
							<label style="color: #bc09f7b0">(更新)</label>
						</a></li>
						<li><a onclick="transitionHtml(null,'registered')" href="#">
							<label for="name" style="color: #e4ff00">Registered</label>
							<label style="color: #ff9900b3">(注册)</label>
						</a></li>
					</ul>
				</div>
			</div>
			</nav>
			<!-- Navigation Bar Area [End] -->
		</div>
	</div>
	<!-- Page Header Area[End] -->
	
	<!-- Content Area[Start] -->
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
	<div class="col-lg-11">
		<!-- Show Select to Html [Start] -->
		<div class="underNavBar content content-1 scrollbar"></div>
		<!-- Show Select to Html [End] -->

		<!-- Bottom Button Area[Start] -->
		<div class="content-bottom-area">
			<div style="padding-right: 10px; padding-bottom: 5px;">
				<button id="backBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top"
					title="点击返回" >Back</button>
			</div>
		</div>
	<!-- Bottom Button Area[End] -->
	</div>
	<!-- Content Area[End] -->
	<!-- Page Content Area[End] -->
</body>
</html>