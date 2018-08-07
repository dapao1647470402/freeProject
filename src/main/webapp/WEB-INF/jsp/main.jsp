<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Templet</title>
<!-- include Js and Css and so on of BootStrap file [Start]-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap-js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/style.css">
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
.btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover, .open>.dropdown-toggle.btn-primary.focus, .open>.dropdown-toggle.btn-primary:focus, .open>.dropdown-toggle.btn-primary:hover {
    color: #000;
    background-color: #d2d2d2;
    border-color: #204d74;
}
.btn-primary.active, .btn-primary:active, .open>.dropdown-toggle.btn-primary{
    color: #fff;
    background-color: #ff192e;
    border-color: #204d74;
}

</style>
</head>
<body class="padding:50px;50px;50px;50px;">
	<div class="col-lg-1" style="background:#fd9e10bf;">
		<c:import url="../template/menu.jsp"/>
	</div>
	<!-- Page Content Area[Start] -->
	<div class="col-lg-11" style="background:#fd9e10bf;">
		<!-- Navigation Bar Area [Start] -->
		<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#link-under-html">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="link-under-html">
				<ul class="nav nav-justified">
					<li class="active"><a onclick="transitionHtml('login')"
						href="javascript:void(0)"><label for="name" style="color:#e4ff00">Login</label></a></li>
					<li><a onclick="transitionHtml('search')" href="#"><label
							for="name" style="color:#e4ff00">Search</label></a></li>
					<li><a onclick="transitionHtml('registered')" href="#"><label
							for="name" style="color:#e4ff00">Registered</label></a></li>
				</ul>
			</div>
		</div>
		</nav>
		<!-- Navigation Bar Area [End] -->

		<!-- Show Select to Html [Start] -->
		<div class="underNavBar"></div>
		<!-- Show Select to Html [End] -->
	</div>
	<!-- Page Content Area[End] -->
	<!-- Bottom Button Area[Start] -->
	<div class="content-bottom-area" >
		<div style="padding-right:10px;padding-bottom:5px;">
			<button id="backBtn" class="btn btn-primary"
			    type="button"> Back
			</button>
		</div>
	</div>
	<!-- Bottom Button Area[End] -->
</body>
</html>