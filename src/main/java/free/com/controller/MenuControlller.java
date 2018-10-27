package free.com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import free.com.service.MenuService;

@Controller
@RequestMapping("meun")
public class MenuControlller {

	@Autowired
	private MenuService service;

	@RequestMapping("init")
	@ResponseBody
	public List<Map<String, Object>> init() {
		List<Map<String, Object>> menuList = service.init();
		return menuList;
	}

}
