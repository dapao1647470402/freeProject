<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%-- include Js and Css and so on of BootStrap file [Start]--%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap-theme.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-js/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
<%-- include Js and Css and so on of BootStrap file [End]--%>

<%-- JSP Configure[Start] --%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- JSP Configure[End] --%>

<%-- inclued JS and Css at Internet [Start] --%>
<%-- <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
<%-- inclued JS and Css at Internet [End] --%>

<%-- inclued JS and Css at Local [Start] --%>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">

</script>

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
	 setBackBtnDisabled();
	 transitionHtml('${backPageId}');
});

 /**
  * function : jump to difference page
  * pageId : current page Id
  * actionId : current action Id 
  * [20180818 Cao]
  */
 function transitionHtml(pageId, actionId,model) {
 	window.CURRENT_ACTION_ID = "#" + actionId;
	// 表单中含有必须入力但是未填写输入框
	if (checkSubmitRequired() == 1) {
		return;
	}
 	if (!confirmTransitionHtml()) {
 		 return;
 	 }
 	// 数据分歧
 	var formData;
	if (model== 'commonDialogs1Ajax' || model== 'definedDataSubmit') {
		formData = Window.AJAX_JSON_DATA;
		$(".modal-backdrop").remove();
	}else if($("#commonForm") != null){
		formData = $("#commonForm").serialize();
	}
 	if (actionId && !pageId) {
 		$('.underNavBar').load('<%=request.getContextPath()%>/'+ window.currentPageId + '/' + actionId,{'formData' : formData});
 		setActionMode(actionId);
 	} else if (!actionId && pageId) {
 		window.currentPageId = pageId;
 		$('.underNavBar').load('<%=request.getContextPath()%>/'+ pageId + '/init');
 	} else {
 		window.currentPageId = pageId;
 		$('.underNavBar').load('<%=request.getContextPath()%>/'+ pageId + '/' + actionId,{'formData' : formData});
 	}
 	
 }
 
</script>

<link rel="styleSheet" href="../css/main.css" type="text/css">
<%-- inclued JS and Css at Local [End] --%>
</head>
<body>
<%-- Page Content Area[Start] --%>
	<%-- Page Header Area[Start] --%>
	<div>
		<%-- import common Menu[Start] --%>
		<%-- 加载网站的菜单部[Start] --%>
			<c:import url="template/menu.jsp" />
		<%-- 加载网站的菜单部[End] --%>
	</div>
	<%-- Page Header Area[End] --%>
	
	<%-- Content Area[Start] --%>
	<%-- 此处加载各位开发者的JSP[Start] --%>
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
	<div class="col-lg-10">
		<%-- Show Select to Html [Start] --%>
		<div class="underNavBar content content-1 scrollbar"></div>
		<%-- Show Select to Html [End] --%>
	</div>
	<%-- 此处加载各位开发者的JSP[End] --%>
	
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		<%-- Right Content Top Area[Start] --%>
		<%-- 网站的动作模式介绍[Start] --%>
		<div style="padding-top:1px;">
			<span class="badge">
			当前动作模式
			</span>
		</div>
		<div style="padding-top:5px;padding-left:15px" data-toggle="tooltip" data-placement="bottom" title="请点击不同按钮来体验不一样的功能吧!">
			<span class="label label-success" id="actionMode">初始化</span>
		</div>
		<%-- 网站的动作模式介绍[End] --%>	
		<%-- Right Content Top Area[End] --%>
		
		<%-- Bottom Button Area[Start] --%>
		<%-- 网站的按钮[Start] --%>
		<div style="padding-left: 15px; padding-bottom: 5px;position: fixed;bottom: 0px">
			<button id="search" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top"
				title="点我开始检索" onclick="transitionHtml(null,'search')">点我检索</button>
			<button id="update" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top"
				title="点我更新数据" onclick="transitionHtml(null,'update')">点我更新 </button>
			<button id="registered" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top"
				title="点击登录数据" onclick="transitionHtml(null,'registered')">数据登录</button>
			<button id="commonBackBtn" class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top"
				title="点击返回" onclick="commonGoBack()">返回</button>
		</div>
		<%-- 网站的按钮[End] --%>
		<%-- Bottom Button Area[End] --%>
	</div>
	<%-- Content Area[End] --%>
	<%-- Page Content Area[End] --%>
</body>
</html>