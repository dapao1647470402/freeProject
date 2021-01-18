<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>意见采集</title>

<%-- JSP Configure[Start] --%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- JSP Configure[End] --%>

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
	/**
	 * auto-create button of division page
	 */
	$(function() {
		// enable tooltip
		enableTooltip();
		/**
		 * Common: Date component
		 */
		loadDateComponent();
		// All button enable
		setSearchDisabled();
		setUpdateDisabled();
		setRegisteredEnabled("提交意见");
		setBackBtnEnabled("返回首页");
		setBackUrl('<%=request.getContextPath()%>/index/init');
		getInputSizeByMaxLength("opinionText","opinionInputText");
	});
</script>
<%-- Myself define JS [End] --%>
<div style="padding: 10px;">
	<c:if test="${submitMark == 1 }">
		<div class="alert alert-success">
			您已成功完成提交。
			<a href="#" onclick="transitionHtml(null,'result')">点击查看 <span class="badge">☞</span></a>
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
		</div>
	</c:if>
	<%-- 意见收集[Start] --%>
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
		<form role="form" id="commonForm" method="post">
			<div class="form-group">
				<label for="name">意见收集处</label>
				<textarea class="form-control" style="height:350px" placeholder="请输入您需要解决的问题"
					name="opinionText" maxlength="1000" id="opinionText"></textarea>
				<p class="help-block">感谢您提出的宝贵意见，我们将会对其进行分析并修正。
				<span class="help-block" style="float:right">还可以输入
				<span  id="opinionInputText"></span>
				字
				</span>
				</p>
				
			</div>
		</form>
		
		<button type="button" class="btn btn-default" onclick="transitionHtml(null,'result')">意见箱</button>
	</div>
	<%-- 意见收集[End] --%>

	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"
		style="padding-right: 20px">
		<c:import url="../template/commonAction.jsp" />
	</div>
</div>
