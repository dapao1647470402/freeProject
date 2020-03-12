package free.com.dao.system;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import free.com.bean.Opinion;
import free.com.bean.system.Sys0302ResultDto;
import free.com.bean.system.Sys0302SearchDto;
import free.com.common.SqlCommon;

@Repository
public class Sys0302Dao {



	public void registered(Opinion opinion){

		SqlCommon.sqlSession.save(opinion);
	}

	public List<Sys0302ResultDto> getResult(Sys0302SearchDto searchDto){
		SQLQuery sql = SqlCommon.sqlSession
				.createSQLQuery("SELECT "
						+ "t1.OPINION_CONTENT AS opinionText "
						+ ",t1.INS_DATE AS insDate "
						+ ",t2.ACCOUNT_NAME AS insUserName "
						+ ",t1.UPD_DATE AS updDate"
						+ ",t3.ACCOUNT_NAME AS updUserName"
						+ " FROM "
						+ " T_OPINION t1 "
						+ " LEFT JOIN T_USER t2 "
						+ " ON t2.USER_ID = t1.INS_USER_ID "
						+ " LEFT JOIN T_USER t3 "
						+ " ON t3.USER_ID = t1.UPD_USER_ID ");
		sql.setResultTransformer(Transformers.aliasToBean(Sys0302ResultDto.class));
		@SuppressWarnings("unchecked")
		List<Sys0302ResultDto> list = sql.list();

		return list;
	}
}
