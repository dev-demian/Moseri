package spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.bean.BoardDto;
import spring.repository.BoardDao;
@Service("boardSerice")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	
	@Override
	public void deleteFile(String fullName) {
			boardDao.deleteFile(fullName);
	}

	@Override
	public List<String> getAttach(int bno) {
		
		return boardDao.getAttach(bno);
	}
		// 1 글쓰기 - 게시물 번호 생성
		// 2 첨부파일 등록-게시물 번호 사용
	@Transactional
	@Override
	public void create(BoardDto boardDto) throws Exception {
		//attach 테이블에 레코드 추가
		boardDao.create(boardDto);
		
		String[] files= boardDto.getFiles();
		if(files==null) return;
		for(String name :files) {
			boardDao.addAttach(name);
		}
		//board 테이블에 레코드 추가
		
	}

	@Override
	public BoardDto read(int bno) throws Exception {
		BoardDto boardDto = new BoardDto();
		boardDto = boardDao.read(bno);
		return boardDto;
	}
	
	@Transactional //트랜잭션 처리 method
	@Override
	public void update(BoardDto boardDto) throws Exception {
			boardDao.update(boardDto);
			//attach 테이블 수정
			String[] files =boardDto.getFiles();
			if(files == null) return;
					for(String name :files) {
						boardDao.updateAttach(name, boardDto.getBno());
					}
	}
	
	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
		
		
	}

	@Override
	public List<BoardDto> listall(int start , int end) throws Exception {
		List<BoardDto> list = boardDao.listall(start ,end);
		return list;
	}

	@Override
	public void increaseView(int bno , HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null) {
			//최근에 조회수를 올린 시간
			update_time=
					(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) {
			//조회수 증가 처리
			boardDao.increateViewcnt(bno);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
		
	}

	@Override
	public int countArticle() throws Exception {
		
		return boardDao.countArticle();
	}

}
