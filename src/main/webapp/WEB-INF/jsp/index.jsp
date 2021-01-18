<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>首页</title>

<%-- JSP Configure[Start] --%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- JSP Configure[End] --%>

<%-- Define Myself JS [Start] --%>
<script type="text/javascript">
/** 用户登录时间取得[Start] */
var dataT = '<%=session.getAttribute("loginTime")%>';
dataT = dataT.substring(0,19);    
dataT = dataT.replace(/-/g,'/'); 
var timestamp = new Date(dataT).getTime();
window.LOGIN_TIME = new Date(timestamp);
/** 用户登录时间取得[End] */
	$(function() {
		 enableTooltip();
		 setSearchDisabled();
		 setUpdateDisabled();
		 setRegisteredDisabled();
		 setBackBtnDisabled();
		var sysTimeByIndexInterval;
		var getTimeDifferenceByIndexInterval;
		$('#showNetTime')
				.on(
						'show.bs.modal',
						function() {
							sysTimeByIndexInterval = setInterval(
									"getSysTime('#sysTime',window.DATE_FROMAT_YYYYMMDDHHMMSS)",
									1);
							getTimeDifferenceByIndexInterval = setInterval(function(){
								// second
								var secondDefference = parseInt((window.SYSTIME - window.LOGIN_TIME)/1000);
								// minute
								var minDefference = parseInt((window.SYSTIME - window.LOGIN_TIME) / 1000 / 60);
								// hour
								var hourDefference = parseInt((window.SYSTIME - window.LOGIN_TIME) / 1000 / 60 / 60);
								// progress
								var duration = parseInt((minDefference*100 / 180));
								$("#loginDurationForProgress").attr("style", "width:" + duration + "%");
								if (hourDefference == 0 && minDefference > 0) {
									$("#loginDuration").html(minDefference + "min-" + parseInt(secondDefference - (minDefference * 60)) + "s");
									$("#loginDurationFormat").html("minute-seconds");
								} else if (hourDefference > 0) {
									$("#loginDuration").html(hourDefference + "h-" + parseInt(minDefference - (hourDefference * 60)) + "min-" + parseInt(secondDefference - (minDefference * 60)) + "s");
									$("#loginDurationFormat").html("hour-minute-seconds");
								} else {
									$("#loginDuration").html(secondDefference + "s");
									$("#loginDurationFormat").html("seconds");
								}
								// if dyration is 3
								if (parseInt(hourDefference) >= 3) {
									$("#loginDurationWarn").attr("style", "display");
									$("#loginDuration").attr("style", "color:red");
								}
							}
									,1);
						});
		$("#showNetTime").on("hidden.bs.modal", function() {
			window.clearInterval(sysTimeByIndexInterval);
			window.clearInterval(getTimeDifferenceByIndexInterval);
		});
	});
</script>
<%-- Define Myself JS [End] --%>

<%-- Myself define Css[Start] --%>
<style type="text/css">
.dropdown-menu {
	top: 100%;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	min-width: 160px;
	padding: 5px 0;
	margin: 2px 0 0;
	font-size: 14px;
	text-align: left;
	list-style: none;
	background-color: #000;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	border: 1px solid #ccc;
	border: 1px solid rgba(68, 45, 45, 0.15);
	border-radius: 4px;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(243, 16, 16, 0.175);
	width: auto;
}
</style>
<%-- Myself define Css[End] --%>

<%-- Myself define JS [Start] --%>
<script type="text/javascript">
	
</script>
<%-- Myself define JS [End] --%>
<div style="padding: 10px;">

	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 container">
		<%-- index welcome information [Start] --%>
		<div class="jumbotron">
			<h3>
				欢迎登陆Free Project！ <small>这是一个放飞自由的地方。</small>
			</h3>
			<p>
				<a class="btn btn-primary btn-lg" role="button"> 更多功能敬请期待!</a>
			</p>
		</div>
		<%-- index welcome information [End] --%>
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> 社交娱乐((集"资"广"议") </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse">
					<div class="panel-body">Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente
						ea proident. Ad vegan excepteur butcher vice lomo.</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2"> 更多信息 </a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente
						ea proident. Ad vegan excepteur butcher vice lomo.</div>
				</div>
			</div>
		</div>
		<%-- Internet Web Plugs [Start]  --%>
		<div class="well">
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#showNetTime">查看上网时长</button>
			<div class="modal fade" id="showNetTime" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				aria-hidden="true" data-backdrop="static">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">
								当前时间: <small id="sysTime"></small>
							</h4>
						</div>
						<div class="modal-body well">
							<div class="alert alert-warning alert-dismissable" style="display:none" id="loginDurationWarn">
								<span class="label label-warning">警告</span>
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								上网时间过长会危害您的身体,请注意休息.
							</div>
							<h4>
								科学上网时间 <span class="label label-default">3小时</span>
							</h4>
							<h4>
								<small>登录时间:</small><span class="label label-primary"><%=session.getAttribute("loginTime")%></span>
							</h4>
							<h4>
								<small>上网时长:</small><span class="label label-info" id="loginDuration"></span><small id="loginDurationFormat"></small>
							</h4>
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0"
									id="loginDurationForProgress" aria-valuemax="180">
									<span class="sr-only">90% 完成（成功）</span>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
					<%-- /.modal-content --%>
				</div>
				<%-- /.modal --%>
			</div>
		</div>
		<%-- Internet Web Plugs [End]  --%>
	</div>
	<%-- Search result area [End] --%>
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" style="padding-left: 15px; padding-top: 5px;">
		<c:import url="template/commonAction.jsp" />
	</div>
</div>