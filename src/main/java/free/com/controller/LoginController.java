package free.com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.service.LoginService;
import free.com.utils.CommonConstants;

@Controller
@RequestMapping("login")
public class LoginController {

	@Resource
	private LoginService service;

	@RequestMapping("init")
	public String init(Model model) {
		service.init();
		model.addAttribute(CommonConstants.LOGIN_STATUS, CommonConstants.loginStatus.INIT);
		model.addAttribute("projectResume", "............................");
		return "login";
	}

	@RequestMapping("login")
	public String login(HttpSession session) {
		session.setAttribute(CommonConstants.USER, "Test01");
		return "forward:main/init";
	}

}
