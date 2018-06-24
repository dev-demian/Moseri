package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.ChatDto;
import spring.repository.ChatDao;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	ChatDao chatDao;
	
	@Override
	public void chatWrite(ChatDto chatDto) {
		chatDao.chatWrite(chatDto);
	}
	@Override
	public List<ChatDto> getChat(int matchno) {
		return chatDao.getChat(matchno);
	}
	@Override
		public List<ChatDto> getChatList(int matchno, int no) {
			return chatDao.getChatList(matchno, no);
		}	
//	@Override
//	public List<ChatDto> getChatListByRecent(String fromID, String toID, int no) {
//		return chatDao.getChatListByRecent(fromID, toID, no);
//	}
}
