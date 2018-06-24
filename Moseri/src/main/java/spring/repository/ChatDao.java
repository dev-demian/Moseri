package spring.repository;

import java.util.List;

import spring.bean.ChatDto;

public interface ChatDao {
	void chatWrite(ChatDto chatDto);
	List<ChatDto> getChat(int matchno);
	List<ChatDto> getChatList(int matchno, int no);
	

}
