package free.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {

	@RequestMapping("init")
	public String init(HttpServletRequest request, Model model) {
		Object attribute = request.getParameter("backPageId");
		model.addAttribute("backPageId", attribute);
		return "main";
	}

}
