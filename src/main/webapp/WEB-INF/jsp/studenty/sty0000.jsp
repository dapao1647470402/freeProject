<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>学习之地·知识交互</title>

<!-- JSP Configure[Start] -->
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JSP Configure[End] -->

<!-- Myself define Css[Start] -->
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
<!-- Myself define Css[End] -->

<!-- Myself define JS [Start] -->
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
		setSearchEnabled("开启检索结果界面");
		setUpdateDisabled();
		setRegisteredEnabled("点击提交");
		setBackBtnEnabled("返回首页");
		setBackUrl('<%=request.getContextPath()%>/index/init');
		getInputSizeByMaxLength("resumeText","resumeInputText");
		getInputSizeByMaxLength("title","titleInputText");
		getInputSizeByMaxLength("searchKey","searchKeyInputText");
		if($("#searchAreaShow").val() == "1") {
			setSearchDisabled();
		}
	});
</script>
<!-- Myself define JS [End] -->
<div style="padding: 10px;">
	<c:if test="${submitMark == 1 }">
		<div class="alert alert-success">
			您已成功完成提交。
			<a href="#" onclick="transitionHtml(null,'result')">点击查看 <span class="badge">☞</span></a>
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
		</div>
	</c:if>
	<!-- 意见收集[Start] -->
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
		<form role="form" id="commonForm" method="post">
			<div class="form-group">
				<label for="name">请输入标题：</label>
				<input name="title" id="title" maxlength="60" size="60" value="${sty0000From.title}"/>
				<span class="help-block" style="float:right">还可以输入
				<span  id="titleInputText"></span>
				字
				</span>
			</div>
			<div class="form-group">
				<label for="name">请输入简介：</label>
				<textarea class="form-control" rows="5" placeholder="请输入您对标题内容的简单介绍。"
					name="resume" maxlength="1000" id="resumeText" >${sty0000From.resume}</textarea>
				<span class="help-block" style="float:right">还可以输入
				<span  id="resumeInputText"></span>
				字
				</span>
			</div>
			<div class="form-group">
				<label for="name">请输入相关链接：</label>
				<input name="aboutUrl" id="title" size="60" value="${sty0000From.aboutUrl}"/>
			</div>
			<div class="form-group">
				<label for="name">请创建(选择)分类：</label>
				<input name="selfOfType" id="selfOfType" maxlength="10"  value="${sty0000From.selfOfType}"/>
				<button type="button" id="selfCreateTypeListBtn" class="btn btn-default" onclick="transitionHtml(null,'result')">自己创建的分类</button>
				<button type="button" id="elseCreateTypeListBtn" class="btn btn-default" onclick="transitionHtml(null,'result')">参照别人的分类</button>
			</div>
			<div class="form-group" id="createTypeListArea"></div>
			<p class="help-block">感谢您上传的知识分享，请点击左上角的【点击提交】按钮进行上传。</p>
			
			<input type="hidden" name="searchAreaShow" id="searchAreaShow" value="${sty0000From.searchAreaShow }">
			<input type="hidden" name="showMyselfList" id="showMyselfList" value="${sty0000From.showMyselfList }">
			<%-- Search Result Area --%>
			<c:if test="${sty0000From.searchAreaShow == 1 }">
			<button type="button" id="searchKeyBtn" class="btn btn-primary" onclick="transitionHtml(null,'close')">关闭检索结果界面</button>
			<div class="form-group">
				<label for="name">请输入检索内容：</label>
				<input name="searchKey" id="searchKey" maxlength="60" size="60" value="${sty0000From.searchKey}"/>
				<span class="help-block" style="float:right">还可以输入
				<span  id="searchKeyInputText"></span>
				字
				</span>
				<button type="button" id="searchKeyBtn" class="btn btn-primary" onclick="transitionHtml(null,'result')">检索</button>
				<c:if test="${sty0000From.showMyselfList == 1 }">
					<button type="button" id="searchKeyBtn" class="btn btn-primary" onclick="transitionHtml(null,'resultByMe')">检索(自身)</button>
				</c:if>
			</div>
			<table class="table table-bordered table-condensed table-hover" style="word-break:break-all; word-wrap:break-all;table-layout: fixed;" >
				<thead>
					<tr>
						<th class="text-right">No.</th>
						<th class="text-center" width="20%">标题</th>
						<th class="text-center" width="30%">简介</th>
						<th class="text-center" >类型</th>
						<th class="text-center" >提出者</th>
						<th class="text-center" >更新时间</th>
						<th class="text-center" >更新者</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sty0000Result }" var="sty0000Result" varStatus="sty0000ResultIndex">
					<tr>
						<td class="text-right">${ sty0000ResultIndex.index + 1 }</td>
						<td class="text-center"><a href="${sty0000Result.aboutUrl }">${sty0000Result.title }</a> </td>
						<td class="text-center">${sty0000Result.resume }</td>
						<td class="text-center">${sty0000Result.selfOfType }</td>
						<td class="text-center">${sty0000Result.insUserId }</td>
						<td class="text-center">${sty0000Result.updDate }</td>
						<td class="text-center">${sty0000Result.updUserId }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</c:if>
		</form>
		
		
	</div>
	<!-- 意见收集[End] -->

	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"
		style="padding-right: 20px">
		<c:import url="../template/commonAction.jsp" />
	</div>
</div>
