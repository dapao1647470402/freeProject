<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome to Free Project!</title>
</head>

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

<!-- Myself Define Js Section [Start]-->
<script type="text/javascript">
	var userId = "${userId}";
	var loginStatus = "${loginStatus}";
	if ((userId == null
			|| userId == ""
				|| userId == "null")
				&& loginStatus != "init") {
		window.location.href = "<%=request.getContextPath()%>/login/init"
	} else if (userId != null && userId != "") {
		window.location.href = "<%=request.getContextPath()%>/main/init"
	}

	// pictureShowArea paly configure
	$(function(){
		$('#pictureShowArea').carousel({
		    interval: 2000
		})
	});

	function inputBlur(Obj) {
		// Get input account
		var accountVal = $("#account").val();
		if (accountVal == "") {
			return;
		}
		var accountDivEle = $(document.getElementById("div_account"));
		// Get input password
		var psdVal = $("#psd").val();
		if (psdVal == "") {
			return;
		}
		var psdDivEle = $(document.getElementById("div_psd"));
		// define express
		var express = /^[A-Z a-z 0-9]{0,20}$/;
		if (accountVal == "" || psdVal == "") {
			return;
		}
		if (Obj == 1) {
			var rslt = express.test(accountVal);
			// TODO
			//rslt = accountVal == null || accountVal == '' ? false : true;
			// change input account box background [Start]
			changeIptBoxColor(rslt, accountDivEle);
			// change input account box background [End]
			var account_result = rslt ? accountVal : '';
			// display to input of content of account  box at the sreen
			$("#account").val(account_result);
		} else {
			var rslt = express.test(psdVal);
			// TODO
			//rslt = psdVal == null || psdVal == '' ? false : true;
			// change input password box background [Start]
			changeIptBoxColor(rslt, psdDivEle);
			// change input password box background [End]
			var psd_result = rslt ? psdVal : '';
			// display to input of content of password  box at the sreen
			$("#psd").val(psd_result);
		}
	}

	/**
	 * Change Input Box Background
	 * Param Flag (Result Mark)
	 * Param DivElement (Current Input Box Element)
	 */
	function changeIptBoxColor(Flag, DivElement) {
		if (Flag) {
			DivElement.removeClass(" has-error");
			DivElement.addClass(" has-success");
		} else {
			DivElement.removeClass(" has-success");
			DivElement.addClass(" has-error");
		}
	}
</script>
<!-- Myself Define Js Section [End]-->

<body>
	<div>
		<!-- About screen size use:col-xs(Phone use) col-sm(ipaid use) col-md(>=970px device) col-lg(>=1170px device)-->
		<!-- Company Show Of Content [Start]-->
		<div class="col-lg-3 col-md-3 col-sm-3" style="padding-top: 20px">
			<div class="panel panel-group panel-primary ">
				<!-- Advice Bar [Start] -->
				<div class="panel-heading">Advice</div>
				<ul class="list-group">
				<c:forEach items="${initContent.adviceResult}" var="advice" varStatus="advIndex">
					<li class="list-group-item"><a href="${advice.adviceUrl}">${advice.adviceContent}</a></li>
				</c:forEach>
					
				</ul>
				<!-- Advice Bar [End] -->
			</div>
			<div class="panel panel-group panel-info">
				<!-- Company Resume Bar [Start] -->
				<div class="panel-heading">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne">Free Project(Resume)</a>
				</div>
				<div id="collapseOne" class="panel-body panel-collapse collapse">
					${initContent.pjResume.get(0).resumeContent}</div>
				<!-- Company Resume Bar [End] -->
			</div>

		</div>
		<!-- Company Show Of Content [End]-->
		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
		<!-- Image Area [Start] -->
		<div class="col-lg-4 col-md-4 col-sm-4" style="padding-top: 20px;border-color:black;border-weight:">
			<div class="panel panel-primary">The Picture Show Area</div>
			<div id="pictureShowArea" class="carousel slide" style="border-color: #575f5b;border-style: outset;border-style: solid dotted;border-width: thick;dashed double;">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
				<c:forEach items="${initContent.imageResult}" varStatus="imageIndex">
					<c:choose>
						<c:when test="${imageIndex.index == 1}">
							<li data-target="#pictureShowArea" data-slide-to="${imageIndex.index}" class="active"></li>
						</c:when>
						<c:otherwise>
							<li data-target="#pictureShowArea" data-slide-to="${imageIndex.index}"></li>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<c:forEach items="${initContent.imageResult}" var="image" varStatus="imageIndex">
						<c:choose>
							<c:when test="${imageIndex.index == 0}">
								<div class="item active">
									<img alt="" src="${image.imgLocationAft}"
										height="350" class="col-lg-12 col-md-12 col-sm-12" />
									<div class="carousel-caption"></div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="item">
									<img alt="" src="${image.imgLocationAft}"
										height="350" class="col-lg-12 col-md-12 col-sm-12" />
									<div class="carousel-caption"></div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#pictureShowArea" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#pictureShowArea" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</div>
		<!-- Image Area [End] -->
		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
		<!-- HTML Right Layout [Start] -->
		<div class="col-lg-3 col-md-3 col-sm-3 ">
			<!-- Templet Area [Start] -->
			<div class="dropdown dropdown-info" style="float: right">
				<button type="button" class="btn btn-info" data-toggle="dropdown"
					value="">
					Templet Url <span class="caret"></span>
				</button>
				<ul id="dropdown-selected" class="dropdown-menu" role="menu"
					aria-labelledby="dLabel" style="background: yellow;">
					<li><a data-target="#" href="./login_model.html">Login</a></li>
					<li class="divider"></li>
					<li><a data-target="#" href="./search_model.html">Search</a></li>
					<li class="divider"></li>
					<li><a data-target="#" href="./registered_model.html">Registered</a></li>
				</ul>
			</div>
			<!-- Templet Area [End] -->
			<div style="padding-top: 100px; padding-right: 0px;">
				<!-- From [Start]-->
				<form class="bs-example bs-example-form form-group" action=""
					role="form">
					<!-- Login Mark Start-->
					<div style="padding: 0px 0px 10px 80px;">
						<h2>
							<strong>Login</strong>
						</h2>
					</div>
					<!-- Login Mark End-->
					<!-- Input Account [Start]-->
					<div class="input-group row input-group-lg from-group"
						id="div_account">
						<span class="input-group-addon" style="width: 115px;">Account</span>
						<input type="text" class="form-control" onblur="inputBlur(1)"
							id="account">
					</div>
					<!-- Input Account [End]-->
					<br />
					<!-- Input Password [Start] -->
					<div class="input-group row input-group-lg" id="div_psd">
						<span class="input-group-addon" style="width: 115px;">Password</span>
						<input type="password" class="form-control" onblur="inputBlur(2)"
							id="psd">
					</div>
					<!-- Input Password [End] -->
					<br />
					<!-- Login Button [Start] -->
					<div class="btn-group btn-group-lg row">
						<button type="submit" class="btn btn-primary" data-toggle="submit">Login</button>
						<!-- Login Button [End] -->
						<!-- Reset Button [Start] -->
						<button type="reset" class="btn btn-default" data-toggle="reset">Reset</button>
					</div>
					<!-- Reset Button [End] -->
				</form>
				<!-- From [End] -->
			</div>
		</div>
		<!-- HTML Right Layout [End] -->
	</div>
</body>
</html>