package free.com.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import free.com.dao.LoginDao;

@Service
public class LoginService {

	@Resource(name = "loginDao")
	private LoginDao dao;

	public Map<String, Object> init() {
		return dao.init();
	}

}
