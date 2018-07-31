package free.com.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {

	@Resource
	private LoginService service;

	@RequestMapping("init")
	public String init() {
		service.init();
		return "login";
	}

}
