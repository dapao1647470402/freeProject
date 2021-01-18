<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>用户详细信息</title>

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
		setRegisteredDisabled();
		setBackBtnEnabled("返回");
		setBackUrl('<%=request.getContextPath()%>/sys0501/init');
	});
</script>
<%-- Myself define JS [End] --%>

<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
	<%-- Search condition area [Start] --%>
	<div>
		<%-- Change background of panel (Area-[Panel Start]) --%>
		<div class="panel panel-primary" style="border-color: black;">
			<div class="panel-heading" style="background: #784214">用户信息</div>
			<%-- Change background of panel (Area-[Panel Body Start]) --%>
			<div class="panel-body">
				<ul class="list-group">
					<li class="list-group-item">
						<span class="label label-default">(Name)</span>
						<label for="name">用&nbsp;户&nbsp;名&nbsp;：</label>
						<span>${sys050101From.userAccount }</span>
					</li>
					<li class="list-group-item">
						<span class="label label-default">(Id)</span>
						<label for="name">用&nbsp;户&nbsp;ID&nbsp;：</label> 
						<span>${sys050101From.userAccountId }</span>
					</li>
					<li class="list-group-item">
						<span class="label label-default">(⭐)</span>
						<label for="name">角&nbsp;&nbsp;色&nbsp;：</label> 
						<span>${sys050101From.roleName }</span>
					</li>
					<li class="list-group-item">
						<span class="label label-default">(⭐)</span>
						<label for="name">最大&nbsp;&nbsp;权限&nbsp;：</label> 
						<span>${sys050101From.authorityName }</span>
					</li>
					<li class="list-group-item">
						<span class="label label-default">(⭐)</span>
						<label for="name">注册&nbsp;&nbsp;时间&nbsp;：</label> 
						<span><fmt:formatDate value="${ sys050101From.userInsertDate }" pattern="yyyy/MM/dd"/></span>
					</li>
					<li class="list-group-item">
						<span class="label label-default">(■)</span>
						<label for="name">可用&nbsp;&nbsp;画面&nbsp;：</label> 
						<c:forEach items="${ sys050101From.multipleData }" var="multipleData" varStatus="multiple">
								<BR/><label for="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label for="name">${ multipleData.menuGroupName }</label>
								<label for="name"> | </label>
								<label for="name">${ multipleData.menuName }</label>
						</c:forEach>
					</li>
				</ul>


				<%-- Model of select box Version one [Start]--%>
				<%-- Search Area for Form [End] --%>
			</div>
			<%-- (Area-[Panel Body End]) --%>
		</div>
		<%-- (Area-[Panel End]) --%>
	</div>
	<%-- Search condition area [End] --%>
</div>
<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"
	style="padding-right: 20px">
	<c:import url="../template/commonAction.jsp" />
</div>
