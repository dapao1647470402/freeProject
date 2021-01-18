<%-- Define Myself JS [Start] --%>
<script type="text/javascript">
	/**
	  * 加载菜单	
	 */
	$(function() {
		$.ajax({
			url : "<%=request.getContextPath()%>/meun/init",
			type : "post",
			data : "",
			cache : false,
			// 设置 processData 选项为 false，防止自动转换数据格式。
			processData: false,
			// 同步加载数据。发送请求时锁住浏览器。需要锁定用户交互操作时使用同步方式。
			async : false,
			// 预期服务器返回的数据类型
			dataType : "json",
			success : function(msg){
				setMenuContent(msg);
			}
		});
	});
	/**
	  * 设置菜单内容	
	 */
	 function setMenuContent(msg) {
		var htmlContent = window.EMPTY;
		if (msg && msg.length > 0) {
			for (var i = 0; i < msg.length; i++) {
				var menu_group_nm = msg[i]["menu_group_nm"];
				if (menu_group_nm) {
					if (i > 0) {
						htmlContent = htmlContent + "</ul></li>";
					}
					// <li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown'> Java <b class='caret'></b></a><ul class='dropdown-menu'>
					htmlContent = htmlContent + "<li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown'>"+ menu_group_nm +"<b class='caret'></b></a><ul class='dropdown-menu'>";
				} else {
					var menu_nm = msg[i]["menu_nm"];
					if (menu_nm) {
						var menu_id = msg[i]["menu_id"];
						var MENU_EVENT = 'transitionHtml("'+menu_id+'")';
						// <li><a href="#">jmeter</a></li>
						htmlContent = htmlContent + "<li><a href='#' onclick='" + MENU_EVENT + "'>" + menu_nm + "</a></li>";
					}
				}
				if (i > (msg.length - 1)) {
					htmlContent = htmlContent + "</ul></li>";
				}
			}
			// HTML追加
			$("#menu").append(htmlContent);
		}
		
	}
</script>
<%-- Define Myself JS [End] --%>

<%-- Define Style Css [Start]--%>
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
	background-color: #000000;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	border: 1px solid #ccc;
	border: 1px solid rgba(68, 45, 45, 0.15);
	border-radius: 4px;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(243, 16, 16, 0.175);
	width: 100%
}

.dropdown-header {
	display: block;
	padding: 3px 20px;
	font-size: 16px;
	line-height: 1.42857143;
	color: #00f9ed;
	white-space: nowrap;
}

.dropdown-menu>li>a {
	display: block;
	padding: 3px 20px;
	clear: both;
	font-weight: 400;
	line-height: 1.42857143;
	color: #f19710f2;
	white-space: nowrap;
}
</style>
<%-- Define Style Css [End]--%>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="dropdown " style="width: 100%;">
	<%-- 菜单按钮 --%>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div style="padding-top:6px">
					<a  href="./login_model.html">
						<img alt="" src="<%=request.getContextPath() %>/image/menu.jpg" width="75" height="35">
					</a>
				</div>
			</div>
			<div>
				<ul class="nav navbar-nav" id="menu"></ul>
			</div>
			<div class="navbar-header" style="float:right">
				<div style="padding-top:5px">
					<span style="color:#ffffff">欢迎您：<%=session.getAttribute("accountNm")%></span>
					<br>
					<span style="color:#ffd400">登录时间：<%=session.getAttribute("loginTime_HMS")%></span>
				</div>
			</div>
		</div>
	</nav>
	<%-- 菜单 --%>
</div>

