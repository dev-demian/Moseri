package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import spring.bean.ReplyDto;
import spring.service.ReplyService;

@RestController
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="replyinsert")
	public void replyinsert( ReplyDto replyDto , HttpSession session ) {
		//댓글 작성자 아이디
		
			String nickname = (String) session.getAttribute("nickname");
		replyDto.setReplyer(nickname);
		//댓글이 테이블에 저장됨
		replyService.create(replyDto);
		
		//jsp 페이지로 가거나 데이터를 리턴하지 않음
	};
	@RequestMapping("list")
	public ModelAndView list(int bno, ModelAndView mav) {
		List<ReplyDto> list=replyService.list(bno); //댓글 목록
		mav.setViewName("board/reply_list"); //뷰의 이름
		mav.addObject("list", list); //뷰에 전달할 데이터 저장
		return mav; //뷰로 이동
	}
	
}
