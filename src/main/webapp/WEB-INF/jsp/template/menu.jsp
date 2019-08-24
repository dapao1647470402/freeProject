<!-- Define Myself JS [Start] -->
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
				htmlContent = window.EMPTY;
				var MH = msg[i]["meun_header"];
				if (MH) {
					if (i > 0) {
						$("#menu").append("<li role='presentation' class='divider'></li>");
					}
					$("#menu").append("<li role='presentation' class='dropdown-header'>"+ MH +"</li>");
				} else {
					var MD = msg[i]["meun_detail"];
					if (MD) {
						var MDNO = msg[i]["meun_detail_no"];
						var MD_NO = 'transitionHtml("'+MDNO+'")';
						$("#menu").append("<li role='presentation'><a role='menuitem' tabindex='-1' href='#' onclick='" + MD_NO + "'>" + MD + "</a></li>");
					}
				}
			}
		}
		
	}
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
	<!-- 菜单上部图片 -->
	<div style="padding-top:1px">
		<a href="./login_model.html">
			<img alt="" src="<%=request.getContextPath() %>/image/1.jpg" width="100" height="22">
		</a>
	</div>
	<!-- 菜单按钮 -->
	<button type="button" class="btn dropdown-toggle btn-primary" id="dropdownMenu1" data-toggle="dropdown"
		style="width: 100px;margin-top:3px;">
		<span class="create">Menu</span>
	</button>
	<div style="height:10px"></div>
	<!-- 菜单 -->
	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="menu"></ul>
</div>

