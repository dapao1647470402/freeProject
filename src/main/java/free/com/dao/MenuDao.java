package free.com.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import free.com.bean.Menu;
import free.com.bean.User;
import free.com.common.DaoCommon;
import free.com.utils.CommonConstants;

@Repository("meunDao")
public class MenuDao {

	public List<Menu> init(User user) {
		String sql = "SELECT * FROM "
				+ "T_MENU "
				+ "WHERE MENU_GROUP_AUTHORITY <= CAST( ? as SIGNED   INTEGER) "
				+ "AND MENU_AUTHORITY <= CAST( ? as SIGNED   INTEGER) ORDER BY SORT_NO";
		SQLQuery sqlQuery = DaoCommon.sqlSession.createSQLQuery(sql);
		sqlQuery.setString(0, user.getMenuGroupAuthority());
		sqlQuery.setString(1, user.getMenuSubMaxAuthority());
		@SuppressWarnings("unchecked")
		List<Menu> list = sqlQuery.addEntity(Menu.class).setMaxResults(CommonConstants.MAX_COUNT).list();
		return list;
	};

}
