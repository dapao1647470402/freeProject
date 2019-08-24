package free.com.common;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import free.com.utils.SystemEnum;

public class CommonUtil {

	public CommonUtil() {
	}

	public static <T> T getBean(Class<T> cls, HttpServletRequest request) {
		T newInstance = null;
		try {
			newInstance = cls.newInstance();
			// Form Data
			Map<String, Object> formMap = new HashMap<String, Object>();
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
						&& StringUtils.equals("String", attributeData.getClass().getSimpleName())) {
					if (StringUtils.equals("String", attributeType)) {
						field.set(newInstance, attributeData);
					} else if (StringUtils.equals("Integer", attributeType)) {
						field.set(newInstance, Integer.parseInt(String.valueOf(attributeData)));
					} else if (StringUtils.equals("Date", attributeType)
							&& !StringUtils.equals("0", String.valueOf(attributeData).trim())) {
						Long longTime = new Long(String.valueOf(attributeData));
						Date date = new Date(longTime);
						field.set(newInstance, date);
					} else if (StringUtils.equals("Double", attributeType)) {
						field.set(newInstance, Double.parseDouble(String.valueOf(attributeData)));
					} else if (StringUtils.equals("Float", attributeType)) {
						field.set(newInstance, Float.parseFloat(String.valueOf(attributeData)));
					} else if (StringUtils.equals("Short", attributeType)) {
						field.set(newInstance, Short.parseShort(String.valueOf(attributeData)));
					} else if (StringUtils.equals("List", attributeType)) {
						List<String> list = new ArrayList<String>();
						list.add(attributeData.toString());
						field.set(newInstance, list);
					}
				} else if (attributeData != null
						&& StringUtils.equals("ArrayList", attributeData.getClass().getSimpleName())) {
					if (StringUtils.equals("List", attributeType)) {
						field.set(newInstance, attributeData);
					}
				} else if (StringUtils.endsWith(attributeName, "Timestamp")
						&& !StringUtils.equals("nan", String.valueOf(attributeData).toLowerCase())) {
					String timestamp = attributeName.replace("Timestamp", StringUtils.EMPTY);
					// 20190824 Mr.cao 非空判断追加 Start
					if (formMap.get(timestamp) != null
							&& !free.com.utils.StringUtils.isEmpty(formMap.get(timestamp))) {
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
}
