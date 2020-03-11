package free.com.controller.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.Opinion;
import free.com.bean.system.Sys0302From;
import free.com.common.CommonUtil;
import free.com.service.system.Sys0302Service;
import free.com.utils.CommonConstants;
import free.com.utils.UserEnum;

/**
 * User Information Configure
 *
 * @author cao
 *
 */

@Controller
@RequestMapping("sys0302")
public class Sys0302Controller {

	@Autowired
	private Sys0302Service service;

	@Autowired
	private Opinion opinion;

	@RequestMapping("init")
	public String init(Model model) {
		return CommonConstants.FOLDER_SYS + "sys0302";
	}

	@RequestMapping("registered")
	public String registered(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sys0302From from = CommonUtil.getBean(Sys0302From.class, request);
		opinion.setOpinionContent(from.getOpinionText());
		opinion.setUpdUserId(UserEnum.ME.getVal());
		opinion.setUpdDate(CommonUtil.getSysDate());
		opinion.setInsUserId(UserEnum.ME.getVal());
		opinion.setInsDate(CommonUtil.getSysDate());
		service.registered(opinion);
		model.addAttribute("submitMark", CommonConstants.SUCCESS);
		return CommonConstants.FOLDER_SYS + "sys0302";
	}
}
