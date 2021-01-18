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
<%-- inclued JS and Css at Local [Start] --%>
<script type="text/javascript" src="../js/main.js"></script>
<%-- include Js and Css and so on of BootStrap file [Start]--%>
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
<%-- include Js and Css and so on of BootStrap file [End]--%>

<%-- Myself define JS [Start] --%>
<script type="text/javascript">
	/**
	 *
	 */
	window.errorMark = false;
	window.errorStyle = "display:;padding:5px 15px 5px 15px;";
	window.successStyle = "display:none";
	window.EMPTY = "";

	$(function(){
		
		/**
		 * Common: Date component
		 * 时间控件
		 */
		$(".bootstrap-date-input").datetimepicker({//选择年月日
			format: 'yyyy/mm/dd',
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
		document.getElementById("accountName").focus();

		$("#accountName").bind("blur", function() {
			accountNameCheck();
		});
		$("#accountNumber").bind("blur", function() {
			accountNumberCheck();
		});
		$("#accountPassword").bind("blur", function() {
			accountPasswordCheck();
		});
		$("#accountPassword2").bind("blur", function() {
			accountPassword2Check();
		});
		var timeJq = $("#birthday");
		$("#birthday").bind("keyup", function() {
			var timeBackUp = timeJq.val().replace(/[^0-9]/g, window.EMPTY).trim();
			timeJq.val(timeBackUp);
			$("#errorByBirthday").attr("style", window.successStyle);
		});
		$("#birthday").bind("focus", function() {
			var timeBackUp = timeJq.val().replace(/[^0-9]/g, window.EMPTY).trim();
			timeJq.val(timeBackUp);
			$("#errorByBirthday").attr("style", window.successStyle);
		});
		$("#birthday").bind("blur", function() {
			var year = window.EMPTY;
			if (timeJq.val() == window.EMPTY) {
				return;
			}
			if (timeJq.val().length != 14 ) {
				$("#errorByBirthday").attr("style", window.errorStyle);
				$("#errorByBirthday").html("请检查您输入的日期。");
				$("#errorByBirthday").attr("class", "alert alert-danger form-group col-lg-4 col-md-4 col-sm-5 col-xs-6");
				timeJq.val(window.EMPTY);
				window.errorMark = true;
			} else {
				window.errorMark = false;
				$("#errorByBirthday").attr("style", window.successStyle);
				var timeBackUp = timeJq.val().substring(0, 4) + "-" + timeJq.val().substring(4, 6) + "-" + timeJq.val().substring(6, 8);
				timeJq.val(timeBackUp);
			}
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
			+ "<li class='list-group-item'>用户名: "+$("#accountName").val()+"</li>"
			+ "<li class='list-group-item'>用户ID: "+$("#accountNumber").val()+"</li>"
			+ "<li class='list-group-item'>密码: "+$("#accountPassword").val()+"</li>"
			+ "<li class='list-group-item'>生日: "+$("#birthday").val()+"</li>"
			+ "</ul>"
			+ "</div>";
			$("#confirmInfoBodyId").html(accountNmConfirm);
			// display dialog
			$('#confirmInfomodal').modal('show')
		}
	}
	/**
	 * check input information[1-1]
	 */
	function checkInputInfo(){
		window.errorMark = false;
		accountNameCheck();
		if(window.errorMark){
			return false;
		};
		accountNumberCheck();
		if(window.errorMark){
			return false;
		};
		accountPasswordCheck();
		if(window.errorMark){
			return false;
		};
		accountPassword2Check();
		if(window.errorMark){
			return false;
		};
		modifyPdsTimeCheck();
		if(window.errorMark){
			return false;
		};
	}

	function accountNameCheck() {
		// Account Name
		var accountNameJq = $("#accountName").val();
		var accountNameErrorJq = $("#errorByAccountName");
		if (accountNameJq == null
				|| accountNameJq == window.EMPTY) {
			accountNameErrorJq.attr("style", window.errorStyle);
			accountNameErrorJq.html("请创建一个炫酷的用户名吧。");
			window.errorMark = true;
		/* } else if (!/^[A-Za-z0-9]{1,20}$/.test(accountNameJq)) {
			accountNameErrorJq.attr("style", window.errorStyle);
			accountNameErrorJq.html("Account name format is [A-Z a-z 0-9].");
			window.errorMark = true; */
		} else {
			window.errorMark = false;
			accountNameErrorJq.attr("style", window.successStyle);
		}
	}

	function accountNumberCheck() {
		// Account Number
		var accountNumberJq = $("#accountNumber").val();
		var accountNunberErrorJq = $("#errorByAccountNumber");
		if (accountNumberJq == null
				|| accountNumberJq == window.EMPTY) {
			accountNunberErrorJq.attr("style", window.errorStyle);
			accountNunberErrorJq.html("请添加一个唯一的用户ID吧。");
			window.errorMark = true;
		} else if (/[^A-Za-z0-9\.\@]{1,15}$/.test(accountNumberJq)) {
			accountNunberErrorJq.attr("style", window.errorStyle);
			accountNunberErrorJq.html("用户ID格式(字母无大小写区分):数字/数字+字母/字母");
			window.errorMark = true;
		} else {
			window.errorMark = false;
			accountNunberErrorJq.attr("style", window.successStyle);
		}
	}

	function accountPasswordCheck() {
		// Account Password
		var accountPasswordJq = $("#accountPassword").val();
		var accountPasswordErrorJq = $("#errorByAccountPassword");
		if (accountPasswordJq == null
				|| accountPasswordJq == window.EMPTY) {
			accountPasswordErrorJq.attr("style", window.errorStyle);
			accountPasswordErrorJq.html("为了保证账号安全,请输入密码。");
			window.errorMark = true;
		} else if (/[^A-Za-z0-9\.\@]{1,20}$/.test(accountPasswordJq)) {
			accountPasswordErrorJq.attr("style", window.errorStyle);
			accountPasswordErrorJq.html("Account name format is ./A-Z/a-z/1-9/ .");
			window.errorMark = true;
		} else {
			window.errorMark = false;
			accountPasswordErrorJq.attr("style", window.successStyle);
		}
	}

	function accountPassword2Check() {
		// Account Password2
		var accountPassword2Jq = $("#accountPassword2").val();
		var accountPassword2ErrorJq = $("#errorByAccountPassword2");
		if (accountPassword2Jq == null
				|| accountPassword2Jq == window.EMPTY) {
			accountPassword2ErrorJq.attr("style", window.errorStyle);
			accountPassword2ErrorJq.html("请再次输入密码。");
			window.errorMark = true;
		} else if (/[^A-Za-z0-9\.\@]{1,20}$/.test(accountPassword2Jq)) {
			accountPassword2ErrorJq.attr("style", window.errorStyle);
			accountPassword2ErrorJq.html("Account name format is ./A-Z/a-z/1-9/ .");
			window.errorMark = true;
		} else if ($("#accountPassword").val() != accountPassword2Jq) {
			accountPassword2ErrorJq.attr("style", window.errorStyle);
			accountPassword2ErrorJq.attr("class", "alert alert-danger form-group col-lg-4 col-md-4 col-sm-5 col-xs-6");
			accountPassword2ErrorJq.html("两次输入密码不一致。");
			window.errorMark = true;
		} else {
			window.errorMark = false;
			accountPassword2ErrorJq.attr("style", window.successStyle);
		}
	}

	function modifyPdsTimeCheck() {
		// Modefy Password Time
		var birthdayJq = $("#birthday").val();
		var birthdayErrorJq = $("#errorByBirthday");
		if (birthdayJq == null
				|| birthdayJq == window.EMPTY) {
			birthdayErrorJq.attr("style", window.errorStyle);
			birthdayErrorJq.attr("class", "alert alert-danger form-group col-lg-4 col-md-4 col-sm-5 col-xs-6");
			birthdayErrorJq.html("请输入下次更改密码的时间。");
			window.errorMark = true;
		} else {
			window.errorMark = false;
			birthdayErrorJq.attr("style", window.successStyle);
		}
	}

	/**
	 * Clear Button Action
	 */
	function clearAction(obj){
		// Account Name
		var accountNameJq = $("#accountName").val(window.EMPTY);
		var accountNameErrorJq = $("#errorByAccountName").attr("style", window.successStyle);
		// Account Number
		var accountNumberJq = $("#accountNumber").val(window.EMPTY);
		var accountNunberErrorJq = $("#errorByAccountNumber").attr("style", window.successStyle);
		// Account Password
		var accountPasswordJq = $("#accountPassword").val(window.EMPTY);
		var accountPasswordErrorJq = $("#errorByAccountPassword").attr("style", window.successStyle);
		// Account Password2
		$("#accountPassword2").val(window.EMPTY);
		$("#errorByAccountPassword2").attr("style", window.successStyle);
		// Modefy Password Time
		var birthdayJq = $("#birthday").val(window.EMPTY);
		var birthdayErrorJq = $("#errorByBirthday").attr("style", window.successStyle);
	}
	
	
	function goBack(obj) {
		window.location.href = "<%=request.getContextPath()%>"+"/main/init?backPageId=" + obj;
	}
</script>
<%-- Myself define JS [End] --%>
</head>
<body class="body">
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
	<%-- Registered Form Templet [Start] --%>
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 panel panel-primary panel-body">
		<%-- Carousel component [Start]--%>
		<div class="panel-heading" style="background:#784511">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000" data-wrap="ture">
				<%-- <ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol> --%>
				<div class="carousel-inner">
					<div class="item active">
						<input type="button" class="form-control" value="欢迎您注册本网站。"/>
					</div>
					<div class="item">
						<input type="button" class="form-control" value="本网站属于自由开发项目。"/>
					</div>
					<div class="item">
						<input type="button" class="form-control" value="期待您的开发及使用。"/>
					</div>
					<%-- 轮播（Carousel）导航 --%>
				    <a class="carousel-control left" href="#myCarousel"
				        data-slide="prev">&lsaquo;
				    </a>
				    <a class="carousel-control right" href="#myCarousel"
				        data-slide="next">&rsaquo;
				    </a>
				</div>
			</div>
		</div>
		<%-- Carousel component [End]--%>
		<form action="<%=request.getContextPath()%>/register/doRegister" role="form" class="" method="post">

			<%-- Input Templet [Start] --%>
			<div class="panel panel-info panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">用户名:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="text" class="form-control" name="accountName" id="accountName" required="required" maxlength="50">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountName" style="display:none"></div>
			</div>
			<%-- Input Templet [End] --%>

			<%-- Input Templet [Start] --%>
			<div class="panel panel-info panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">用户ID:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="text" class="form-control" name="accountId" id="accountNumber" maxlength="20">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountNumber" style="display:none"></div>
			</div>
			<%-- Input Templet [End] --%>

			<%-- Input Templet [Start] --%>
			<div class="panel panel-danger panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">密码:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="password" class="form-control" name="password" id="accountPassword" maxlength="20">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountPassword" style="display:none"></div>
			</div>
			<%-- Input Templet [End] --%>

			<%-- Input Templet [Start] --%>
			<div class="panel panel-warning panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right;margin-top:10px;"><label for="name">请再次输入密码:</label></div>
				<div class="form-group col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<input type="password" class="form-control" name="accountPassword2" id="accountPassword2" maxlength="20">
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByAccountPassword2" style="display:none"></div>
			</div>
			<%-- Input Templet [End] --%>

			<%-- Date Templet Of Div [Start] --%>
			<div class=" panel panel-success panel-body">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4" style="text-align:right"><label for="name">生日:</label></div>
				<div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
					<div class="input-group date bootstrap-date-input form-group">
						<span class="input-group-addon trigger-date-icon"><i class="glyphicon glyphicon-calendar"></i></span>
						<input type="text" class="form-control risk-form-control-regular" name="birthday" id="birthday" data-bv-notempty-message="请输入您的生日！">
					</div>
				</div>
				<div class="alert alert-danger form-group col-lg-3 col-md-4 col-sm-5 col-xs-6"  id="errorByBirthday" style="display:none"></div>
			</div>
			<%-- Date Templet Of Div [End] --%>

			<%-- Button modal Templet [Start]--%>
			<div class="panel panel-info panel-body" style="text-align:center;">
				<input type="button" class="btn btn-loading" data-toggle="modal" value="注册" onclick="confirmInputOfInfo(this)">
				<input type="button" class="btn btn-default" value="重置" onclick="clearAction(this)">
				<c:if test="${backPageId != null and backPageId != '' }">
					<input type="button" class="btn btn-primary" value="Back" onclick="goBack('${backPageId }')">
					<input type="hidden" value="${backPageId }" name="backPageId"/>
				</c:if>
			</div>
			<%-- Button modal Templet [End]--%>
			<%-- Modal Box [Start] --%>
			<div class="modal fade" id="confirmInfomodal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">请确认您的注册信息:</h4>
						</div>
						<div class="modal-body" id="confirmInfoBodyId">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">确认注册</button>
					</div>
					</div>
				</div>
			</div>
			<%-- Modal Box [End] --%>
		</form>
	</div>
	<%-- Registered Form Templet [End] --%>
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		<div class="dropdown dropdown-info">
			<button type="button" class="btn btn-info" data-toggle="dropdown" value="">
				更多
				<span class="caret"></span>
			</button>
			<ul id="dropdown-selected" class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="background:yellow;">
				<li><a data-target="#" href="<%=request.getContextPath() %>/login/init">登录</a></li>
			</ul>
		</div>
	</div>
</body>
</html>