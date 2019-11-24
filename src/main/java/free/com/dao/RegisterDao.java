package free.com.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import free.com.bean.User;
import free.com.common.DaoCommon;

@Repository("registerDao")
public class RegisterDao {

	public Map<String, Object> doRegister(User user) {
		DaoCommon.sqlSession.save(user);
		return null;
	}

}
