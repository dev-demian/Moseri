package spring.repository;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import spring.bean.BoardDto;
@Repository
public interface BoardDao {
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int bno); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	//첨부파일 수정
	public void updateAttach(String fullName, int bno);
	public void create(BoardDto boardDto) throws Exception; //글쓰기 
	public void update(BoardDto boardDto) throws Exception; //글수정
	public void delete(int bno) throws Exception; //글삭제
	public List<BoardDto> listall(int start , int end) throws Exception;
	public void increateViewcnt(int bno) throws Exception;
	public int countArticle() throws Exception;
	public BoardDto read(int bno);
}
