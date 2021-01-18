package free.com.common;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import free.com.bean.Authority;
import free.com.bean.Menu;
import free.com.bean.Role;
import free.com.utils.CommonConstants;

@Component
public class TableCommon {

	public static SessionFactory sessionFactory;
	public static Session session;

	/**
	 * @return the sessionFactory
	 */
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @param sessionFactory the sessionFactory to set
	 */
	public static void setSessionFactory(SessionFactory sessionFactory) {
		TableCommon.sessionFactory = sessionFactory;
	}

	private static void openSession() {
		session = sessionFactory.openSession();
	}

	private static void closeSession() {
		session.close();
	}

	/**
	 * 角色表
	 *
	 * @return
	 */
	public static List<Role> getRoleTable() {
		openSession();
		@SuppressWarnings("unchecked")
		List<Role> roleList = session.createSQLQuery("SELECT * FROM T_ROLE").addEntity(Role.class)
		.setMaxResults(CommonConstants.MAX_COUNT).list();
		closeSession();
		return roleList;
	}

	/**
	 * 权限表
	 *
	 * @return
	 */
	public static List<Authority> getAuthorityTable() {
		openSession();
		@SuppressWarnings("unchecked")
		List<Authority> authorityList = session.createSQLQuery("SELECT * FROM T_AUTHORITY").addEntity(Authority.class)
		.setMaxResults(CommonConstants.MAX_COUNT).list();
		closeSession();
		return authorityList;
	}

	/**
	 * 菜单表
	 *
	 * @return
	 */
	public static List<Menu> getMenuTable() {
		openSession();
		@SuppressWarnings("unchecked")
		List<Menu> authorityList = session.createSQLQuery("SELECT * FROM T_Menu ORDER BY MENU_GROUP_ID,MENU_ID").addEntity(Menu.class)
		.setMaxResults(CommonConstants.MAX_COUNT).list();
		closeSession();
		return authorityList;
	}
}
