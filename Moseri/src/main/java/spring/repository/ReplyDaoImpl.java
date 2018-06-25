package spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.ReplyDto;

@Repository("replyDao")
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<ReplyDto> list(int bno) {
		return sqlsession.selectList("replylist",bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void create(ReplyDto replyDto) {
		sqlsession.insert("replyinsert",replyDto);
	}

	
}
