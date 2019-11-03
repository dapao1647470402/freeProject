package free.com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import free.com.bean.User;
import free.com.service.MenuService;
import free.com.utils.CommonConstants;

@Controller
@RequestMapping("meun")
public class MenuControlller {

	@Autowired
	private MenuService service;

	@RequestMapping("init")
	@ResponseBody
	public List<Map<String, Object>> init(HttpSession session) {
		User user = (User)session.getAttribute(CommonConstants.USER);
		List<Map<String, Object>> menuList = service.init(user);
		return menuList;
	}

}
