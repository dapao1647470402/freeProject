<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<title>Scial For News</title>

<!-- JSP Configure[Start] -->
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		// define display switch of numbers
		var switchNums = 5;
		// define total page numbers
		var totoalPage = 20;
		setSwitchBtnNums("init", switchNums, totoalPage, null, null);

		/**
		 * Common: Date component
		 */
		$(".bootstrap-date").datetimepicker({//选择年月日
			format : 'yyyy-mm-dd hh:mm:ss',
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,//显示‘今日’按钮
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2, //Number, String. 默认值：0, 'hour'，日期时间选择器所能够提供的最精确的时间选择视图。
			clearBtn : true,//清除按钮

			forceParse : 0
		});
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
</script>
<!-- Myself define JS [End] -->
	<div style="padding: 10px;">
		
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<!-- Search condition area [Start] -->
			<div>
				<!-- Change background of panel (Area-[Panel Start]) -->
				<div class="panel panel-primary" style="border-color: black;">
					<div class="panel-heading" style="background: #784214">Search Area</div>
					<!-- Change background of panel (Area-[Panel Body Start]) -->
					<div class="panel-body">
						<label for="name">Search Condition</label>
						<!-- Search Area for Form [Start] -->
						<form action="" role="form" class="form-horizontal">
							<div class="form-group">
								<!-- Date format of Search Condition Area [Start]-->
								<div>
									<div class="col-lg-1 col-md-1 col-sm-2 col-xs-4" style="padding: 5px 0px 0px 10px;">
										<label for="name">Date Example:</label>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-4 col-xs-7">
										<input name="entryDate" placeholder="Date Example" id="blrz-entry-date-start"
											class="form-control bootstrap-date" type="text">
									</div>
									<!-- Date format of Search Condition Area [End]-->
								</div>
							</div>

							<!-- Model of select box Version one [Start]-->
							<div class="form-group">
								<label for="name" class="checkbox col-lg-1 col-md-1 col-sm-2 col-xs-4"> CheckBox Example</label>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
									<input type="checkbox" class="checkbox">
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-1 col-md-1 col-sm-2 col-xs-4" for="name">Select Ver2.0</label>
								<div class="col-lg-2 col-md-3 col-sm-4 col-xs-8">
									<select class="form-control">
										<option>Select One</option>
										<option>Select Two</option>
										<option>Select Three</option>
										<option>Select Four</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-1 col-md-1 col-sm-2" for="name">Select Ver3.0</label>
								<div class="col-lg-2 col-md-4 col-sm-5 col-xs-10">
									<select class="form-control" multiple="multiple">
										<option>Select One</option>
										<option>Select Two</option>
										<option>Select Three</option>
										<option>Select Four</option>
									</select>
								</div>
							</div>
							<!-- Model of select box Version one [End]-->

							<!-- Model of Textarea [Start]-->
							<div class="form-group">
								<div class="col-lg-1 col-md-1 col-sm-2">
									<label for="name">Textarea Example:</label>
								</div>
								<div class=" col-lg-2 col-md-4 col-sm-5 col-xs-10">
									<textarea class="textarea"></textarea>
								</div>
							</div>
							<!-- Model of Textarea [End]-->

							<!-- Help Text [Start] -->
							<div class="form-group">
								<label for="name" class="col-lg-1">HelpText Example:</label> <span class="help-block col-lg-2">There is
									writing to help text of area.</span>
							</div>
							<!-- Help Text [End] -->
						</form>
						<!-- Search Area for Form [End] -->
					</div>
					<!-- (Area-[Panel Body End]) -->
				</div>
				<!-- (Area-[Panel End]) -->
			</div>
			<!-- Search condition area [End] -->
			<!-- Search result area [Start] -->
			<div style="padding-top: 20px;">
				<div class="panel panel-primary table-responsive">
					<div class="panel-heading">Search Content Display</div>
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr>
								<th>Title One</th>
								<th>Title Two</th>
								<th>Title Three</th>
								<th>Title Four</th>
								<th>Title Five</th>
							</tr>
						</thead>
						<tbody>
							<tr class="success">
								<td>Content One</td>
								<td>Content Two</td>
								<td>Content Three</td>
								<td>Content Four</td>
								<td>Content Five</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Button Area [Start] -->
				<nav style="text-align: center">
				<ul class="pagination pagination-lg" style="float: center" id="swichNums"></ul>
				</nav>
				<!-- Button Area [End] -->
			</div>
		</div>
		<!-- Search result area [End] -->
		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" style="padding-right:20px">
			<c:import url="../template/commonAction.jsp"/>
		</div>
	</div>
