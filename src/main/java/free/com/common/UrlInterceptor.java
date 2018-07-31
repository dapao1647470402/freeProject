package free.com.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import free.com.utils.CommonConstants;

public class UrlInterceptor implements HandlerInterceptor{

	private Logger log = LoggerFactory.getLogger(UrlInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("******Current Action:Check URL******");
		HttpSession session = request.getSession(false);
		if (session == null
				|| !StringUtils.isEmpty(String.valueOf(session.getAttribute(CommonConstants.USER)))
				|| StringUtils.equals(CommonConstants.STR_NULL, String.valueOf(session.getAttribute(CommonConstants.USER)))) {
			log.info("******Current Action:Please again login******");
			response.sendRedirect("login/init");
			return false;
		}
		log.info("******Current Action:No error^-^ Account:" + session.getAttribute(CommonConstants.USER) + "******");
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("******Current Action:postHandle******");
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("******Current Action:afterCompletion******");
	}



}
