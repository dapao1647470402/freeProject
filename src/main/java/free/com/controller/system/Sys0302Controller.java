package free.com.controller.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.system.Sys0302From;
import free.com.common.CommonUtil;
import free.com.utils.CommonConstants;

/**
 * User Information Configure
 *
 * @author cao
 *
 */

@Controller
@RequestMapping("sys0302")
public class Sys0302Controller {

	@RequestMapping("init")
	public String init(Model model) {
		return CommonConstants.FOLDER_SYS + "sys0302";
	}

	@RequestMapping("registered")
	public String registered(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sys0302From from = CommonUtil.getBean(Sys0302From.class, request);
		return CommonConstants.FOLDER_SYS + "sys0302";
	}
}
