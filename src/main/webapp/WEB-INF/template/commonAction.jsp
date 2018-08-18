<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- Myself define Css[Start] -->
<style type="text/css">
	
</style>
<!-- Myself define Css[End] -->

<!-- Template Url [Start] -->
<div class="dropdown dropdown-info">
	<button type="button" class="btn btn-info" data-toggle="dropdown" value="">
		Action <span class="caret"></span>
	</button>
	<ul id="dropdown-selected" class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="background: #1d2744;">
		<li><a data-target="#" href="./login_model.html">网站建设意见收集</a></li>
		<li class="divider"></li>
		<li><a data-target="#" href="<%=request.getContextPath()%>/login/logout">
			<label>退出</label>
			<label style="color: #afaf8c;">(logout)</label>
		</a></li>
	</ul>
</div>
<!-- Template Url [End] -->