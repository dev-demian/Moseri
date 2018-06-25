package spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.ChatDto;

@Repository("chatDao")
public class ChatDaoImpl implements ChatDao{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void chatWrite(ChatDto chatDto) {
		sqlSession.insert("chatWrite",chatDto);
	}
	@Override
	public List<ChatDto> getChat(int matchNo) {
		return sqlSession.selectList("getChat",matchNo);
	}
	@Override
	public List<ChatDto> getChatList(int matchNo, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("matchNo", matchNo);
		map.put("no", no);
		return sqlSession.selectList("getChatList",map);
	}
//	
//	@Override
//	public List<ChatDto> getChatListByRecent(String fromID, String toID, int no) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("fromID", fromID);
//		map.put("toID", toID);
//		map.put("no", no);
//		return sqlSession.selectList("getChatListByRecent",map);
//	}
	@Override
	public void chatDelete(int matching_no) {
		sqlSession.delete("chatDelete", matching_no);
	}
}
