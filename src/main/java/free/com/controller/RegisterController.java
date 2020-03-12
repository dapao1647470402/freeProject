package free.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.User;
import free.com.common.CommonUtil;
import free.com.service.RegisterService;
import free.com.utils.StringUtils;
import free.com.utils.UserEnum;

@Controller
@RequestMapping("register")
public class RegisterController {

	@Autowired
	private RegisterService registerService;

	@RequestMapping("init")
	public String init(HttpServletRequest request, Model model){
		Object attribute = request.getParameter("backPageId");
		model.addAttribute("backPageId", attribute);
		return "register";
	}

	@RequestMapping("doRegister")
	public String doRegister(User user, HttpServletRequest request, Model model){
		String userId = UserEnum.USER_PREFIX_U.getVal() + CommonUtil.getTimestamp();
		user.setUserId(userId);
		user.setUserRole(UserEnum.USER_ROLE_DEFAULT.getVal());
		user.setUserAuthority(UserEnum.USER_AUTHORITY_DEFAULT.getVal());
		user.setMenuGroupAuthority(UserEnum.MENU_GROUP_AUTHORITY_DEFAULT.getVal());
		user.setMenuSubMaxAuthority(UserEnum.MENU_SUB_GROUP_AUTHORITY_DEFAULT.getVal());
		user.setUpdUserId(userId);
		user.setUpdDate(CommonUtil.getSysDate());
		user.setInsUserId(userId);
		user.setInsDate(CommonUtil.getSysDate());
		registerService.doRegister(user);
		Object attribute = request.getParameter("backPageId");
		model.addAttribute("backPageId", attribute);
		if (!StringUtils.isEmpty(attribute)) {
			return "main";
		}else {
			return "login";
		}
	}

}
