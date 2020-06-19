package free.com.service.system;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.com.bean.Opinion;
import free.com.bean.system.Sys0302From;
import free.com.bean.system.Sys0302ResultDto;
import free.com.bean.system.Sys0302SearchDto;
import free.com.dao.system.Sys0302Dao;

@Service
public class Sys0302Service {

	@Autowired
	private Sys0302Dao dao;

	public void registered(Opinion opinion) {
		dao.registered(opinion);
	}

	public List<Sys0302From> getResult(Sys0302SearchDto searchDto) {
		List<Sys0302ResultDto> result = dao.getResult(searchDto);
		List<Sys0302From> fromList = new ArrayList<Sys0302From>();
		for(Sys0302ResultDto dto : result) {
			Sys0302From from = new Sys0302From();
			BeanUtils.copyProperties(dto, from);
			fromList.add(from);
		}
		return fromList;
	}

	public void delete(Opinion opinion) {
		dao.delete(opinion);
	}
	public void update(Opinion opinion) {
		dao.update(opinion);
	}
}
