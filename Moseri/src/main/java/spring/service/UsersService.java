package spring.service;

import java.util.List;

import spring.bean.UsersDto;

public interface UsersService {
	public UsersDto serch(String email);
	public List<UsersDto> list();
	
}
