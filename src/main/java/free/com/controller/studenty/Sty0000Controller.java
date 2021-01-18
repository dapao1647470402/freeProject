package free.com.controller.studenty;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import free.com.bean.Opinion;
import free.com.bean.studenty.Sty0000From;
import free.com.bean.studenty.Sty0000ResultDto;
import free.com.common.CommonUtil;
import free.com.common.SolrCommon;
import free.com.service.system.Sys0302Service;
import free.com.utils.CommonConstants;
import free.com.utils.StringUtils;
import free.com.utils.SystemEnum;
import free.com.utils.UserEnum;

/**
 * User Information Configure（向DB里面迁移功能还在完善中）
 *
 * @author cao
 *
 */

@Controller
@RequestMapping("sty0000")
public class Sty0000Controller {

	@Autowired
	private Sys0302Service service;

	@Autowired
	private Opinion opinion;

	@RequestMapping("init")
	public String init(Model model) {
		return CommonConstants.FOLDER_STY + "sty0000";
	}

	@RequestMapping("registered")
	public String registered(HttpServletRequest request, HttpServletResponse response, Model model){
		String infoId = SystemEnum.COMMON_PREFIX_I.getVal() + CommonUtil.getTimestamp();
		Sty0000From from = CommonUtil.getBean(Sty0000From.class, request);
		from.setId(infoId);
		from.setUpdUserId(CommonUtil.getUserInfo().getUserId());
		from.setUpdDate(CommonUtil.getSysDateText());
		from.setInsUserId(CommonUtil.getUserInfo().getUserId());
		from.setInsDate(CommonUtil.getSysDateText());
		try {
			SolrCommon.addDoc(from,CommonConstants.SORL_URL);
			model.addAttribute("submitMark", CommonConstants.SUCCESS);
			from.setShowMyselfList(CommonConstants.ON_STR);
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("submitMark", CommonConstants.FAILURE);

		}
		model.addAttribute("sty0000From", from);
		return CommonConstants.FOLDER_STY + "sty0000";
	}

	@RequestMapping("search")
	public String getResult(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sty0000From from = CommonUtil.getBean(Sty0000From.class, request);
		if (StringUtils.equals(UserEnum.USER_ROLE_DEVLOP.getVal(), CommonUtil.getUserInfo().getUserRole())
				|| StringUtils.equals(UserEnum.USER_ROLE_MANGER.getVal(), CommonUtil.getUserInfo().getUserRole())) {
			from.setShowMyselfList(CommonConstants.ON_STR);
		}
		Sty0000ResultDto result = new Sty0000ResultDto();
		// 检索结果画面初始化
		from.setSearchAreaShow(CommonConstants.ON_STR);
		List<Object> querySolr = null;
		try {
			String searchKey = from.getSearchKey();
			StringBuilder sb = new StringBuilder();
			if(StringUtils.isNotEmpty(searchKey)) {
				sb.append("title:" + "*" + searchKey + "*");
				sb.append(" OR resume:"+ "*" +  searchKey + "*");
				sb.append(" OR selfOfType:"+ "*" +  searchKey + "*");
				sb.append(" OR insDate:"+ "*" +  searchKey + "*");
				sb.append(" OR insUserId:"+ "*" +  searchKey + "*");
				sb.append(" OR insUserName:"+ "*" +  searchKey + "*");
			}
			//结果中域的列表
			//           query.setFields("id","product_name","product_price","product_catalog_name","product_picture");
			//设置默认搜索域
			//	      query.set("df", "product_keywords");
			querySolr = SolrCommon.querySolr(sb.toString(),null,result,CommonConstants.SORL_URL);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("sty0000Result", querySolr);
		model.addAttribute("sty0000From", from);
		return CommonConstants.FOLDER_STY + "sty0000";
	}

	@RequestMapping("result")
	public String result(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes attr) {
		return "forward:/sty0000/search";
	}

	@RequestMapping("close")
	public String close(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sty0000From from = CommonUtil.getBean(Sty0000From.class, request);
		from.setSearchAreaShow(CommonConstants.OFF_STR);
		model.addAttribute("sty0000From", from);
		return CommonConstants.FOLDER_STY + "sty0000";
	}

	@RequestMapping("resultByMe")
	public String resultByMe(HttpServletRequest request, HttpServletResponse response, Model model) {
		Sty0000From from = CommonUtil.getBean(Sty0000From.class, request);
		Sty0000ResultDto result = new Sty0000ResultDto();
		List<Object> querySolr = null;
		try {
			String searchKey = from.getSearchKey();
			StringBuilder sb = new StringBuilder();
			if (StringUtils.isNotEmpty(searchKey)) {
				sb.append("(title:" + "*" + searchKey + "*");
				sb.append(" OR resume:"+ "*" +  searchKey + "*");
				sb.append(" OR selfOfType:"+ "*" +  searchKey + "*");
				sb.append(" OR insDate:"+ "*" +  searchKey + "*");
				sb.append(" OR insUserId:"+ "*" +  searchKey + "*");
				sb.append(" OR insUserName:"+ "*" +  searchKey + "*)");
				sb.append(" AND insUserId:"+ CommonUtil.getUserInfo().getUserId());
			} else {
				sb.append("insUserId:"+ CommonUtil.getUserInfo().getUserId());
			}
			querySolr = SolrCommon.querySolr(sb.toString(),null,result,CommonConstants.SORL_URL);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("sty0000Result", querySolr);
		model.addAttribute("sty0000From", from);
		return CommonConstants.FOLDER_STY + "sty0000";
	}
}
