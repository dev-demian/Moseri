package spring.repository;

import org.springframework.stereotype.Repository;

import spring.bean.RequestDto;

@Repository
public interface RequestDao {
	public void write(RequestDto requestDto);
	public RequestDto requestGet(int request_no);
	public int serchNo(String email);
	
}
