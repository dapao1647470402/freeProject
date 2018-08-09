package free.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("register")
public class RegisterController {

	@RequestMapping("init")
	public String init(){
		return "register";
	}

}
