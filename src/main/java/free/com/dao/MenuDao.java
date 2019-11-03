package free.com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import free.com.bean.Menu;
import free.com.bean.User;
import free.com.common.DaoCommon;
import free.com.utils.CommonConstants;

@Repository("meunDao")
public class MenuDao {

	public List<Menu> init(User user) {
		@SuppressWarnings("unchecked")
		List<Menu> list = DaoCommon.sqlSession.createSQLQuery("SELECT * FROM T_MENU ORDER BY SORT_NO").addEntity(Menu.class).setMaxResults(CommonConstants.MAX_COUNT).list();
		return list;
	};

}
