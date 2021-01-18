<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<title>意见采集展示</title>

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
	min-width: 130px;
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
.scrollbar {
	width: 98%;
	height: 720px;
}
</style>
<%-- Myself define Css[End] --%>

<%-- Myself define Js[Start] --%>
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
	setBackBtnEnabled();
	setBackUrl('<%=request.getContextPath()%>/sys0302/init');
});

function showSys30201DelDialog(dataId){
	$.ajax({
			type:"POST",
			async: true,
			url: '<%=request.getContextPath()%>/sys0302/result', 
			dataType:"json",
			data:{formData:"dataId=" + dataId},
			success: function(data){
				if (data != null) {
					Window.COMMON_DIALOGS1_HTML = 
						"<div class='well'>"
						+ "<ul class='list-group'>"
						+ "<li class='list-group-item'>建议内容: "+data.sys0302UpdOrDelDto[0].opinionText+"</li>"
						+ "</ul>"
						+ "</div>";
					Window.AJAX_JSON_DATA='flg=del&dataId='+data.sys0302UpdOrDelDto[0].dataId
					commonDialogs1confirm("删除","delete");
				}
			},
			error :function(XMLHttpRequest, textStatus, errorThrown) {
				// 状态码
                console.log("Ajax Error Code=" + XMLHttpRequest.status);
                // 状态
                console.log("Ajax Error Status=" + XMLHttpRequest.readyState);
                // 错误信息   
                console.log("Ajax Error Message=" + textStatus);
			}
			
		}
	);	
}

function executeSys30201Upd(dataId){
	Window.AJAX_JSON_DATA='flg=upd&dataId='+dataId
	transitionHtml(null,'result','commonDialogs1Ajax');
	setActionMode("更新")
}
</script>
<%-- Myself define Js[End] --%>


<div style="padding: 10px;">
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
		<div class="panel panel-primary table-responsive">
			<div class="panel-heading">意见箱</div>
			<table class="table table-bordered table-condensed table-hover" style="word-break:break-all; word-wrap:break-all;table-layout: fixed;" >
				<thead>
					<tr>
						<th class="text-right">No.</th>
						<th class ="text-center" valign="middle" width="50%">建议内容</th>
						<th class ="text-center" valign="middle" width="9%">提出时间</th>
						<th class ="text-center" valign="middle" >提出者</th>
						<th class ="text-center" valign="middle" width="9%">更新时间</th>
						<th class ="text-center" valign="middle" >更新者</th>
						<th class ="text-center" valign="middle" width="14%">修正/删除</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sys0302From }" var="sys0302Result" varStatus="sys0302ResultIndex">
					<tr>
						<td class="text-right">${ sys0302ResultIndex.index + 1 }</td>
						<td>
							<pre class="bg-info">${sys0302Result.opinionText }</pre>
						</td>
						<td class ="text-center" valign="middle"><fmt:formatDate value="${sys0302Result.insDate }" pattern="yyyy/MM/dd hh:mm:ss"/> </td>
						<td class ="text-center" valign="middle">${sys0302Result.insUserName }</td>
						<td class ="text-center" valign="middle"><fmt:formatDate value="${sys0302Result.updDate }" pattern="yyyy/MM/dd hh:mm:ss"/></td>
						<td class ="text-center" valign="middle">${sys0302Result.updUserName }</td>
						<td class ="text-center" valign="middle">
							<c:choose>
								<%-- 该条建议的所有者时，可以更新和删除 --%>
								<c:when test="${sessionScope.userId eq sys0302Result.insUserId}">
									<button type="button" class="btn btn-default" onclick="executeSys30201Upd(${sys0302Result.dataId })">修正</button>
									<button type="button" class="btn btn-primary"  onclick="showSys30201DelDialog(${sys0302Result.dataId })">删除</button>
								</c:when>
								<%-- 管理员时，可以更新和删除 --%>
								<c:when test="${sessionScope.userAuthor eq 5}">
									<button type="button" class="btn btn-default" onclick="executeSys30201Upd(${sys0302Result.dataId })">修正</button>
									<button type="button" class="btn btn-primary"  onclick="showSys30201DelDialog(${sys0302Result.dataId })">删除</button>
								</c:when>
								<c:otherwise>
									<span style="font-size:10px">他人提出的意见，您只能查看</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<c:import url="../template/dialogs_1.jsp" />
		</div>
	</div>
</div>

<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" >
	<c:import url="../template/commonAction.jsp" />
</div>