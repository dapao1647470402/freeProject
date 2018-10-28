package free.com.common;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import free.com.utils.SystemEnum;

public class CommonUtil {

	public CommonUtil() {
	}
	
	public static <T> T getForm(Class<T> cls, HttpServletRequest request) {
		T newInstance = null;
		try {
			newInstance = cls.newInstance();
			// Form Data
			Map<String, String> formMap = new HashMap<String, String>(); 
			String parameter = request.getParameter("formData");
			if (StringUtils.isEmpty(parameter)) {
				LoggerCommon.printLog("Form无数据", SystemEnum.LOG_LEVEL_DEBUG);
				return newInstance;
			} 
			setFormMap(formMap, parameter);
			Field[] fields = newInstance.getClass().getDeclaredFields();
			for (Field field : fields) {
				field.setAccessible(true);
				String attributeName = field.getName();
				String attributeType = field.getType().getSimpleName();
				String attributeData = formMap.get(attributeName);
				if (StringUtils.equals("String", attributeType)) {
					field.set(newInstance, attributeData);
				} else if (StringUtils.equals("Integer", attributeType)) {
					field.set(newInstance, Integer.parseInt(attributeData));
				} else if (StringUtils.equals("Date", attributeType)) {
					Long longTime = new Long(attributeData);
					Date date = new Date(longTime);
					field.set(newInstance, date);
				} else if (StringUtils.equals("Double", attributeType)) {
					field.set(newInstance, Double.parseDouble(attributeData));
				} else if (StringUtils.equals("Float", attributeType)) {
					field.set(newInstance, Float.parseFloat(attributeData));
				} else if (StringUtils.equals("Short", attributeType)) {
					field.set(newInstance, Short.parseShort(attributeData));
				}
			}
		} catch (Exception e) {
			LoggerCommon.printLog("Form实例化异常", SystemEnum.LOG_LEVEL_DEBUG);
			e.printStackTrace();
		}
		
		return newInstance;
	}

	private static void setFormMap(Map<String, String> formMap, String parameter) {
		String[] split1 = parameter.split("\\&");
		for (String str1 : split1) {
			if (str1.contains("=")) {
				String[] split2 = str1.split("=");
				if (split2.length == 2) {
					formMap.put(split2[0], split2[1]);
				}
			}
		}
	}
}
