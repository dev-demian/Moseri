package spring.service;

import spring.bean.RequestDto;

public interface RequestService {
	public void write(RequestDto requestDto);
	public RequestDto requestGet(int request_no);
	public int serchNo(String email);
	
}
