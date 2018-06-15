package spring.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import spring.bean.MemberDto;
@Service
public interface MemberService {

	void register(HttpServletRequest request, MemberDto memberDto)throws Exception;
	void register_gosu(HttpServletRequest request, MemberDto memberDto)throws Exception;

	boolean login(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto)throws Exception;

	
	
}
