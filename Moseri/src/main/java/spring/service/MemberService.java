package spring.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import spring.bean.MemberDto;
@Service
public interface MemberService {

	void register(HttpServletRequest request, MemberDto memberDto)throws Exception;
	void register_gosu(HttpServletRequest request, MemberDto memberDto)throws Exception;
	boolean login(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto)throws Exception;
	
	int emailcheck(String userid);
	int nickcheck(String usernick);
	//소분류의 번호를 가져온다
	int getBno(int no);
	
	void member_update(HttpServletRequest request,HttpServletResponse response,HttpSession session, MemberDto memberDto)throws Exception;

		
}
