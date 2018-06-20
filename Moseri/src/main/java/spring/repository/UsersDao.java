package spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.UsersDto;

@Repository
public interface UsersDao {
	public UsersDto serch(String email);
	public List<UsersDto> list();
	
}
