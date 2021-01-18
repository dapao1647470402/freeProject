package free.com.dao.system;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import free.com.bean.system.Sys0501ResultDto;
import free.com.bean.system.Sys0501SearchDto;
import free.com.common.SqlCommon;

@Repository
public class Sys0501Dao {

	public List<Sys0501ResultDto> init() {
		SQLQuery sql = SqlCommon.sqlSession
				.createSQLQuery("SELECT "
						+ "t1.USER_ID AS userId "
						+ ",t1.ACCOUNT_NAME AS userAccount "
						+ ",t1.ACCOUNT_ID AS userAccountId "
						+ ",t2.ROLE_NAME AS roleName"
						+ ",t3.AUTHORITY_NAME AS authorityName"
						+ ",t1.INS_DATE AS userInsertDate "
						+ ",t4.MENU_GROUP_NAME AS menuGroupName "
						+ ",t4.MENU_NAME AS menuName "
						+ " FROM "
						+ " t_user t1 "
						+ "INNER JOIN t_role t2 "
						+ "ON t1.USER_ROLE = t2.ROLE_ID "
						+ "INNER JOIN t_authority t3 "
						+ "ON t1.USER_AUTHORITY = t3.AUTHORITY_ID "
						+ "LEFT JOIN t_menu t4 "
						+ "ON t1.MENU_GROUP_AUTHORITY >= t4.MENU_GROUP_AUTHORITY "
						+ "AND t1.MENU_SUB_MAX_AUTHORITY >= t4.MENU_AUTHORITY ");
		sql.setResultTransformer(Transformers.aliasToBean(Sys0501ResultDto.class));
		@SuppressWarnings("unchecked")
		List<Sys0501ResultDto> list = sql.list();
		return list;
	}

	public List<Sys0501ResultDto> search(Sys0501SearchDto searchDto){
		StringBuilder hql = new StringBuilder("SELECT "
				+ "t1.USER_ID AS userId "
				+ ",t1.ACCOUNT_NAME AS userAccount "
				+ ",t1.ACCOUNT_ID AS userAccountId "
				+ ",t2.ROLE_NAME AS roleName"
				+ ",t3.AUTHORITY_NAME AS authorityName"
				+ ",t1.INS_DATE AS userInsertDate "
				+ ",t4.MENU_GROUP_ID AS menuGroupId "
				+ ",t4.MENU_GROUP_NAME AS menuGroupName "
				+ ",t4.MENU_ID AS menuId "
				+ ",t4.MENU_NAME AS menuName "
				+ " FROM "
				+ " t_user t1 "
				+ "INNER JOIN t_role t2 "
				+ "ON t1.USER_ROLE = t2.ROLE_ID "
				+ "INNER JOIN t_authority t3 "
				+ "ON t1.USER_AUTHORITY = t3.AUTHORITY_ID "
				+ "LEFT JOIN t_menu t4 "
				+ "ON t1.MENU_GROUP_AUTHORITY >= t4.MENU_GROUP_AUTHORITY "
				+ "AND t1.MENU_SUB_MAX_AUTHORITY >= t4.MENU_AUTHORITY "
				+ "WHERE 1 = 1 ");
		if (StringUtils.isNotEmpty(searchDto.getAccountName())) {
			hql.append("AND t1.ACCOUNT_NAME LIKE CONCAT(:accountName, '%') ");
		}
		if (searchDto.getRegisterTime() != null) {
			hql.append("AND t1.INS_DATE <= :insDate ");
		}
		if (StringUtils.isNotEmpty(searchDto.getRoleId())) {
			hql.append("AND t2.ROLE_ID = :roleId ");
		}
		if (searchDto.getAuthorityId() != null && !searchDto.getAuthorityId().isEmpty()) {
			hql.append("AND t3.AUTHORITY_ID IN (:authorityId) ");
		}
		// 用户唯一ID
		if (searchDto.getUserId() != null && !searchDto.getUserId().isEmpty()) {
			hql.append("AND t1.USER_ID IN (:userId) ");
		}

		// Order By
		hql.append(" ORDER BY t4.MENU_GROUP_ID,t4.MENU_ID");
		SQLQuery sql = SqlCommon.sqlSession
				.createSQLQuery(hql.toString());
		if (StringUtils.isNotEmpty(searchDto.getAccountName())) {
			sql.setString("accountName", searchDto.getAccountName());
		}
		if (searchDto.getRegisterTime() != null) {
			sql.setDate("insDate", searchDto.getRegisterTime());
		}
		if (StringUtils.isNotEmpty(searchDto.getRoleId())) {
			sql.setInteger("roleId", Integer.parseInt(searchDto.getRoleId()));
		}
		if (searchDto.getUserId() != null && !searchDto.getUserId().isEmpty()) {
			sql.setString("userId", searchDto.getUserId());
		}
		if (searchDto.getAuthorityId() != null && !searchDto.getAuthorityId().isEmpty()) {
			hql.append("AND t3.AUTHORITY_ID IN (:authorityId) ");
			sql.setParameterList("authorityId", searchDto.getAuthorityId());
		}
		sql.setResultTransformer(Transformers.aliasToBean(Sys0501ResultDto.class));
		@SuppressWarnings("unchecked")
		List<Sys0501ResultDto> list = sql.list();
		return list;
	}

}
