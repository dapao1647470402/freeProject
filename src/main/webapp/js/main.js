/* Global Constants[20180818 Cao] */
window.EMPTY = "";
window.STRING_TRUE = "true";
window.STRING_NULL = "null";
window.STRING_FALSE = "false";
window.STRING_SUCCESS = "success";
window.STRING_FAULT = "fault";
window.currentPageId = "";
window.SYSTIME = "";
window.LOGIN_TIME = new Date('<%=session.getAttribute("loginTime")%>');
window.LOGOUT_TIME = "";
window.DATE_FROMAT_YYYYMMDDHHMMSS = "yyyy/MM/dd hh:mm:ss";
window.CURRENT_ACTION_ID = "";

/**
 * 启用提示框
 */
function enableTooltip(){
	$("[data-toggle='tooltip']").tooltip();
}

/**
 * fuction : set to Search Button Disabled
 * [20180826 Cao]
 */
function setSearchDisabled() {
	$("#search").attr("style", "display:none");
}

/**
 * fuction : set to Search Button Enabled
 * [20180826 Cao]
 */
function setSearchEnabled() {
	$("#search").attr("style", "display");
}

/**
 * fuction : set to Update Button Disabled
 * [20180826 Cao]
 */
function setUpdateDisabled() {
	$("#update").attr("style", "display:none");
}

/**
 * fuction : set to Update Button Enabled
 * [20180826 Cao]
 */
function setUpdateEnabled() {
	$("#update").attr("style", "display");
}

/**
 * fuction : set to Registered Button Disabled
 * [20180826 Cao]
 */
function setRegisteredDisabled() {
	$("#registered").attr("style", "display:none");
}

/**
 * fuction : set to Registered Button Enabled
 * [20180826 Cao]
 */
function setRegisteredEnabled() {
	$("#registered").attr("style", "display");
}

/**
 * function : set to action mode at the page 
 * clickElement : current button name of element
 * [20180826 Cao]
 */
function setActionMode(clickElement) {
	if (!clickElement) {
		return;
	}
	if (clickElement == "search") {
		$("#actionMode").html("查询");
	} else if (clickElement == "update") {
		$("#actionMode").html("更新");
	} else {
		$("#actionMode").html("注册");
	}
}

/**
 * function : cofrim to do TransitionHtml
 * param : flag (cofrim condition)
 * [20180826 Cao]
 */
function confirmTransitionHtml(flag) {
	if (!flag) {
		return true;
	} else {
		return false;
	}
}

/**
 * function : get time of System 
 * param : docId (current document elements)
 * param : format (date format)
 * [20180826 Cao]
 */
 function getSysTime(docId, format) {
	window.SYSTIME = new Date();
	var date = window.SYSTIME;
	var y = date.getFullYear();     //获取年份  
	var m =date.getMonth()+1;   //获取月份  返回0-11  
	if (m < 10) {
		m = "0" + m;
	}
	var d = date.getDate(); // 获取日  
	if (d < 10) {
		d = "0" + d;
	}
	var w = date.getDay();   //获取星期几  返回0-6   (0=星期天) 
	var ww = ' 星期'+'日一二三四五六'.charAt(new Date().getDay()) ;//星期几
	var h = date.getHours();  //时
	if (h < 10) {
		h = "0" + h;
	}
	var minute = date.getMinutes()  //分
	if (minute < 10) {
		minute = "0" + minute;
	}
	var s = date.getSeconds(); //秒
	if (s < 10) {
		s = "0" + s;
	}
	var sss = date.getMilliseconds() ; //毫秒
	if (docId && !format) {
		$(docId).html(y + "年" + m + "月" + d + "日" + ww + h + "：" + minute + ":" + s + ":" + sss);
	} else if (docId && format){
		if (format == (window.DATE_FROMAT_YYYYMMDDHHMMSS) ) {
			$(docId).html(y + "/" + m + "/" + d + ww + h + ":" + minute + ":" + s + ":" + sss);
		} else {
			
		}
	}
}

function loadDateComponent(){
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
	 }
 
 function bootstrapDateChange(currentElement, obj){
	 var dates = $('input[name='+ obj +']');
	 if (dates.length > 1) {
		 return false;
	 }else {
		 $(dates[0]).val(Date.parse(new Date($(currentElement).val())));
		 return true;
	 }
 }
 
 function ClearForm(id) {
	    var objId = document.getElementById(id);
	    if (objId == undefined) {
	        return;
	    }
	    for (var i = 0; i < objId.elements.length; i++) {
	        if (objId.elements[i].type == "text") {
	            objId.elements[i].value = "";
	        }
	        else if (objId.elements[i].type == "password") {
	            objId.elements[i].value = "";
	        }
	        else if (objId.elements[i].type == "radio") {
	            objId.elements[i].checked = false;
	        }
	        else if (objId.elements[i].type == "checkbox") {
	            objId.elements[i].checked = false;
	        }
	        else if (objId.elements[i].type == "select-one") {
	            objId.elements[i].options[0].selected = true;
	        }
	        else if (objId.elements[i].type == "select-multiple") {
	            for (var j = 0; j < objId.elements[i].options.length; j++) {
	                objId.elements[i].options[j].selected = false;
	            }
	        }
	        else if (objId.elements[i].type == "textarea") {
	            objId.elements[i].value = "";
	        }
	        //else if (objId.elements[i].type == "file") {
	        // //objId.elements[i].select();
	        // //document.selection.clear();
	        // // for IE, Opera, Safari, Chrome
	        // var file = objId.elements[i];
	        // if (file.outerHTML) {
	        // file.outerHTML = file.outerHTML;
	        // } else {
	        // file.value = ""; // FF(包括3.5)
	        // }
	        //}
	    }
	}
 
 