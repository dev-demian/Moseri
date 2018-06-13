package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class homecontroller {

	@RequestMapping("/home")
	public String home() {
		return "home";
	}
		
	//마이페이지 포워딩페이지
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	//마이페이지 - 요청
	@RequestMapping("/request")
	public String request() {
		return "request";
	}
	
	//마이페이지 - 견적서
	@RequestMapping("/estimate")
	public String estimate() {
		return "estimate";
	}
	//마이페이지 - 견적서 - 견적서작성
	@RequestMapping("/estimate_write")
	public String estimate_write() {
		return "estimate_write";
	}
	//마이페이지 - 프로필
	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	//마이페이지 - 알림
	@RequestMapping("/notification")
	public String notification() {
		return "notification";
	}
	//마이페이지 - 개인정보
	@RequestMapping("/information")
	public String information() {
		return "information";
	}

}
