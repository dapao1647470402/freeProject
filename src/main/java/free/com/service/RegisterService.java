package free.com.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import free.com.bean.User;
import free.com.dao.RegisterDao;

@Service
public class RegisterService {

	@Resource(name = "registerDao")
	private RegisterDao dao;

	public Map<String, Object> doRegister(User user) {
		dao.doRegister(user);
		return new HashMap<String, Object>();
	}

}
