package free.com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import free.com.bean.Menu;
import free.com.dao.MenuDao;
import free.com.utils.CommonConstants;

@Service
public class MenuService {

	@Resource(name = "meunDao")
	private MenuDao dao;
	
	public List<Map<String, Object>> init() {
		List<Menu> preMenuList = dao.init();
		return againSetMenu(preMenuList);
	}

	/**
	 * 重新设置菜单内容
	 * @param list
	 */
	private List<Map<String, Object>> againSetMenu(List<Menu> list) {
		List<Map<String, Object>> aftMeunList = new ArrayList<Map<String, Object>>();
		Iterator<Menu> valIterator = list.iterator();
		Set<String> repeatMark = new HashSet<String>();
		int repeatMarkSize = repeatMark.size();
		Map<String, Object> menuMap = new HashMap<String, Object>();
		while (valIterator.hasNext()) {
			Menu val = valIterator.next();
			repeatMark.add(val.getMenuGroupId());
			if (repeatMark.size() != repeatMarkSize) {
				menuMap.put(CommonConstants.MH, val.getMenuGroupName());
				repeatMarkSize = repeatMark.size();
				aftMeunList.add(menuMap);
				menuMap = new HashMap<String, Object>();
			}
			menuMap.put(CommonConstants.MD, val.getMenuName());
			menuMap.put(CommonConstants.MD_NO, val.getMenuId());
			aftMeunList.add(menuMap);
			menuMap = new HashMap<String, Object>();
		}
		return aftMeunList;
	}
	
}
