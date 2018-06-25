package spring.service;

import java.util.List;

import spring.bean.ChatDto;

public interface ChatService {
	void chatWrite(ChatDto chatDto);
	List<ChatDto> getChat(int matchno);
	List<ChatDto> getChatList(int matchno, int no);
//	List<ChatDto> getChatListByRecent(String fromID, String toID, int no);
	public void chatDelete(int matching_no);
}
