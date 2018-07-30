package free.com.common;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DaoCommon {

	public static Session sqlSession;

	private SessionFactory sessionFactory;

	private Logger log = LoggerFactory.getLogger(DaoCommon.class);

	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @param sessionFactory
	 *            the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unused")
	private void joinDbBefore() {
		log.info("******Current Action:" + "Open SessionFactory******");
		sqlSession = sessionFactory.openSession();
		log.info("******Current SqlSession Status:" + sqlSession + "******");

	}

	@SuppressWarnings("unused")
	private void joinDbAfter() {
		log.info("******Current Action:" + "Close SqlSession******");
		sqlSession.close();
		log.info("******Current SqlSession Status:" + sqlSession + "******");
	}
}
