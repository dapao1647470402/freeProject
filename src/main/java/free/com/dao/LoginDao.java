package free.com.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import free.com.bean.User;
import free.com.common.DaoCommon;

@Repository
public class LoginDao {

	@SuppressWarnings("unchecked")
	public Map<String, Object> init() {
		SQLQuery sql = DaoCommon.sqlSession.createSQLQuery("select * from t_user");
		List<User> list = sql.addEntity(User.class).list();
		return null;
	}

}
