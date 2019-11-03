package free.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.User;
import free.com.common.CommonUtil;
import free.com.service.RegisterService;
import free.com.utils.UserEnum;

@Controller
@RequestMapping("register")
public class RegisterController {

	@Autowired
	private RegisterService registerService;

	@RequestMapping("init")
	public String init(){
		return "register";
	}

	@RequestMapping("doRegister")
	public String doRegister(User user){
		String userId = UserEnum.USER_PREFIX_U.getVal() + CommonUtil.getTimestamp();
		user.setUserId(userId);
		user.setUserRole(UserEnum.USER_ROLE_DEFAULT.getVal());
		user.setUserAuthority(UserEnum.USER_AUTHORITY_DEFAULT.getVal());
		user.setMenuGroupAuthority(UserEnum.MENU_GROUP_AUTHORITY_DEFAULT.getVal());
		user.setMenuSubMaxAuthority(UserEnum.MENU_SUB_MAX_AUTHORITY_DEFAULT.getVal());
		user.setUpdUserId(UserEnum.ME.getVal());
		user.setUpdDate(CommonUtil.getSysDate());
		user.setInsUserId(UserEnum.ME.getVal());
		user.setInsDate(CommonUtil.getSysDate());
		registerService.doRegister(user);
		return "login";
	}

}
