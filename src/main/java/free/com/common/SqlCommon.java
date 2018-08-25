package free.com.common;

import java.util.List;

import javax.annotation.Resource;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import free.com.utils.CommonConstants;

@Aspect
@Component
public class SqlCommon {

	public static Session sqlSession;

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

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

	private Logger log = LoggerFactory.getLogger(DaoCommon.class);

	public SqlCommon() {
	}

	@Pointcut("execution(* free.com.dao.*.*.*(..))")
	private void point() {

	}

	@Before("point()")
	private void joinDbBefor() {
		log.info("******Current Action:" + "Open SessionFactory******");
		sqlSession = sessionFactory.openSession();
		log.info("******Current SqlSession Status:" + sqlSession + "******");
	}

	@After("point()")
	private void joinDbAfter() {
		log.info("******Current Action:" + "Close SqlSession******");
		sqlSession.close();
		log.info("******Current SqlSession Status:" + sqlSession + "******");
	}

	public <T> List<T> query(String hql, T t, Object... param) {
		SQLQuery sql = sqlSession.createSQLQuery(hql);
		sql.addEntity(t.getClass());
		sql.setMaxResults(CommonConstants.MAX_COUNT);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				String typeName = param.getClass().getTypeName();

			}
		}
		List<T> list = sql.list();
		return list;
	}
}
