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

<!-- Myself define JS [Start] -->
<script type="text/javascript">
	/**
	 *
	 */
	window.errorMark = false;
	window.errorStyle = "display:;padding:5px 15px 5px 15px;";
	window.EMPTY = "";

	$(function(){
		/**
		 * Common: Date component
		 */
		$(".bootstrap-date-input").datetimepicker({//选择年月日
			format: 'yyyy-mm-dd hh:mm:ss',
			language: 'zh-CN',
			weekStart: 1,
			todayBtn: 1,//显示‘今日’按钮
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,  //Number, String. 默认值：0, 'hour'，日期时间选择器所能够提供的最精确的时间选择视图。
			clearBtn:true,//清除按钮
			forceParse: 0
		});
	});
	/**
	 * Diaolog display
	 */
	function confirmInputOfInfo(obj) {
		// [1-1]
		checkInputInfo();
		if (window.errorMark) {
			return;
		} else {
			// add dialog content
			var accountNmConfirm = "<div class='well'>"
			+ "<ul class='list-group'>"
			+ "<li class='list-group-item'>Account Name: "+$("#accountName").val()+"</li>"
			+ "<li class='list-group-item'>Account Number: "+$("#accountNumber").val()+"</li>"
			+ "<li class='list-group-item'>Account Password: "+$("#accountPassword").val()+"</li>"
			+ "<li class='list-group-item'>Update Password Time: "+$("#modifyPsdTime").val()+"</li>"
			+ "</ul>"
			+ "</div>";
			$("#confirmInfoBodyId").html(accountNmConfirm);
			// display dialog
			$('#confireInfomodal').modal('show')
		}
	}
	/**
	 * check input information[1-1]
	 */
	function checkInputInfo(){
		accountNameCheck();
		accountNumberCheck();
		accountPasswordCheck();
		accountPassword2Check();
		modifyPdsTimeCheck();
	}

	function accountNameCheck() {
		// Account Name
		var accountNameJq = $("#accountName").val();
		var accountNameErrorJq = $("#errorByAccountName");
		if (accountNameJq == null
				|| accountNameJq == "") {
			accountNameErrorJq.attr("style", window.errorStyle);
			accountNameErrorJq.html("Account name is required.");
			window.errorMark = true;
		}
	}

	function accountNumberCheck() {
		// Account Number
		var accountNumberJq = $("#accountNumber").val();
		var accountNunberErrorJq = $("#errorByAccountNumber");
		if (accountNumberJq == null
				|| accountNumberJq == "") {
			accountNunberErrorJq.attr("style", window.errorStyle);
			accountNunberErrorJq.html("Account number is required.");
			window.errorMark = true;
		}
	}

	function accountPasswordCheck() {
		// Account Password
		var accountPasswordJq = $("#accountPassword").val();
		var accountPasswordErrorJq = $("#errorByAccountPassword");
		if (accountPasswordJq == null
				|| accountPasswordJq == "") {
			accountPasswordErrorJq.attr("style", window.errorStyle);
			accountPasswordErrorJq.html("Account Password is required.");
			window.errorMark = true;
		}
	}

	function accountPassword2Check() {
		// Account Password2
		var accountNumber2Jq = $("#accountPassword2").val();
		var accountNunber2ErrorJq = $("#errorByAccountPassword2");
		if (accountNumber2Jq == null
				|| accountNumber2Jq == "") {
			accountNunber2ErrorJq.attr("style", window.errorStyle);
			accountNunber2ErrorJq.html("Please agin input password.");
			window.errorMark = true;
		}
	}

	function modifyPdsTimeCheck() {
		// Modefy Password Time
		var modifyPsdTimeJq = $("#modifyPsdTime").val();
		var modifyPsdTimeErrorJq = $("#errorByModifyPsdTime");
		if (modifyPsdTimeJq == null
				|| modifyPsdTimeJq == "") {
			modifyPsdTimeErrorJq.attr("style", window.errorStyle);
			modifyPsdTimeErrorJq.attr("class", "alert alert-danger form-group col-lg-4 col-md-4 col-sm-5 col-xs-6");
			modifyPsdTimeErrorJq.html("Please input next of modify to password time.");
			window.errorMark = true;
		}
	}

	function clearAction(obj){
		// Account Name
		var accountNameJq = $("#accountName").val(window.EMPTY);
		var accountNameErrorJq = $("#errorByAccountName").attr("style", "display:none");
		// Account Number
		var accountNumberJq = $("#accountNumber").val(window.EMPTY);
		var accountNunberErrorJq = $("#errorByAccountNumber").attr("style", "display:none");
		// Account Password
		var accountPasswordJq = $("#accountPassword").val(window.EMPTY);
		var accountPasswordErrorJq = $("#errorByAccountPassword").attr("style", "display:none");
		// Account Password2
		$("#accountPassword2").val(window.EMPTY);
		$("#errorByAccountPassword2").attr("style", "display:none");
		// Modefy Password Time
		var modifyPsdTimeJq = $("#modifyPsdTime").val(window.EMPTY);
		var modifyPsdTimeErrorJq = $("#errorByModifyPsdTime").attr("style", "display:none");
	}
