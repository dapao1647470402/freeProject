<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- include Js and Css and so on of BootStrap file [Start]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
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

<!-- inclued JS and Css at Local [Start] -->
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
/**
 * function : Login After Join to default Page
 * [20180818 Cao]
 */
 $(function(){
	 $('.underNavBar').load('<%=request.getContextPath()%>/index/init');
	 window.currentPageId = 'index';
	 enableTooltip();
	 setSearchDisabled();
	 setUpdateDisabled();
	 setRegisteredDisabled();
});

 /**
  * function : jump to difference page
  * pageId : current page Id
  * actionId : current action Id 
  * [20180818 Cao]
  */
 function transitionHtml(pageId, actionId) {
 	window.CURRENT_ACTION_ID = "#" + actionId;
 	if (!confirmTransitionHtml()) {
 		 return;
 	 }
 	if (actionId) {
 		var formData = $("#commonForm").serialize();
 		console.log(formData);
 		$('.underNavBar').load('<%=request.getContextPath()%>/'+ window.currentPageId + '/' + actionId,{'formData' : formData});
 		setActionMode(actionId);
 	} else {
 		window.currentPageId = pageId;
 		$('.underNavBar').load('<%=request.getContextPath()%>/'+ pageId + '/init');
 	}
 }
</script>

<link rel="styleSheet" href="../css/main.css" type="text/css">
<!-- inclued JS and Css at Local [End] -->
</head>
<body>
<!-- Page Content Area[Start] -->
	<!-- Page Header Area[Start] -->
	<div>
		<!-- import common Menu[Start] -->
		<!-- 加载网站的菜单部[Start] -->
		<div class="col-lg-1" style="background: #fd9e10bf;">
			<c:import url="template/menu.jsp" />
		</div>
		<!-- 加载网站的菜单部[End] -->
		<!-- import common Menu[End] -->
		<div class="col-lg-11" style="background: #fd9e10bf;">
			<!-- Navigation Bar Area [Start] -->
			<!-- 加载网站的导航部(local:mian.jsp / js:transitionHtml)[Start] -->
			<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#link-under-html">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="link-under-html">
					<ul class="nav nav-justified">
						<li class="active"><a onclick="transitionHtml(null,'search')" href="javascript:void(0)" id="search">
							<label for="name" style="color: #e4ff00" id="commonSearchLab">查询模式</label>
							<label style="color: #09f7d6b3">(Search)</label>
						</a></li>
						<li><a onclick="transitionHtml(null,'update')" href="#" id="update">
							<label for="name" style="color: #e4ff00" id="commonUpdLab">更新模式</label>
							<label style="color: #bc09f7b0">(Update)</label>
						</a></li>
						<li><a onclick="transitionHtml(null,'registered')" href="#" id="registered">
							<label for="name" style="color: #e4ff00" id="commonRegLab">注册模式</label>
							<label style="color: #ff9900b3">(Registered)</label>
						</a></li>
					</ul>
				</div>
			</div>
			</nav>
			<!-- 加载网站的导航部(local:mian.jsp / js:transitionHtml)[End] -->
			<!-- Navigation Bar Area [End] -->
		</div>
	</div>
	<!-- Page Header Area[End] -->
	
	<!-- Content Area[Start] -->
	<!-- 此处加载各位开发者的JSP[Start] -->
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
	<div class="col-lg-10">
		<!-- Show Select to Html [Start] -->
		<div class="underNavBar content content-1 scrollbar"></div>
		<!-- Show Select to Html [End] -->
	</div>
	<!-- 此处加载各位开发者的JSP[End] -->
	
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		<!-- Right Content Top Area[Start] -->
		<!-- 网站的动作模式介绍[Start] -->
		<div style="padding-top:1px;">
			<span class="badge">
			当前动作模式
			</span>
		</div>
		<div style="padding-top:5px;padding-left:15px" data-toggle="tooltip" data-placement="bottom" title="请点击不同按钮来体验不一样的功能吧!">
			<span class="label label-success" id="actionMode">初始化</span>
		</div>
		<!-- 网站的动作模式介绍[End] -->	
		<!-- Right Content Top Area[End] -->
		
		<!-- Bottom Button Area[Start] -->
		<!-- 网站的返回按钮[Start] -->
		<div style="padding-left: 15px; padding-bottom: 5px;position: fixed;bottom: 0px">
			<button id="backBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top"
				title="点击返回" >Back</button>
		</div>
		<!-- 网站的返回按钮[End] -->
		<!-- Bottom Button Area[End] -->
	</div>
	<!-- Content Area[End] -->
	<!-- Page Content Area[End] -->
</body>
</html>