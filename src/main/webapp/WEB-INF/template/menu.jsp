<!-- Define Myself JS [Start] -->
<script type="text/javascript">
</script>
<!-- Define Myself JS [End] -->
<!-- Define Style Css [Start]-->
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
<!-- Define Style Css [End]-->
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="dropdown " style="width: 100%;">
	<div style="padding-top:1px">
		<img alt="" src="<%=request.getContextPath() %>/image/1.jpg" width="100" height="22">
	</div>
	<button type="button" class="btn dropdown-toggle btn-primary" id="dropdownMenu1" data-toggle="dropdown"
		style="width: 100px;margin-top:3px;">
		<span class="create">Meun</span>
	</button>
	<div style="height:10px"></div>
	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		<li role="presentation" class="dropdown-header">资讯版块</li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="transitionHtml('news-001')">灵魂鸡汤</a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="transitionHtml('news-002')">游戏</a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">头条娱乐</a></li>
		<li role="presentation" class="divider"></li>
		<li role="presentation" class="dropdown-header">下拉菜单标题</li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">分离的链接</a></li>
		
	</ul>
</div>

