package free.com.service.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.com.bean.Opinion;
import free.com.dao.system.Sys0302Dao;

@Service
public class Sys0302Service {

	@Autowired
	private Sys0302Dao dao;

	public void registered(Opinion opinion) {
		dao.registered(opinion);
	}

}
