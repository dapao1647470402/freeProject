<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- Myself define Css[Start] --%>
<style type="text/css">
	
</style>
<%-- Myself define Css[End] --%>

<%-- Myself define Js [Start] --%>
<script type="text/javascript">
</script>
<%-- Myself define Js [End] --%>

<%-- Template Url [Start] --%>
<div class="dropdown dropdown-info">
	<button type="button" class="btn btn-info" data-toggle="dropdown"
			data-placement="right" title="请点击了解更多功能" data-animation="true">
		帮助及退出登录<span class="caret"></span>
	</button>
	<ul id="dropdown-selected" class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="background: #1d2744;">
		<li><a data-target="#" href="#" onclick="transitionHtml('sys0302','init')">网站建设意见收集</a></li>
		<li class="divider"></li>
		<li><a data-target="#" href="<%=request.getContextPath()%>/register/init" onclick="">添加用户</a></li>
		<li class="divider"></li>
		<li><a data-target="#" href="<%=request.getContextPath()%>/login/logout">
			<label>退出</label>
			<label style="color: #afaf8c;">(logout)</label>
		</a></li>
	</ul>
</div>
<%-- Template Url [End] --%>