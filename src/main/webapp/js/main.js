/* Global Constants[20180818 Cao] */
window.EMPTY = "";
window.STRING_TRUE = "true";
window.STRING_NULL = "null";
window.STRING_FALSE = "false";
window.STRING_SUCCESS = "success";
window.STRING_FAULT = "fault";
window.currentPageId = "";
window.SYSTIME = "";
window.LOGOUT_TIME = "";
window.DATE_FROMAT_YYYYMMDDHHMMSS = "yyyy/MM/dd hh:mm:ss";
window.CURRENT_ACTION_ID = "";
/** 规定什么动作的Form会被Check */
window.CHECK_ACTION_ID = [];
/** 返回按钮使用参数 */
window.COMMON_BACK_BTN_PRE_URL = "";
window.BAKE_PAGE_ID = "";
/** 弹出框要显示的Html内容 */
Window.COMMON_DIALOGS1_HTML="";
Window.AJAX_JSON_DATA="";
/**
 * 启用提示框
 */
function enableTooltip(){
	$("[data-toggle='tooltip']").tooltip();
}

/**
 * fuction : set to Search Button Disabled
 * 功能 : 禁用导航部的查询按钮
 * [20180826 Cao]
 */
function setSearchDisabled() {
	$("#search").attr("style", "display:none");
}

/**
 * fuction : set to Search Button Enabled
 * 功能 : 启用导航部的查询按钮
 * [20180826 Cao]
 */
function setSearchEnabled(btnName) {
	$("#search").attr("style", "display");
	if (typeof(btnName) != "undefined") {
		$("#search").html("<label for='name' style='color: #e4ff00'>"+ btnName +"</label>");
	}
}

/**
 * fuction : set to Update Button Disabled
 * 功能 : 禁用导航部的更新按钮
 * [20180826 Cao]
 */
function setUpdateDisabled() {
	$("#update").attr("style", "display:none");
}

/**
 * fuction : set to Update Button Enabled
 * 功能 : 启用导航部的查询按钮
 * [20180826 Cao]
 */
function setUpdateEnabled(btnName) {
	$("#update").attr("style", "display");
	if (typeof(btnName) != "undefined") {
		$("#update").html("<label for='name' style='color: #e4ff00'>"+ btnName +"</label>");
	}
}

/**
 * fuction : set to Registered Button Disabled
 * 功能 : 禁用导航部的注册按钮
 * [20180826 Cao]
 */
function setRegisteredDisabled() {
	$("#registered").attr("style", "display:none");
}

/**
 * fuction : set to Registered Button Enabled
 * 功能 : 启用导航部的查询按钮
 * [20180826 Cao]
 */
function setRegisteredEnabled(btnName) {
	
	$("#registered").attr("style", "display");
	if (typeof(btnName) != "undefined") {
		$("#registered").html("<label for='name' style='color: #e4ff00'>"+ btnName +"</label>");
	}
}
/**
 * fuction : set to Registered Button Disabled
 * 功能 : 禁用Back按钮
 * [20180826 Cao]
 */
function setBackBtnDisabled() {
	$("#commonBackBtn").attr("style", "display:none");
}

/**
 * fuction : set to Registered Button Enabled
 * 功能 : 启用Back按钮
 * [20180826 Cao]
 */
function setBackBtnEnabled(btnName) {
	$("#commonBackBtn").attr("style", "display");
	if (typeof(btnName) != "undefined") {
		$("#commonBackBtn").text(btnName);
	}else {
		$("#commonBackBtn").text("返回");
	}
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
	} else if (clickElement == "registered") {
		$("#actionMode").html("注册");
	} else if (clickElement == "result") {
		$("#actionMode").html("查询结果");
	} else {
		$("#actionMode").html(clickElement);
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
 
 /***
  * 功能 ： 清楚form的内容
  * @param id(form的ID)
  * @returns
  */
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
 
 function setBackUrl(obj){
	 window.COMMON_BACK_BTN_PRE_URL = obj;
 }
 
 /**
  * function : go Back
  * [20200312 Cao]
  */
 function commonGoBack() {
	$('.underNavBar').load(window.COMMON_BACK_BTN_PRE_URL);
 }
 
 function getInputSizeByMaxLength(element, displayElement){
	 var doc = $('#'+ element);
	 var docDis = $('#'+ displayElement);
	 var maxLength = document.getElementById(element).getAttribute("maxlength");
	 docDis.text(maxLength);
	 if (!doc) {
		 return;
	 }
	 doc.bind("keydown",function(){
		 var inputSize = doc.val().length;
		 var docDisText = parseInt(maxLength) - parseInt(inputSize);
		docDis.text(docDisText);
	 });
 }
 
/**
 * 共同方法：执行commonForm的必须属性的Check
 * @returns
 */
 function checkSubmitRequired(){  
	 
	 var flag = 0;
	 if(!beginFormCheck()){
		return flag;
	 }
     $("#commonForm .required").each(function(){
         var val=$(this).val();
         var message=$(this).attr("message");
         var type=$(this).attr("type");
         if(!val){
        	 var mes_span = "<span style='color:red;'>&nbsp;&nbsp;<strong>※</strong>" + message + "</span>";
             //判断隐藏域
             if(type=="hidden")
             {
                 $(this).next().focus();
                 $(this).next().next().html(mes_span);
             }
             else{
                 $(this).focus();
                 var idName = $(this).attr("id");
                 document.getElementById(idName).insertAdjacentHTML("afterEnd",mes_span);
             }
             flag=1;
             return false;
         }

     });
     return flag;
	 
 }

 /**
  * 限制必须属性Check的场合
  * @param enableAction
  *         必须Check的场合：例：检索(#search)
  * @returns
  */
 function beginFormCheck(){
	 for (var i = 0; i < window.CHECK_ACTION_ID.length; i++) {
         if (window.CURRENT_ACTION_ID == window.CHECK_ACTION_ID[i]){
        	 return true;
         }
     }  
	 return false;
 }
 /**
 * 弹出框
 */
function commonDialogs1confirm(subtnNm,subtnEventNm) {
	$("#common_dialogs_1_confirm_info").html(Window.COMMON_DIALOGS1_HTML);
	// display dialog
	$('#common_dialogs1').modal('show');
	$('#common_modallabel_1').html('请确认'+ subtnNm + "信息：");
	$('#common_dialogs1_subit_btn').html(subtnNm);
	setActionMode(subtnNm);
	$('#common_dialogs1_subit_btn').attr('onclick',"transitionHtml(null,'"+subtnEventNm+"','commonDialogs1Ajax')");
}