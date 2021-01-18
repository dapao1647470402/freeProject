package free.com.service.system;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.com.bean.system.Sys0501From;
import free.com.bean.system.Sys0501ResultDto;
import free.com.bean.system.Sys0501SearchDto;
import free.com.dao.system.Sys0501Dao;

@Service
public class Sys0501Service {

	@Autowired
	private Sys0501Dao dao;

	public List<Sys0501From> init() {
		List<Sys0501From> fromList = new ArrayList<Sys0501From>();
		List<Sys0501ResultDto> resultList = dao.init();
		setResultData(resultList, fromList);
		return fromList;
	}

	private void setResultData(List<Sys0501ResultDto> resultList, List<Sys0501From> fromList) {
		Sys0501From from = new Sys0501From();
		Iterator<Sys0501ResultDto> valIterator = resultList.iterator();
		Set<Object> setFlag = new HashSet<Object>();
		int setFlagSize = setFlag.size();
		while (valIterator.hasNext()) {
			Sys0501ResultDto dto = valIterator.next();
			setFlag.add(dto.getUserId());
			if (setFlagSize != setFlag.size()) {
				if (dataRepeatCheck(dto.getUserId(), resultList)) {
					from.setMultipleData(dataRepeatSet(dto.getUserId(), resultList));
				} else {
					from.setMultipleData(dataRepeatSet(dto.getUserId(), resultList));
				}
				from.setUserId(dto.getUserId());
				from.setUserAccount(dto.getUserAccount());
				from.setUserAccountId(dto.getUserAccountId());
				from.setAuthorityName(dto.getAuthorityName());
				from.setMenuGroupName(dto.getMenuGroupName());
				from.setRoleName(dto.getRoleName());
				from.setUserInsertDate(dto.getUserInsertDate());
				fromList.add(from);
				setFlagSize = setFlag.size();
				from = new Sys0501From();
			}
		}

	}

	private List<Sys0501ResultDto> dataRepeatSet(String userId, List<Sys0501ResultDto> resultList) {
		List<Sys0501ResultDto> multipleData = new ArrayList<Sys0501ResultDto>();
		Iterator<Sys0501ResultDto> valIterator = resultList.iterator();
		while (valIterator.hasNext()) {
			Sys0501ResultDto dto = valIterator.next();
			if (StringUtils.equals(userId, dto.getUserId())) {
				multipleData.add(dto);
			}
		}
		return multipleData;
	}

	private boolean dataRepeatCheck(String userId, List<Sys0501ResultDto> resultList) {
		Iterator<Sys0501ResultDto> valIterator = resultList.iterator();
		int flag = 0;
		while (valIterator.hasNext()) {
			Sys0501ResultDto dto = valIterator.next();
			if (StringUtils.equals(userId, dto.getUserId())) {
				flag++;
			}
		}
		return flag > 1;
	}

	public List<Sys0501From> search(Sys0501SearchDto searchDto){
		List<Sys0501ResultDto> resultList = dao.search(searchDto);
		List<Sys0501From> fromList = new ArrayList<Sys0501From>();
		setResultData(resultList, fromList);
		return fromList;
	}

}
