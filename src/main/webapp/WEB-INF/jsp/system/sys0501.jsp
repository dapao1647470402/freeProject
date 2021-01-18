<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>Scial For News</title>

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
	 * Common:Set display division page of numbers
	 * param 1:mark(define different to use of occasion)
	 * param 2:divisionPages(customer want to set division pages )
	 * param 3:totalPage(customer want to set total pages)
	 * param 4:startBtnNum(When dump to start page or end page and use next page or previous page function)
	 * param 5:overBtnNum(When dump to start page or end page and use next page or previous page function)
	 */
	function setSwitchBtnNums(mark, divisionPages, totalPage, startBtnNum,
			overBtnNum) {
		// define display for start button number
		var startNum;
		// define display for over button number
		var overNum;
		// define constant LessFlag And sumoutFlag
		var lessFlag = false;
		var sumoutFlag = false;
		// by mark change to different startNum and overNum
		if (mark == null || mark == "init" || mark == " ") {
			startNum = 1;
			overNum = parseInt(divisionPages);
		} else if (mark != null && mark == "pre_or_next") {
			startNum = parseInt(startBtnNum);
			overNum = parseInt(overBtnNum);
		} else if (mark != null && mark == "start_or_over") {
			startNum = parseInt(startBtnNum);
			overNum = parseInt(overBtnNum);
		}
		// barring startNum less then zero
		if ((parseInt(startNum) <= 0) || (parseInt(startNum) == 1)) {
			startNum = 1;
			overNum = parseInt(divisionPages);
			lessFlag = true;
		} else {
			;
		}
		// barring overNum sumout totalNum
		if (parseInt(overNum) > parseInt(totalPage)
				|| parseInt(overNum) == parseInt(totalPage)) {
			startNum = parseInt(startBtnNum - 1);
			overNum = parseInt(totalPage);
			sumoutFlag = true;
		}
		// give value to area of  division page numbers at screen 
		var switchNumsEle = document.getElementById("swichNums");
		var switchNumsHtml = "";
		switchNumsHtml = switchNumsHtml
				+ "<li onclick='switchPageStartOrOverBtn(0, "
				+ (1)
				+ ", "
				+ (divisionPages)
				+ ", "
				+ divisionPages
				+ ", "
				+ totalPage
				+ ")' class='li_switch_nums' id='startDivisionPageBtn'><a href='#'>&lt;&lt;</a></li><li onclick='switchPagePreOrNextBtn(1, "
				+ (startNum - 1)
				+ ", "
				+ (overNum - 1)
				+ ", "
				+ divisionPages
				+ ", "
				+ totalPage
				+ ")' class='li_switch_nums' id='preDivisionPageBtn'><a href='#'>&lt;</a></li>";
		var divisionPageBtnMarkNum = 1;
		for (var i = startNum; i <= overNum; i++) {
			divisionPageBtnMarkNum = divisionPageBtnMarkNum + 1;
			if (i < 10) {
				switchNumsHtml = switchNumsHtml
						+ "<li onclick='switchPageBtn("
						+ divisionPageBtnMarkNum
						+ ", "
						+ i
						+ ")' class='li_switch_nums'><a href='#' class='pageNum'>&nbsp;"
						+ i + "</a></li>"
			} else {
				switchNumsHtml = switchNumsHtml
						+ "<li onclick='switchPageBtn("
						+ divisionPageBtnMarkNum
						+ ", "
						+ i
						+ ")' class='li_switch_nums'><a href='#' class='pageNum'>&nbsp;"
						+ i + "</a></li>"
			}
		}
		switchNumsHtml = switchNumsHtml
				+ "<li onclick='switchPagePreOrNextBtn("
				+ (divisionPageBtnMarkNum + 1)
				+ ", "
				+ (startNum + 1)
				+ ", "
				+ (overNum + 1)
				+ ", "
				+ divisionPages
				+ ", "
				+ totalPage
				+ ")' class='li_switch_nums' id='nextDivisionPageBtn'><a href='#'>&gt;</a></li><li onclick='switchPageStartOrOverBtn("
				+ (divisionPageBtnMarkNum + 2)
				+ ", "
				+ (totalPage - divisionPages + 1)
				+ ", "
				+ (totalPage)
				+ ", "
				+ divisionPages
				+ ", "
				+ totalPage
				+ ")' class='li_switch_nums' id='overDivisionPageBtn'><a href='#'>&gt;&gt;</a></li>"
		switchNumsEle.innerHTML = switchNumsHtml;
		// disable use start/over button and previous/next button
		if (lessFlag) {
			$("#startDivisionPageBtn").addClass(" disabled");
			$("#preDivisionPageBtn").addClass(" disabled");
		} else if (sumoutFlag) {
			$("#nextDivisionPageBtn").addClass(" disabled");
			$("#overDivisionPageBtn").addClass(" disabled");
		} else {
			$("#startDivisionPageBtn").removeClass(" disabled");
			$("#preDivisionPageBtn").removeClass(" disabled");
			$("#overDivisionPageBtn").removeClass(" disabled");
			$("#nextDivisionPageBtn").removeClass(" disabled");
		}
	}
	/**
	 * auto-create button of division page
	 */
	$(function() {
		// enable tooltip
		enableTooltip();
		// define display switch of numbers
		var switchNums = 5;
		// define total page numbers
		var totoalPage = 20;
		setSwitchBtnNums("init", switchNums, totoalPage, null, null);

		/**
		 * Common: Date component
		 */
		loadDateComponent();
		// All button enable
		setSearchEnabled();
		setUpdateDisabled();
		setRegisteredDisabled();
		setBackBtnEnabled("返回首页");
		setBackUrl('<%=request.getContextPath()%>/index/init');
	});

	/**
	 * Change Color of Button
	 */
	function switchNumsChangeColor(Obj) {
		var switchNumsEleArr = document
				.getElementsByClassName("li_switch_nums");
		var switchNumsEle = $(switchNumsEleArr[Obj]);
		for (var i = 0; i < switchNumsEleArr.length; i++) {
			$(switchNumsEleArr[i]).removeClass(" active");
		}
		switchNumsEle.addClass(" active");
	}

	/**
	 * Previous and next page function (TODO)
	 */
	function switchPagePreOrNextBtn(positionNum, startBtnNum, overBtnNum,
			divisionPages, totalPage) {
		setSwitchBtnNums("pre_or_next", divisionPages, totalPage, startBtnNum,
				overBtnNum);
		switchNumsChangeColor(positionNum);
	}

	function switchPageStartOrOverBtn(positionNum, startBtnNum, overBtnNum,
			divisionPages, totalPage) {
		setSwitchBtnNums("start_or_over", divisionPages, totalPage,
				startBtnNum, overBtnNum);
		switchNumsChangeColor(positionNum);
	}

	function switchPageBtn(positionNum, currentPageNum) {
		switchNumsChangeColor(positionNum);
	}
	
	/**
	 * Method Rewrite
	 * [2018/08/26 Cao]
	 */
	function confirmTransitionHtml(flag) {
		console.log(window.CURRENT_ACTION_ID);
		return true;
	}
	
	function showUserDetail(userId){
		Window.AJAX_JSON_DATA='flg=showUserDetail&userId='+userId
		transitionHtml(null,'search','definedDataSubmit');
		setActionMode("用户信息查看")
	}
