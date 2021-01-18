package free.com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import free.com.bean.User;
import free.com.common.CommonUtil;
import free.com.common.LoggerCommon;
import free.com.service.LoginService;
import free.com.utils.CommonConstants;
import free.com.utils.StringUtils;
import free.com.utils.SystemEnum;

@Controller
@RequestMapping("login")
public class LoginController {

	@Resource
	private LoginService service;

	@RequestMapping("init")
	public String init(Model model) {
		Map<String, Object> initInfo = service.init();
		model.addAttribute(CommonConstants.LOGIN_STATUS, CommonConstants.loginStatus.INIT);
		initInfo.get("adviceResult");
		model.addAttribute("initContent", initInfo);
		return "login";
	}

	@RequestMapping("login")
	public String login(HttpSession session, User user, RedirectAttributes redirectModel, Model model,HttpServletRequest request) {
		boolean pwdCheckFlg = true;
		String dummyLoginFlg = request.getParameter("dummyLoginFlg");
		// 游客登录
		if (StringUtils.equals("1", dummyLoginFlg)) {
			String ip = CommonUtil.getIp(request);
			pwdCheckFlg = false;
			user.setAccountId("000");
			user.setPassword("000");
		}
		if (pwdCheckFlg && StringUtils.isEmpty(user.getAccountId()) || StringUtils.isEmpty(user.getPassword())) {
			LoggerCommon.printLog("Please Again Login causer By Not input Account Or Password",
					SystemEnum.LOG_LEVEL_DEBUG);
			redirectModel.addFlashAttribute("loginFailure", CommonConstants.FAILURE);
			return "redirect:/login/init";
		}

		List<User> userInfo = service.login(user);
		if (userInfo.size() > 1) {
			// TODO
		} else if (userInfo.size() == 0) {
			redirectModel.addFlashAttribute("loginFailure", CommonConstants.FAILURE);
			return "redirect:/login/init";
		} else {
			if (StringUtils.isEmpty(session.getAttribute(CommonConstants.USER_ID))
					&& StringUtils.isEmpty(session.getAttribute(CommonConstants.LOGIN_TIME))) {
				session.setAttribute(CommonConstants.USER_ID, userInfo.get(0).getUserId());
				session.setAttribute(CommonConstants.ACCOUNT_NM, userInfo.get(0).getAccountName());
				session.setAttribute(CommonConstants.USER_AUTHOR, userInfo.get(0).getUserAuthority());
				session.setAttribute(CommonConstants.USER, userInfo.get(0));
				session.setAttribute(CommonConstants.LOGIN_TIME,
						new SimpleDateFormat("yyyy/MM/dd HH:mm:ss:sss").format(new Date()));
				session.setAttribute(CommonConstants.LOGIN_TIME_HMS,
						new SimpleDateFormat("HH:mm:ss").format(new Date()));
			}
			return "forward:/main/init";
		}
		return null;
	}

	@RequestMapping("logout")
	public String logOut(HttpSession session) {
		// remove user information in the session
		session.removeAttribute(CommonConstants.USER);
		session.removeAttribute(CommonConstants.USER_ID);
		// session disabled
		session.invalidate();
		LoggerCommon.printLog("LogOut Success", SystemEnum.LOG_LEVEL_DEBUG);
		return "redirect:/login/init";
	}
}
