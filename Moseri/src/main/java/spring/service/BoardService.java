package spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import spring.bean.BoardDto;
import spring.repository.BoardDao;

public interface BoardService {
		
	
	
	public void deleteFile(String fullName);
	public List<String> getAttach(int bno);
	public void create(BoardDto boardDto) throws Exception;
	public BoardDto read(int bno) throws Exception;
	public void update(BoardDto boardDto) throws Exception;
	public void delete(int bno) throws Exception;
	public List<BoardDto> listall(int start ,int end) throws Exception;
	public void increaseView(int bno , HttpSession session) throws Exception;
	public int countArticle() throws Exception;
}
