package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.RequestDto;
import spring.repository.RequestDao;

@Service
public class RequestServiceImpl implements RequestService {
	@Autowired
	private RequestDao requestDao;

	@Override
	public void write(RequestDto requestDto) {
		requestDao.write(requestDto);
	}

	@Override
	public RequestDto requestGet(int request_no) {
		return requestDao.requestGet(request_no);
	}
	
	@Override
	public int serchNo(String email) {
		return requestDao.serchNo(email);
	}
	@Override
	public void requestDelete(int request_no) {
		requestDao.requestDelete(request_no);
	}
	
}
