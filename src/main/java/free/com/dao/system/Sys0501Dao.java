package free.com.dao.system;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import free.com.bean.system.Sys0501ResultDto;
import free.com.common.SqlCommon;

@Repository
public class Sys0501Dao {

	public List<Sys0501ResultDto> init() {
		SQLQuery sql = SqlCommon.sqlSession
				.createSQLQuery("SELECT " + "t1.USER_ID AS userId " + ",t1.ACCOUNT AS userAccount "
						+ ",t2.ROLE_NAME AS roleName"
						+ ",t3.AUTHORITY_NAME AS authorityName" + ",t1.INS_DATE AS userInsertDate "
						+ ",t4.MENU_GROUP_NAME AS menuGroupName " + ",t4.MENU_NAME AS menuName " + " FROM "
						+ "	t_user t1 " + "INNER JOIN t_role t2 " + "ON t1.USER_ROLE = t2.ROLE_ID "
						+ "INNER JOIN t_authority t3 " + "ON t1.USER_AUTHORITY = t3.AUTHORITY_ID "
						+ "LEFT JOIN t_menu t4 " + "ON t1.MENU_GROUP_AUTHORITY = t4.MENU_GROUP_AUTHORITY "
						+ "AND t1.MENU_SUB_MAX_AUTHORITY >= t4.MENU_AUTHORITY");
		sql.setResultTransformer(Transformers.aliasToBean(Sys0501ResultDto.class));
		@SuppressWarnings("unchecked")
		List<Sys0501ResultDto> list = sql.list();
		return list;
	}

}
