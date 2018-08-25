package free.com.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import free.com.bean.system.Sys0501From;
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
		return CommonConstants.FOLDER_SYS + "sys0501";
	}

}
