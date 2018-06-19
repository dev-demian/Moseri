package spring.repository;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.bean.MemberDto;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
//	@Autowired
//	private JdbcTemplate JdbcTemplate;
	
	@Override
	public void register(MemberDto memberDto) {
		
		sqlSession.insert("register",memberDto);
		
	}
	@Override
	public void register_gosu(MemberDto memberDto) {
		
		sqlSession.insert("register_gosu",memberDto);
		
	}
	
	@Override
	public MemberDto login(String email) {
			
		return sqlSession.selectOne("login",email);
			
	}
	@Override
	public MemberDto get(String email) {
		return sqlSession.selectOne("get",email);
	}
	
	
	

	


	
}
