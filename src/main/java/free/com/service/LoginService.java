package free.com.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.com.dao.LoginDao;

@Service
public class LoginService {

	@Autowired
	private LoginDao dao;

	public Map<String, Object> init() {
		Map<String, Object> initMap = new HashMap<String, Object>();
		dao.init();
		return initMap;
	}

}
