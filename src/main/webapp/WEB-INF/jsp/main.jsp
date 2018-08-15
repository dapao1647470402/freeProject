<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Navigation(Free)</title>
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

	/**
	 * Login After Join default join to Page
	 */
	 $(function(){
		 $('.underNavBar').load('<%=request.getContextPath()%>/index/init');
	});

	function transitionHtml(Obj) {
		if (Obj == "login") {
			$('.underNavBar').load('./login_model.html');
		} else if (Obj == "search") {
			$('.underNavBar').load('./search_model.html');
		} else if (Obj == "registered") {
			$('.underNavBar').load('./registered_model.html');
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
		height: 1px;
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
</style>
</head>
<body class="padding:50px;50px;50px;50px;">
	<!-- import common Menu[Start] -->
	<div>
		<div class="col-lg-1" style="background: #fd9e10bf;">
			<c:import url="../template/menu.jsp" />
		</div>
		<!-- import common Menu[End] -->
		<!-- Page Content Area[Start] -->
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
						<li class="active"><a onclick="transitionHtml('login')" href="javascript:void(0)"><label for="name"
								style="color: #e4ff00">Login</label></a></li>
						<li><a onclick="transitionHtml('search')" href="#"><label for="name" style="color: #e4ff00">Join</label></a></li>
						<li><a onclick="transitionHtml('registered')" href="#"><label for="name" style="color: #e4ff00">Registered</label></a></li>
					</ul>
				</div>
			</div>
			</nav>
			<!-- Navigation Bar Area [End] -->
		</div>
	</div>
	<!-- Show Select to Html [Start] -->
		<div class="underNavBar content content-1 scrollbar"></div>
	<!-- Show Select to Html [End] -->

	<!-- Bottom Button Area[Start] -->
	<div class="content-bottom-area">
		<div style="padding-right: 10px; padding-bottom: 5px;">
			<button id="backBtn" class="btn btn-primary" type="button">Back</button>
		</div>
	</div>
	<!-- Bottom Button Area[End] -->
	<!-- Page Content Area[End] -->
</body>
</html>