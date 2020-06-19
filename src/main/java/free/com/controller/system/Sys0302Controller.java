package free.com.controller.system;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;

import free.com.bean.Opinion;
import free.com.bean.system.Sys0302From;
import free.com.bean.system.Sys0302SearchDto;
import free.com.common.CommonUtil;
import free.com.service.system.Sys0302Service;
import free.com.utils.CommonConstants;
import free.com.utils.StringUtils;

/**
 * User Information Configure
 *
 * @author cao
 *
 */

@Controller
@RequestMapping("sys0302")
public class Sys0302Controller {

	@Autowired
	private Sys0302Service service;

	@Autowired
	private Opinion opinion;

	@RequestMapping("init")
	public String init(Model model) {
		return CommonConstants.FOLDER_SYS + "sys0302";
	}

	@RequestMapping("registered")
	public String registered(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sys0302From from = CommonUtil.getBean(Sys0302From.class, request);
		opinion.setOpinionContent(from.getOpinionText());
		opinion.setUpdUserId(CommonUtil.getUserInfo().getInsUserId());
		opinion.setUpdDate(CommonUtil.getSysDate());
		opinion.setInsUserId(CommonUtil.getUserInfo().getInsUserId());
		opinion.setInsDate(CommonUtil.getSysDate());
		service.registered(opinion);
		model.addAttribute("submitMark", CommonConstants.SUCCESS);
		return CommonConstants.FOLDER_SYS + "sys0302";
	}

	@RequestMapping("result")
	public String getResult(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sys0302SearchDto searchDto = CommonUtil.getBean(Sys0302SearchDto.class, request);
		Map<String, Object> map = CommonUtil.getBean(request);
		List<Sys0302From> result = service.getResult(searchDto);
		model.addAttribute("sys0302From", result);
		//更新或删除前的确认画面
		if (!StringUtils.isEmpty(searchDto.getDataId())) {
			model.addAttribute("sys0302Result", result.get(0));
			if (map.containsKey("flg") && map.get("flg").equals("upd")) {
				return CommonConstants.FOLDER_SYS + "sys030202";
			}
			response.setCharacterEncoding("utf-8");
			try {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("sys0302UpdOrDelDto", result);
				response.getWriter().print(jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		return CommonConstants.FOLDER_SYS + "sys030201";
	}

	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sys0302SearchDto searchDto = CommonUtil.getBean(Sys0302SearchDto.class, request);
		Opinion opinion = new Opinion();
		opinion.setId(Integer.valueOf(searchDto.getDataId()));
		service.delete(opinion);
		return "redirect:/sys0302/result";
	}

	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpServletResponse response, Model model) {
		Opinion opinion = CommonUtil.getBean(Opinion.class, request);
		service.update(opinion);
		return "redirect:/sys0302/result";
	}
}
