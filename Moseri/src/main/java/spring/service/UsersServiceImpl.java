package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.UsersDto;
import spring.repository.UsersDao;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public UsersDto serch(String email) {
		return usersDao.serch(email);
	}

	@Override
	public List<UsersDto> list() {
		return usersDao.list();
	}

}
