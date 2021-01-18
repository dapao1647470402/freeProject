<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>菜单配置</title>

<%-- JSP Configure[Start] --%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		setBackBtnEnabled("返回首页");
		setBackUrl('<%=request.getContextPath()%>/index/init');
	});

</script>
<%-- Myself define JS [End] --%>
	<div style="padding: 10px;">
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<%-- Search result area [Start] --%>
			<div style="padding-top: 10px;">
				<div class="panel panel-primary table-responsive">
					<div class="panel-heading">菜单管理</div>
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">菜单组</th>
								<th>菜单（ID）</th>
								<th class="text-center">菜单组权限</th>
								<th>菜单权限</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${ menuList }" var="list" varStatus="listIndex">
							<tr class="info">
								<td rowspan="${fn:length(list.menus)}" class="text-center">${ listIndex.index + 1 }</td>
								<td rowspan="${fn:length(list.menus)}" class="text-center">
									${ list.menuGroup.menuGroupName }
								</td>
								<td>${ list.menuGroup.menuName }<span class="label label-default text-center">${ list.menuGroup.menuId }</span></td>
								<td rowspan="${fn:length(list.menus)}" class="text-center">${ list.menuGroup.menuGroupAuthority }</td>
								<td>${ list.menuGroup.menuAuthority }</td>
							</tr>
							<c:forEach items="${ list.menus }" var="menulist" varStatus="listIndex" begin="1">
								<tr class="info">
								<td>${ menulist.menuName }<span class="label label-default">${ menulist.menuId }</span></td>
								<td>${ menulist.menuAuthority }</td>
								</tr>
							</c:forEach>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<%-- Button Area [Start] --%>
				<nav style="text-align: center">
				<ul class="pagination pagination-lg" style="float: center" id="swichNums"></ul>
				</nav>
				<%-- Button Area [End] --%>
			</div>
		</div>
		<%-- Search result area [End] --%>
		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" style="padding-right:20px">
			<c:import url="../template/commonAction.jsp"/>
		</div>
	</div>
