package free.com.dao.system;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import free.com.bean.Opinion;
import free.com.bean.system.Sys0302ResultDto;
import free.com.bean.system.Sys0302SearchDto;
import free.com.common.CommonUtil;
import free.com.common.SqlCommon;
import free.com.utils.StringUtils;

@Repository
public class Sys0302Dao {



	public void registered(Opinion opinion){

		SqlCommon.sqlSession.save(opinion);
	}

	public List<Sys0302ResultDto> getResult(Sys0302SearchDto searchDto){
		String sqlStr = "SELECT "
				+ "t1.ID AS dataId"
				+ ",t1.OPINION_CONTENT AS opinionText "
				+ ",t1.INS_DATE AS insDate "
				+ ",t1.INS_USER_ID AS insUserId "
				+ ",t2.ACCOUNT_NAME AS insUserName "
				+ ",t1.UPD_DATE AS updDate"
				+ ",t3.ACCOUNT_NAME AS updUserName"
				+ " FROM "
				+ " T_OPINION t1 "
				+ " LEFT JOIN T_USER t2 "
				+ " ON t2.USER_ID = t1.INS_USER_ID "
				+ " LEFT JOIN T_USER t3 "
				+ " ON t3.USER_ID = t1.UPD_USER_ID ";
		if (!StringUtils.isEmpty(searchDto.getDataId())) {
			sqlStr = sqlStr + "WHERE t1.ID=" + searchDto.getDataId();
		}
		SQLQuery sql = SqlCommon.sqlSession.createSQLQuery(sqlStr);
		sql.setResultTransformer(Transformers.aliasToBean(Sys0302ResultDto.class));
		@SuppressWarnings("unchecked")
		List<Sys0302ResultDto> list = sql.list();

		return list;
	}

	public void delete(Opinion opinion){
		SqlCommon.sqlSession.delete(opinion);
	}

	public void update(Opinion opinion){
		String sqlStr = "UPDATE t_opinion"
				+ " SET "
				+ " OPINION_CONTENT = ?,"
				+ " UPD_DATE = now(),"
				+ " UPD_USER_ID = ?"
				+ " WHERE ID = ?";
		Query sql = SqlCommon.sqlSession.createQuery(sqlStr);
		sql.setParameter(0, opinion.getOpinionContent());
		sql.setParameter(1, CommonUtil.getUserInfo().getUserId());
		sql.setParameter(2, opinion.getId());
		sql.executeUpdate();
	}
}
