package free.com.controller.system;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.Authority;
import free.com.bean.Role;
import free.com.bean.system.Sys0501From;
import free.com.bean.system.Sys0501SearchDto;
import free.com.common.CommonUtil;
import free.com.common.TableCommon;
import free.com.service.system.Sys0501Service;
import free.com.utils.CommonConstants;

/**
 * User Information Configure
 *
 * @author cao
 *
 */

@Controller
@RequestMapping("sys0501")
public class Sys0501Controller {

	@Autowired
	private Sys0501Service service;

	@RequestMapping("init")
	public String init(Model model) {
		List<Sys0501From> result = service.init();
		model.addAttribute("sys0501From", result);
		List<Role> roleTable = TableCommon.getRoleTable();
		model.addAttribute("roleList", roleTable);
		List<Authority> authorityTable = TableCommon.getAuthorityTable();
		model.addAttribute("authorityList", authorityTable);
		return CommonConstants.FOLDER_SYS + "sys0501";
	}

	@RequestMapping("search")
	public String search(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sys0501SearchDto searchDto = CommonUtil.getBean(Sys0501SearchDto.class, request);
		Map<String, Object> beanDto = CommonUtil.getBean(request);
		List<Sys0501From> result = service.search(searchDto);
		model.addAttribute("sys0501From", result);
		model.addAttribute("sys0501SearchDto", searchDto);
		List<Role> roleTable = TableCommon.getRoleTable();
		model.addAttribute("roleList", roleTable);
		List<Authority> authorityTable = TableCommon.getAuthorityTable();
		model.addAttribute("authorityList", authorityTable);
		if(beanDto.containsKey("flg") && beanDto.get("flg").equals("showUserDetail")) {
			model.addAttribute("sys050101From", result.get(0));
			return CommonConstants.FOLDER_SYS + "sys050101";
		}
		return CommonConstants.FOLDER_SYS + "sys0501";
	}


}
