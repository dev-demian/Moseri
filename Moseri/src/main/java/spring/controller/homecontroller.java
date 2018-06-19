package spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.MemberDto;
import spring.service.MemberService;
import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.FileDto;
import spring.service.CategoryService;
import spring.service.FileService;

@Controller
public class homecontroller {
	
	private static final Logger logger = LoggerFactory.getLogger(homecontroller.class);

	@Autowired
	private MemberService memberservice;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FileService fileService;
	
	

	// home
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	//회원가입 타입(일반, 고수)
	@RequestMapping("/before_regi")
	public String regi() {
		return "before_regi";
	}
	
	
	// 회원가입(get)
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	// 회원가입_gosu(get)
		@RequestMapping("/register_gosu")
		public String register_gosu(HttpServletRequest request) {
			request.setAttribute("list",categoryService.getList());
				return "register_gosu";
	}
			
			
		

	// 회원가입(post)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request, @ModelAttribute MemberDto memberDto) throws Exception {

		memberservice.register(request, memberDto);
		
		
		return "redirect:/home";
	}
	
	// 회원가입_gosu(post)
		@RequestMapping(value = "/register_gosu", method = RequestMethod.POST)
		public String register_gosu(HttpServletRequest request, @ModelAttribute MemberDto memberDto) throws Exception {

			memberservice.register_gosu(request, memberDto);

			return "redirect:/home";
		}
	
	
	
	// 로그인(get)
	@RequestMapping("/login")
	public String login() {
		
		
		return "login";
	}

	// 로그인(post)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response,HttpSession session,Model model, @ModelAttribute MemberDto memberDto)
			throws Exception {

		boolean result = memberservice.login(request, response, memberDto);
		
		if (result) {
			MemberDto db_data = new MemberDto();
			db_data= (MemberDto)request.getAttribute("db_data");
			 
			session.setAttribute("email",db_data.getEmail());
			session.setAttribute("granted",db_data.getGranted());
			session.setAttribute("login", "success");
			session.setMaxInactiveInterval(60*60);	
			
			return "redirect:/home";
		} else {
	
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "login");
			return "redirect:/login";
		}

	}
	
	// 로그인(get)
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpSession session) {
		
		//HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null을 반환
		if(request.getSession(false) != null) {
			session.invalidate();
		}
		return "redirect:/home";
	}

	
	
	@RequestMapping("/midList")
	@ResponseBody
	public List<CategoryMidDto> midList(@RequestParam(value="no") int no){
		return categoryService.midList(no);
	}
	@RequestMapping("/botList")
	@ResponseBody
	public List<CategoryBotDto> botList(@RequestParam(value="no") int no){
		return categoryService.botList(no);
	}
		
	//마이페이지 포워딩페이지

	@RequestMapping("/mypage")
	public String mypage(HttpSession session) {
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
	
	//마이페이지 - 고수요청

	@RequestMapping("/approval")
	public String approval() {
		return "approval";
	}

	
	@RequestMapping(value = "/approval" , method = RequestMethod.POST)
	public String approval(MultipartHttpServletRequest mRequest ,HttpServletRequest request, HttpServletResponse response,HttpSession session,Model model, @ModelAttribute FileDto fileDto)throws IllegalStateException, IOException{
		
		String email = (String)session.getAttribute("email");
		String text = mRequest.getParameter("text");
		System.out.println(email+"------"+text);
		
		//경로 설정
		File dir = new File(request.getSession().getServletContext().getRealPath("/res/approval"));
//		System.out.println(dir.getAbsolutePath());
		List<MultipartFile> list = mRequest.getFiles("uploadFile");
		
		String rname = null;
		for(MultipartFile file : list) {
	         //1개의 파일에 대한 작업을 수행
			 //해당 파일이 이미지파일인지 확인하는 작업 넣어야함
	         rname = System.currentTimeMillis()+"-"+UUID.randomUUID();
	         String fname = file.getOriginalFilename();	
	         long fsize = file.getSize();
	         String ftype = file.getContentType();
	         File target = new File(dir, rname+"."+ftype.substring(6));
	         rname+="."+ftype.substring(6);
	         
	         if(ftype.contains("image")) {
	        	 file.transferTo(target);
	         }else {
	        	 
	        	 System.out.println("이미지를 넣으셔아 합니다");
	         }

	    
	    System.out.println(rname+""+fname+""+fsize+""+ftype);
//	   예시 1529396948328-9401dd89-8d53-445a-9d6b-16b0fdac5d17.pngKakaoTalk_20180511_002632145.png610369image/png
		}
		
		//디비에 저장하기 email, rname, text
		
		fileService.registe_file(email, rname, text, fileDto);
		
		return "home";
	}

}
