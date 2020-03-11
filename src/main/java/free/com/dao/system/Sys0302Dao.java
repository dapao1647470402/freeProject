package free.com.dao.system;

import org.springframework.stereotype.Repository;

import free.com.bean.Opinion;
import free.com.common.SqlCommon;

@Repository
public class Sys0302Dao {



	public void registered(Opinion opinion){

		SqlCommon.sqlSession.save(opinion);
	}

}
