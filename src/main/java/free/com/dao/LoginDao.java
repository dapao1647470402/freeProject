package free.com.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import free.com.bean.Advice;
import free.com.bean.Image;
import free.com.bean.ProjectResume;
import free.com.bean.User;
import free.com.common.DaoCommon;

@Repository("loginDao")
public class LoginDao {

	@SuppressWarnings("unchecked")
	public Map<String, Object> init() {
		List<Advice> adviceResult = DaoCommon.sqlSession.createSQLQuery("SELECT * FROM T_ADVICE")
				.addEntity(Advice.class).setMaxResults(2).list();
		List<Image> imageResult = DaoCommon.sqlSession.createSQLQuery("SELECT * FROM T_IMAGE").addEntity(Image.class)
				.list();
		List<ProjectResume> pjResume = DaoCommon.sqlSession.createSQLQuery("SELECT * FROM T_PROJECT_RESUME")
				.addEntity(ProjectResume.class).setMaxResults(1).list();
		Map<String, Object> map = DaoCommon.getMap();
		map.put("adviceResult", adviceResult);
		map.put("imageResult", imageResult);
		map.put("pjResume", pjResume);
		return map;
	}

	@SuppressWarnings("unchecked")
	public List<User> login(User user) {
		SQLQuery sql = DaoCommon.sqlSession.createSQLQuery("SELECT * FROM T_USER WHERE ACCOUNT_ID = ? AND PSD = ?");
		sql.setString(0, user.getAccountId());
		sql.setString(1, user.getPassword());
		return sql.addEntity(User.class).list();
	}

}
