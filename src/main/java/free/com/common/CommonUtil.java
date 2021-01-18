package free.com.common;

import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import free.com.bean.User;
import free.com.utils.CommonConstants;
import free.com.utils.SystemEnum;

public class CommonUtil {

	private static Logger log = LoggerFactory.getLogger(UrlInterceptor.class);

	public CommonUtil() {
	}

	/**
	 * Copy请求中(formData)的值，放入到自定义类中
	 *
	 * @param request
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static <T> T getBean(Class<T> cls, HttpServletRequest request) {
		T newInstance = null;
		try {
			newInstance = cls.newInstance();
			// Form Data
			Map<String, Object> formMap = new HashMap<String, Object>();
			request.setCharacterEncoding("utf-8");
			String parameter = request.getParameter("formData");
			if (StringUtils.isEmpty(parameter)) {
				LoggerCommon.printLog("Bean无数据", SystemEnum.LOG_LEVEL_DEBUG);
				return newInstance;
			}
			// 页面数据转换为Map
			setFormMap(formMap, parameter);
			Field[] fields = newInstance.getClass().getDeclaredFields();
			for (Field field : fields) {
				field.setAccessible(true);
				String attributeName = field.getName();
				String attributeType = field.getType().getSimpleName();
				Object attributeData = formMap.get(attributeName);
				if (!free.com.utils.StringUtils.isEmpty(attributeData)
						&& !StringUtils.equals("nan", String.valueOf(attributeData).toLowerCase())
						&& StringUtils.equals("string", attributeData.getClass().getSimpleName().toLowerCase())) {
					if (StringUtils.equals("string", attributeType.toLowerCase())) {
						field.set(newInstance, URLDecoder.decode(String.valueOf(attributeData)));
					} else if (StringUtils.equals("integer", attributeType.toLowerCase())) {
						field.set(newInstance, Integer.parseInt(String.valueOf(attributeData)));
					} else if (StringUtils.equals("date", attributeType.toLowerCase())
							&& !StringUtils.equals("0", String.valueOf(attributeData).trim())) {
						Long longTime = new Long(String.valueOf(attributeData));
						Date date = new Date(longTime);
						field.set(newInstance, date);
					} else if (StringUtils.equals("double", attributeType.toLowerCase())) {
						field.set(newInstance, Double.parseDouble(String.valueOf(attributeData)));
					} else if (StringUtils.equals("long", attributeType.toLowerCase())) {
						field.set(newInstance, Long.parseLong(String.valueOf(attributeData)));
					} else if (StringUtils.equals("float", attributeType.toLowerCase())) {
						field.set(newInstance, Float.parseFloat(String.valueOf(attributeData)));
					} else if (StringUtils.equals("short", attributeType.toLowerCase())) {
						field.set(newInstance, Short.parseShort(String.valueOf(attributeData)));
					} else if (StringUtils.equals("list", attributeType.toLowerCase())) {
						List<String> list = new ArrayList<String>();
						list.add(attributeData.toString());
						field.set(newInstance, list);
					}
				} else if (attributeData != null
						&& StringUtils.equals("arrayList", attributeData.getClass().getSimpleName().toLowerCase())) {
					if (StringUtils.equals("list", attributeType.toLowerCase())) {
						field.set(newInstance, attributeData);
					}
				} else if (StringUtils.endsWith(attributeName.toLowerCase(), "timestamp")
						&& !StringUtils.equals("nan", String.valueOf(attributeData).toLowerCase())) {
					String timestamp = attributeName.replace("Timestamp", StringUtils.EMPTY);
					// 20190824 Mr.cao 非空判断追加 Start
					if (formMap.get(timestamp) != null && !free.com.utils.StringUtils.isEmpty(formMap.get(timestamp))) {
						field.set(newInstance, Long.parseLong(String.valueOf(formMap.get(timestamp))));
					}
					// 20190824 Mr.cao 非空判断追加 End
				}
			}
		} catch (Exception e) {
			LoggerCommon.printLog("Bean实例化异常", SystemEnum.LOG_LEVEL_DEBUG);
			e.printStackTrace();
		}

		return newInstance;
	}

	/**
	 * Copy请求中(formData)的值，放入到Map中
	 *
	 * @param request
	 * @return
	 */
	public static Map<String, Object> getBean(HttpServletRequest request) {
		// Form Data
		Map<String, Object> formMap = new HashMap<String, Object>();
		String parameter = request.getParameter("formData");
		if (StringUtils.isEmpty(parameter)) {
			LoggerCommon.printLog("Bean无数据", SystemEnum.LOG_LEVEL_DEBUG);
			return formMap;
		}
		// 页面数据转换为Map
		setFormMap(formMap, parameter);

		return formMap;
	}

	/**
	 * 将页面的数据(String形式,格式:name=data&name=data)转换为Map
	 *
	 * @param formMap   一个空的Map对象
	 * @param parameter 页面的数据(String形式)
	 */
	private static void setFormMap(Map<String, Object> formMap, String parameter) {
		Set<String> repeatMark = new HashSet<String>();
		int repeatSize = 0;
		int count = 0;
		String repeatData = null;
		List<String> repeatList = new ArrayList<String>();
		String[] split1 = parameter.split("\\&");
		for (String str1 : split1) {
			if (str1.contains("=")) {
				String[] split2 = str1.split("=");
				if (split2.length == 2) {
					repeatMark.add(split2[0]);
					if (repeatSize == repeatMark.size()) {
						if (count == 0) {
							repeatList.add(repeatData);
							count++;
						}
						repeatList.add(split2[1]);
						formMap.put(split2[0], repeatList);
					} else {
						formMap.put(split2[0], split2[1]);
					}
					repeatData = split2[1];
					repeatSize = repeatMark.size();
				}
			}
		}
	}

	/**
	 * 获取时间戳
	 *
	 * @return
	 */
	public static String getTimestamp() {
		long time = new Date().getTime();
		return String.valueOf(time);
	}

	/**
	 * 获取时间
	 *
	 * @return
	 */
	public static Date getSysDate() {
		return new Date();
	}

	/**
	 * 获取时间
	 *
	 * @return
	 */
	public static String getSysDateText() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(CommonConstants.YYYY_MM_DD_HH_MM_SS);
		String format = simpleDateFormat.format(getSysDate());
		return format;
	}

	/**
	 * 获取session中的用户信息
	 */
	public static User getUserInfo() {
		// 获取到ServletRequestAttributes 里面有
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		// 获取到Request对象
		HttpServletRequest request = attrs.getRequest();
		// 获取到Session对象
		User user = new User();
		try {
			user = (User) (request.getSession().getAttribute(CommonConstants.USER));
		} catch (Exception e) {
			log.error("******User Infomation Error******" + e.getMessage());
		}
		return user;
	}

	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个ip值，第一个ip才是真实ip
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("X-Real-IP");
		if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			return ip;
		}
		return request.getRemoteAddr();
	}
}
