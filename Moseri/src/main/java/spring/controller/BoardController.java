package spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.bean.BoardDto;
import spring.service.BoardService;
import spring.service.Pager;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
//			@RequestMapping("boardhome")
//			public String boardhome(HttpServletRequest request, @ModelAttribute BoardDto boardDto,
//					@RequestParam(defaultValue="1") int curPage
//					) throws Exception {
//				//레코드 갯수 계산
//				int count = boardService.countArticle();
//				//페이지 관련 설정 
//				Pager pager = new Pager(count, curPage);
//				int start = pager.getPageBegin();
//				int end = pager.getPageEnd();
//			
//			List<BoardDto>list = boardService.listall(start ,end);
//			
//			HashMap<String, Object> map = new HashMap<>();	
//			map.put("list", list);
//			map.put("pager", pager);
//			request.setAttribute("map", map);
//				return "/board/boardhome";
//			}
			@RequestMapping("boardhome") //세부적인 url pattern
			public ModelAndView list(
		@RequestParam(defaultValue="1") int curPage) 
								throws Exception{
				//레코드 갯수 계산
				int count=
						boardService.countArticle();
				//페이지 관련 설정
				Pager pager=new Pager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				
				List<BoardDto> list=
		boardService.listall(start,end); //게시물 목록
				ModelAndView mav=new ModelAndView();
				HashMap<String,Object> map=new HashMap<>();
				map.put("list", list); //map에 자료 저장
				map.put("count", count);
				map.put("pager", pager); //페이지 네비게이션을 위한 변수
				mav.setViewName("board/boardhome"); //포워딩할 뷰의 이름
				mav.addObject("map", map); //ModelAndView에 map을 저장
				return mav; // board/list.jsp로 이동
			}
			
			
			
			
			
			@RequestMapping("boardwrite")
			public String boardwrite() {
				
				return "board/boardwrite";
				
			}
			
			@RequestMapping(value="boardwrite" , method = RequestMethod.POST)
			public String insert(@ModelAttribute BoardDto boardDto , HttpSession session,HttpServletRequest request)throws Exception {
				boardDto.setTitle(request.getParameter("title"));
				boardDto.setWriter(request.getParameter("writer"));
				boardDto.setContent(request.getParameter("content"));
				boardService.create(boardDto);
				return "redirect:boardhome";
			}
			
			@RequestMapping("view")
			public String view(HttpServletRequest request , HttpSession session ,@ModelAttribute BoardDto boardDto) throws Exception {
					//조회수 증가
				int bno = Integer.parseInt(request.getParameter("bno"));
				boardService.increaseView(bno, session);
				// 상세 보기
				boardDto = boardService.read(bno);
				request.setAttribute("bdto"	, boardDto);
				return "board/view";
			}
			
			@RequestMapping("getAttach/{bno}")
			@ResponseBody
			//첨부파일 목록 리턴
			//ArrayList를  json 배열로 변환하여 리턴
			public List<String> getAttach(@PathVariable int bno){
				
				return boardService.getAttach(bno);
			}
			
			@RequestMapping("update")
			public String update(BoardDto boardDto) throws Exception{
				if(boardDto != null) {
					boardService.update(boardDto);
				}
				//상세 화면으로 돌아감
				return "redirect:/view?bno="+boardDto.getBno();
				
			}
			
			@RequestMapping("delete")
		public String delete(int bno) throws Exception{
				boardService.delete(bno);
				return "redirect:/boardhome";
				
			}
}