</script>
<%-- Myself define JS [End] --%>
	<div style="padding: 10px;">
		
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<%-- Search condition area [Start] --%>
			<div>
				<%-- Change background of panel (Area-[Panel Start]) --%>
				<div class="panel panel-primary" style="border-color: black;">
					<div class="panel-heading" style="background: #784214">检索条件</div>
					<%-- Change background of panel (Area-[Panel Body Start]) --%>
					<div class="panel-body">
						<%-- Search Area for Form [Start] --%>
						<form action="<%=request.getContextPath()%>/register/init" role="form" class="form-horizontal" id="commonForm" method="post">
							<div class="form-group">
								<div class="col-lg-3 col-md-1 col-sm-2 col-xs-4" style="padding: 5px 0px 0px 10px;">
									<label for="name">账&nbsp;户&nbsp;名&nbsp;</label>
									<span class="label label-default">(Account Name)</span>
								</div>
								<div class="col-lg-4 col-md-3 col-sm-4 col-xs-7">
									<input type="text" class="form-control" data-toggle="tooltip" title="请输入相似的账户名" data-placement="bottom" name="accountName" value="${sys0501SearchDto.accountName }">
								</div>
							</div>
						
						
							<div class="form-group">
								<%-- Date format of Search Condition Area [Start]--%>
								<div>
									<div class="col-lg-3 col-md-1 col-sm-2 col-xs-4" style="padding: 5px 0px 0px 10px;">
										<label for="name" class="font-16">注册时间</label>
										<span class="label label-default">(Register Time)</span>
									</div>
									<div class="col-lg-4 col-md-3 col-sm-4 col-xs-7">
										<input placeholder="点击输入注册时间" id=""registerTime""
											class="form-control bootstrap-date" type="text" onchange="bootstrapDateChange(this,'registerTime')"
											 value="<fmt:formatDate value="${sys0501SearchDto.registerTime }" pattern="yyyy-MM-dd HH:mm:ss"/>">
										<input name="registerTime" type="hidden" value="${sys0501SearchDto.registerTimeTimestamp }">
									</div>
									
									<%-- Date format of Search Condition Area [End]--%>
								</div>
							</div>

							<%-- Model of select box Version one [Start]--%>

							<div class="form-group">
								<div class="col-lg-3 col-md-1 col-sm-2 col-xs-4 ">
									<label class="font-16" for="name">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色
									<span class="label label-default">(Role)</span>
									</label>
								</div>
								<div class="col-lg-4 col-md-3 col-sm-4 col-xs-8">
									<select class="form-control" name="roleId">
										<option></option>
										<c:forEach items="${roleList }" var="role">
											<c:choose>
												<c:when test="${role.roleId == sys0501SearchDto.roleId}">
													<option value="${role.roleId }" selected="selected">${role.roleName }</option>
												</c:when>
												<c:otherwise>
													<option value="${role.roleId }">${role.roleName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-3 col-md-1 col-sm-2 col-xs-4 ">
									<label for="name">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限
									<span class="label label-default">(Authority)</span>
									</label>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-5 col-xs-10">
									<select class="form-control" multiple="multiple" name="authorityId">
										<c:forEach items="${authorityList }" var="authority">
												<c:set var="author_cycle_flag" value="1"/>
												<c:forEach items="${ sys0501SearchDto.authorityId }" var="dto_authority">
													<c:choose>
														<c:when test="${authority.authorityId == dto_authority and author_cycle_flag == '1'}">
															<option value="${authority.authorityId}" selected="selected">${authority.authorityName }</option>
															<c:set var="author_cycle_flag" value="0"/>
														</c:when>
													</c:choose>
												</c:forEach>
												<c:if test="${ author_cycle_flag == '1' }">
													<option value="${authority.authorityId }">${authority.authorityName }</option>
												</c:if>>
										</c:forEach>
									</select>
								</div>
							</div>
							<%-- Model of select box Version one [End]--%>

							<%-- Help Text [Start] --%>
							<div class="form-group">
								<div class="col-lg-3 col-md-1 col-sm-2 col-xs-4 ">
									<label for="name">Help Document:</label> 
								</div>
								<div class="col-lg-9 col-md-4 col-sm-5 col-xs-10">
									<span class="help-block">
									注册时间为小于等于输入时间。<BR/>
									角色依次为管理员=开发者>体验者<BR/>
									可以多个权限一起检索。
									</span>
								</div>
							</div>
							<%-- Help Text [End] --%>
								<%-- Add User Button [Start] --%>
								<div style="float:left;padding-right:20px">
								<input type="hidden" name="backPageId" value="sys0501">
								<input type="submit" onclick="" class="btn btn-primary" value="添加用户">
								</div>
								<%-- Add User Button [End] --%>
								<%-- Clear Button [Start] --%>
								<div style="float:right;padding-right:20px">
									<input type="button" onclick="ClearForm('commonForm')" class="btn btn-default" value="清空输入条件">
								</div>
								<%-- Clear Button [End] --%>
						</form>
						<%-- Search Area for Form [End] --%>
					</div>
					<%-- (Area-[Panel Body End]) --%>
				</div>
				<%-- (Area-[Panel End]) --%>
			</div>
			<%-- Search condition area [End] --%>
			<%-- Search result area [Start] --%>
			<div style="padding-top: 20px;">
				<div class="panel panel-primary table-responsive">
					<div class="panel-heading">用户管理</div>
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr>
								<th>No.</th>
								<th>用户名(ID)</th>
								<th>角色</th>
								<th>权限</th>
								<th>注册时间</th>
							</tr>
							<tr>
								<th colspan="2">画面组名</th>
								<th colspan="3">画面名</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${ sys0501From }" var="list" varStatus="listIndex">
							<tr class="info">
								<td>${ listIndex.index + 1 }</td>
								<td>
									<a href="javascript:void(0)" onclick="showUserDetail('${ list.userId }')">${ list.userAccount }</a>
									<span class="label label-default">${ list.userAccountId }</span>
								</td>
								<td>${ list.roleName }</td>
								<td>${ list.authorityName }</td>
								<td>
								<fmt:formatDate value="${ list.userInsertDate }" timeStyle="yyyy/MM/dd"/>
								</td>
							</tr>
							<c:forEach items="${ list.multipleData }" var="multipleData" varStatus="multiple">
								<tr class="warning">
									<td colspan="2"  align="center">${ multipleData.menuGroupName }</td>
									<td colspan="3">${ multipleData.menuName }</td>
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