</script>
<!-- Myself define JS [End] -->
</head>
<body class="body">
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
	<!-- Registered Form Templet [Start] -->
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 panel panel-primary panel-body">
		<!-- Carousel component [Start]-->
		<div class="panel-heading" style="background:#784511">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000" data-wrap="ture">
				<!-- <ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol> -->
				<div class="carousel-inner">
					<div class="item active">
						<input type="button" class="form-control" value="Welcome to Free Project."/>
					</div>
					<div class="item">
						<input type="button" class="form-control" value="You can declare to all thinks at there."/>
					</div>
					<div class="item">
						<input type="button" class="form-control" value="Wish you have a happy life."/>
					</div>
					<!-- 轮播（Carousel）导航 -->
				    <a class="carousel-control left" href="#myCarousel"
				        data-slide="prev">&lsaquo;
				    </a>
				    <a class="carousel-control right" href="#myCarousel"
				        data-slide="next">&rsaquo;
				    </a>
				</div>
			</div>
		</div>
		<!-- Carousel component [End]-->
		<form action="" role="form" class="">

			<!-- Input Templet [Start] -->
			<div class="panel panel-info panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">Account Name:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="text" class="form-control" name="accountName" id="accountName" required="required" >
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountName" style="display:none"></div>
			</div>
			<!-- Input Templet [End] -->

			<!-- Input Templet [Start] -->
			<div class="panel panel-info panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">Account Number:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="text" class="form-control" name="accountNumber" id="accountNumber">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountNumber" style="display:none"></div>
			</div>
			<!-- Input Templet [End] -->

			<!-- Input Templet [Start] -->
			<div class="panel panel-danger panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">Account Password:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="text" class="form-control" name="accountPassword" id="accountPassword">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountPassword" style="display:none"></div>
			</div>
			<!-- Input Templet [End] -->

			<!-- Input Templet [Start] -->
			<div class="panel panel-warning panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;font-size: 14px;font-family:SimHei;"><label for="name">Please confirm your password:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="text" class="form-control" name="accountPassword2" id="accountPassword2">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountPassword2" style="display:none"></div>
			</div>
			<!-- Input Templet [End] -->

			<!-- Date Templet Of Div [Start] -->
			<div class=" panel panel-success panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right"><label for="name">Update Password Time:</label></div>
				<div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<div class="input-group date bootstrap-date-input form-group">
						<span class="input-group-addon trigger-date-icon"><i class="glyphicon glyphicon-calendar"></i></span>
						<input type="text" class="form-control risk-form-control-regular" id="modifyPsdTime" data-bv-notempty-message="请输入触发时间！">
					</div>
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByModifyPsdTime" style="display:none"></div>
			</div>
			<!-- Date Templet Of Div [End] -->

			<!-- Button modal Templet [Start]-->
			<div class="panel panel-info panel-body" style="text-align:center;">
				<input type="button" class="btn btn-loading" data-toggle="modal" value="Register" onclick="confirmInputOfInfo(this)">
				<input type="button" class="btn btn-default" value="Clear" onclick="clearAction(this)">
			</div>
			<!-- Button modal Templet [End]-->
			<!-- Modal Box [Start] -->
			<div class="modal fade" id="confireInfomodal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Please Confirm input to information</h4>
						</div>
						<div class="modal-body" id="confirmInfoBodyId">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">提交更改</button>
					</div>
					</div>
				</div>
			</div>
			<!-- Modal Box [End] -->
		</form>
	</div>
	<!-- Registered Form Templet [End] -->
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		<div class="dropdown dropdown-info">
			<button type="button" class="btn btn-info" data-toggle="dropdown" value="">
				More
				<span class="caret"></span>
			</button>
			<ul id="dropdown-selected" class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="background:yellow;">
				<li><a data-target="#" href="<%=request.getContextPath() %>/login/init">Login</a></li>
				<li class="divider"></li>
				<li><a data-target="#" href="<%=request.getContextPath() %>/register/init">Registered</a></li>
			</ul>
		</div>
	</div>
</body>
</html>