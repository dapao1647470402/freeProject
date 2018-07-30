package free.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class LoginAction {

	@RequestMapping("init")
	public String init() {
		return "login";
	}

}
