package free.com.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.Menu;
import free.com.common.TableCommon;
import free.com.utils.CommonConstants;


/**
 * 菜单配置
 *
 * @author cao
 *
 */

@Controller
@RequestMapping("sys0401")
public class Sys0401Controller {


	@RequestMapping("init")
	public String init(Model model) {
		List<Menu> menuTable = TableCommon.getMenuTable();
		Map<String,Object> menuMap = new HashMap<String,Object>();
		List<Menu> menus = new ArrayList<Menu>();
		List<Map> menuList = new ArrayList<Map>();
		Set<String> setMenuGroup = new HashSet<String>();
		int setMenuGroupSize = 0;
		for (Menu m : menuTable) {
			setMenuGroup.add(m.getMenuGroupId());
			if (setMenuGroup.size() != setMenuGroupSize) {
				if(setMenuGroup.size() != 1) {
					menuMap.put("menus", menus);
					menus = new ArrayList<Menu>();
					menuList.add(menuMap);
					menuMap = new HashMap<String,Object>();
				}
				menuMap.put("menuGroup", m);
				setMenuGroupSize = setMenuGroup.size();

			}
			menus.add(m);
		}
		menuMap.put("menus", menus);
		menuList.add(menuMap);
		model.addAttribute("menuList", menuList);
		return CommonConstants.FOLDER_SYS + "sys0401";
	}
}
