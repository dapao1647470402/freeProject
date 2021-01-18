<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>意见更新</title>

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
		setUpdateEnabled("更新");
		setRegisteredDisabled();
		setBackBtnEnabled("返回");
		setBackUrl('<%=request.getContextPath()%>/sys0302/result');
		getInputSizeByMaxLength("opinionText","opinionInputText");
	});
</script>
<%-- Myself define JS [End] --%>
<div style="padding: 10px;">
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
		<form role="form" id="commonForm" method="post">
			<div class="form-group">
				<label for="name">意见收集处</label>
				<input type="hidden" name="id" value="${sys0302Result.dataId }">
				<textarea class="form-control" style="height:350px"
					name="opinionContent" maxlength="100000" id="opinionText">${sys0302Result.opinionText }</textarea>
				<span class="help-block" style="float:right">还可以输入
				<span  id="opinionInputText"></span>
				字
				</span>
			</div>
			<p class="help-block">
				如果您要进行回复，请在【-----------------------------------------------------------】下面进行内容的回复。
				<BR>
				如果您要需要修改您提出的意见，请删除【-----------------------------------------------------------】。
			</p>
		</form>
	</div>
	<%-- 意见收集[End] --%>

	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"
		style="padding-right: 20px">
		<c:import url="../template/commonAction.jsp" />
	</div>
</div>
