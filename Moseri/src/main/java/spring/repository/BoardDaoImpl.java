package spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.BoardDto;

@Repository("boardDaos")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void deleteFile(String fullName) {
		sqlsession.delete("deleteFile",fullName);
		
	}
	@Override
	public List<String> getAttach(int bno) {
		
		return sqlsession.selectList("getAttach" , bno);
	}
	@Override
	public void addAttach(String fullName) {
		sqlsession.insert("addAttach",fullName);
		
	}
	@Override
	public void updateAttach(String fullName, int bno) {
		Map<String, Object> map = new HashMap<>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		sqlsession.insert("updateAttach",map);
	}
	//게시물 작성
	@Override
	public void create(BoardDto boardDto) throws Exception {
		
		sqlsession.insert("boardwrite" , boardDto);
		
	}
	@Override
	public void update(BoardDto boardDto) throws Exception {
		sqlsession.update("update" , boardDto);
		
	}
	@Override
	public void delete(int bno) throws Exception {
		sqlsession.delete("delete",bno);
		
	}
	@Override
	public void increateViewcnt(int bno) throws Exception {
		sqlsession.update("view", bno);
	}
	//레코드 갯수 계산
	@Override
	public int countArticle(
			) throws Exception {
		
		return sqlsession.selectOne("countArticle");
	}

	@Override
	public List<BoardDto> listall(int start , int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlsession.selectList("listall" ,map);
	}

	@Override
	public BoardDto read(int bno) {
		
		return sqlsession.selectOne("readview",bno);
	}

	
}
