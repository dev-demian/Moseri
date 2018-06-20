package spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.RequestDto;

@Repository("requestDao")
public class RequestDaoImpl implements RequestDao{

//	Mapper를 부를 수 있는 도구
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(RequestDto requestDto) {
		sqlSession.insert("write", requestDto);
	}

	@Override
	public RequestDto requestGet(int request_no) {
		return sqlSession.selectOne("requestGet", request_no);
	}
	
	@Override
	public int serchNo(String email) {
		return sqlSession.selectOne("serchNo", email);
	}
	
}




