package spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.UsersDto;

@Repository("usersDao")
public class UsersDaoImpl implements UsersDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public UsersDto serch(String email) {
		return sqlSession.selectOne("serch", email);
	}

	@Override
	public List<UsersDto> list() {
		return sqlSession.selectList("list");
	}
	
}
