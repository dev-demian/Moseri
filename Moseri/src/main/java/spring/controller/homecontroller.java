package spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import spring.bean.ProfileDto;
import spring.bean.RequestDto;
import spring.bean.UsersDto;
import spring.service.MemberService;
import spring.service.ProfileService;
import spring.service.RequestService;
import spring.service.UsersService;
import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.EstimateDto;
import spring.bean.FileDto;
import spring.bean.MatchingDto;
import spring.service.CategoryService;
import spring.service.EstimateService;
import spring.service.FileService;
import spring.service.MatchingService;

@Controller
public class homecontroller {
	
	private static final Logger log = LoggerFactory.getLogger(homecontroller.class);

	@Autowired
	private MemberService memberservice;
	@Autowired
	UsersService usersService;
	@Autowired
	RequestService requestService;
	@Autowired
	MatchingService matchingService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FileService fileService;
	@Autowired
	private ProfileService profileService;
	@Autowired
	EstimateService estimateService;
	

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
	public String register(HttpServletRequest request, @ModelAttribute MemberDto memberDto,@ModelAttribute ProfileDto profileDto) throws Exception {

		memberservice.register(request, memberDto);
		profileService.register_profile(request, profileDto);
		
		return "redirect:/home";
	}
	
	// 회원가입_gosu(post)
		@RequestMapping(value = "/register_gosu", method = RequestMethod.POST)
		public String register_gosu(HttpServletRequest request, @ModelAttribute MemberDto memberDto,@ModelAttribute ProfileDto profileDto) throws Exception {

			memberservice.register_gosu(request, memberDto);
			profileService.register_profile(request, profileDto);
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

//	//마이페이지 - 요청
//
//	@RequestMapping("/request")
//	public String request() {
//		return "request";
//	}

//	//마이페이지 - 견적서
//
//	@RequestMapping("/estimate")
//	public String estimate() {
//		return "estimate";
//	}

	//마이페이지 - 견적서 - 견적서작성

//	@RequestMapping("/estimate_write")
//	public String estimate_write() {
//		return "estimate_write";
//	}

	//마이페이지 - 프로필

	@RequestMapping("/myprofile")
	public String profile() {
		return "myprofile";
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
	
	//////////////////////////////////////기태가 한거///////////////////////////////////////////
	
	
	//find페이지를 처음 들어가면 'top'리스트를 보여준다
		@RequestMapping("/find")
		public String test_find(HttpServletRequest request) {
			request.setAttribute("list",categoryService.getList());
			return "find";
		}
	
	
	
	//AJAX로 온데이터를 리스트화하여 'profile'리스트를 보낸다(소분류와 지역에 맞는 고수의 프로필리스트) 
		@RequestMapping("/profileList")
		@ResponseBody
		public List<ProfileDto> profileList(
				@RequestParam(value="bot") int bot,
				@RequestParam(value="addr") String addr
		){
			return profileService.profileList(bot,addr);
		}
		//profile페이지
		@RequestMapping("/profile")
		public String profile(
				HttpServletRequest request,
				@RequestParam(value="no") int no
		) {
			request.setAttribute("pro", profileService.getProfile(no));
//			request.setAttribute("c_bno", memberService.getBno(no));
			return "profile";
		}
	
/////////////////////////////////////////////////////////////////////////////////////////
		
		public void convert_mid(Model model, int no, HttpServletRequest request) {
			//쿼리수행 후에 mDto에 저장
			List<CategoryMidDto> mDto = categoryService.selectMid();
			//조건에 맞는 자료만 따로 저장할 list
			List<CategoryMidDto> midDto= new ArrayList<>();
			//저장된 mDto를 대분류에 해당하는 것만 추려서 midDto에 따로 저장 
			for(CategoryMidDto mdto : mDto) {
				if(no == mdto.getTopNo()) {
					midDto.add(mdto);
				}
			}
			//골라낸 중분류(midDto)만 담겨있음. 
			model.addAttribute("midDto",midDto);
//			
		}
		
		@RequestMapping(value="/category")
		public String category(Model model,  HttpServletRequest request, HttpSession session) {
//			app.setAttribute("start", "ture");
//			System.out.println(app.getAttribute("start"));
			
			session.setAttribute("login", "success"); /*임시로그인을위함*/
			session.setAttribute("email", "twosan2@naver.com"); /*일반 사용자 임시 로그인을 위함*/
			session.setAttribute("granted", 1); /*일반 사용자 임시 로그인을 위함*/
//			session.setAttribute("email", "gosu1@naver.com"); /*인증 고수 임시 로그인을 위함*/
//			session.setAttribute("granted", 3); /*인증 고수 임시 로그인을 위함*/
			
			//페이지 별로 no를 다르게 설정함
			//대분류 번호
			// 레슨 : 1, 생활서비스 : 2, 시공/수리 : 3,  IT/디자인 : 4,  건강/미용: 5,  행사 : 6
			int pagenum = 1;
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		
		@RequestMapping("/lesson")
		public String lesson(Model model,  HttpServletRequest request ) {
			
			int pagenum = 1;
			log.info("{}",pagenum);
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		@RequestMapping("/living")
		public String living(Model model,  HttpServletRequest request) {
			
			int pagenum = 2;
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
	//	
		@RequestMapping("/construction")
		public String construction(Model model,  HttpServletRequest request) {

			int pagenum =3;
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
	//	
		@RequestMapping("/it")
		public String it(Model model,  HttpServletRequest request ) {
			
			int pagenum = 4;
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		@RequestMapping("/health")
		public String health(Model model,  HttpServletRequest request ) {
			
			int pagenum = 5;
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		
		@RequestMapping("/event")
		public String event(Model model,  HttpServletRequest request ) {
			
			int pagenum = 6;
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		
		@RequestMapping("/category_bot")
		public String category_bot(Model model,  HttpServletRequest request ) {
////			//중분류의 no를 불러옴
			log.info("{}",request.getParameter("midNo"));
			int no = Integer.parseInt(request.getParameter("midNo"));
			//전체 소분류를 불러와서 리스트에 저장
			List<CategoryBotDto> bDto = categoryService.selectBot();
			//조건에 맞게 찾은 소분류를 저장할 리스트
			List<CategoryBotDto> botDto= new ArrayList<>();
			//중분류 no에 맞는 것만 골라서 새로 저장
			for(CategoryBotDto bdto : bDto) {
				if(no == bdto.getMidNo()) {
					botDto.add(bdto);
				}
			}
			//골라낸 중분류(midDto)만 담겨있음. 
			model.addAttribute("botDto",botDto);
			
			return "category_bot";
		}
		
		@RequestMapping("/writeRequest")
		public String writeEstimate(HttpSession session, HttpServletRequest request) throws IOException {
			int categoryno = Integer.parseInt(request.getParameter("categoryno"));
			session.setAttribute("categoryno", categoryno);
			String fileName = request.getParameter("categoryno");
			String path =  session.getServletContext().getRealPath("/resources/detailRequests/"+fileName);
			File file = new File(path);
			
			String[] q = new String[6];
			int count = 0;
			
			if(file.exists())
			{
			    BufferedReader inFile = new BufferedReader(new FileReader(file));
			    String sLine = null;
			    while( (sLine = inFile.readLine()) != null ) {
				    q[count] = sLine;
//			    	System.out.println(q[count]);
			    	count++;
			    }
			}
			session.setAttribute("q0", q[0]);
			session.setAttribute("q1", q[1]);
			session.setAttribute("q2", q[2]);
			session.setAttribute("q3", q[3]);
			session.setAttribute("q4", q[4]);
			session.setAttribute("q5", q[5]);
			
			session.setAttribute("modal","true");
			return "category_bot";
		}
		
		@RequestMapping("/requestInsert")
		public String requestInsert(HttpSession session, HttpServletRequest request) {
			String email = (String) session.getAttribute("email");
			UsersDto usersDto = usersService.serch(email); //요청서 작성자 정보 가져오기
			
			int categoryno = (int) session.getAttribute("categoryno");
			
			RequestDto requestDto = new RequestDto();
			requestDto.setCno(categoryno);
			requestDto.setEmail(usersDto.getEmail());
			requestDto.setAddr(usersDto.getAddr());
			requestDto.setLat(usersDto.getLat());
			requestDto.setLongi(usersDto.getLongi());
			requestDto.setSex(request.getParameter("sex")); //세부요청서 내용
			requestDto.setAnser1(request.getParameter("a1")); //세부요청서 내용
			requestDto.setAnser2(request.getParameter("a2")); //세부요청서 내용
			requestDto.setAnser3(request.getParameter("a3")); //세부요청서 내용
			requestDto.setAnser4(request.getParameter("a4")); //세부요청서 내용
			requestDto.setAnser5(request.getParameter("a5")); //세부요청서 내용
			requestService.write(requestDto);
			
			int request_no = requestService.serchNo(email); //테이블request(no)데이터
			String nomal_addr = requestDto.getAddr().substring(0,6); //요청자 주소(구or시까지)
			String gosu_addr;
			
			List<UsersDto> userList = usersService.list(); //granted가 3인 인증고수 튜플들 가져오기
			for(UsersDto user : userList) {
				gosu_addr = user.getAddr().substring(0,6); //고수 주소(구or시까지) 주소매칭은 추후 논의 필요
				
				if(requestDto.getCno()==user.getC_bno()&&
				   requestDto.getSex().equals(user.getSex())&&
				   nomal_addr.equals(gosu_addr)) {
					
					MatchingDto matchingDto = new MatchingDto();
					matchingDto.setRequest_no(request_no); 
					matchingDto.setGosu_email(user.getEmail());
					matchingDto.setNomal_email(requestDto.getEmail());
					matchingService.matching1(matchingDto);
				}
				
			}
			
			return "result";
		}
		
		@RequestMapping("/request")
		public String mypage(HttpSession session, HttpServletRequest request) {
			String email = (String) session.getAttribute("email");
			List<MatchingDto> list = matchingService.matchingRequestList(email);
			request.setAttribute("list", list);
			
			return "request";
		}
		
		@RequestMapping("/estimate")
		public String estimate(HttpServletRequest request, HttpSession session) {
			String email = (String) session.getAttribute("email");
			List<MatchingDto> list = matchingService.matchingEstimateList(email);
			List<MatchingDto> list2 = new ArrayList<>();
			for(MatchingDto estimate : list) {
				if(estimate.getEstimate_no() != 0) {
					list2.add(estimate);
				}
			}
			request.setAttribute("list2", list2);
			
			return "estimate";
		}
		
		@RequestMapping("/estimateWrite")
		public String estimateWrite(HttpServletRequest request, HttpSession session) throws IOException {
			int no = Integer.parseInt(request.getParameter("no"));
			session.setAttribute("matching_no", no); //견적서 작성 완료 후에 matching테이블에서 해당 튜플을 찾기 위한 값
			
			MatchingDto matchingDto = matchingService.matchingGet(no); //matching테이블에서 request_no가져오기
			int request_no = matchingDto.getRequest_no(); //matching테이블에서 request_no가져오기
			RequestDto requestDto = requestService.requestGet(request_no); //request테이블에서 reqeust_no에 해당하는 튜플가져오기
			request.setAttribute("requestDto", requestDto);
			
			// <<해당 세부요청서 파일에서 질문 텍스트 가져오기
			String fileName = Integer.toString(requestDto.getCno());
			String path =  session.getServletContext().getRealPath("/resources/detailRequests/"+fileName);
			File file = new File(path);
			
			String[] q = new String[6];
			int count = 0;
			
			if(file.exists())
			{
			    BufferedReader inFile = new BufferedReader(new FileReader(file));
			    String sLine = null;
			    while( (sLine = inFile.readLine()) != null ) {
				    q[count] = sLine;
//			    	System.out.println(q[count]);
			    	count++;
			    }
			}
			request.setAttribute("q", q);
			// 해당 세부요청서 파일에서 질문 텍스트 가져오기>>
			
			String email = (String) session.getAttribute("email");
			UsersDto usersDto = usersService.serch(email);
			int pno = usersDto.getPno();
			ProfileDto profileDto = profileService.profileGet(pno);
			request.setAttribute("profile", profileDto);
			
			int estimate_no = matchingDto.getEstimate_no();
			if(estimate_no == 0) {
				request.setAttribute("estimateDto", "null");
			} else {
				EstimateDto estimateDto = estimateService.estimateGet(estimate_no);
				request.setAttribute("estimateDto", estimateDto);
			}
			
			return "estimateWrite";
		}
		
		@RequestMapping("/estimateInsert")
		public String estimateInsert(HttpServletRequest request, HttpSession session) {
			String email = (String) session.getAttribute("email");
			UsersDto usersDto = usersService.serch(email);
			String time_pay = request.getParameter("time_pay");
			String total_pay = request.getParameter("total_pay");
			String anser1 = request.getParameter("anser1");
			EstimateDto estimateDto = new EstimateDto();
			estimateDto.setCno(usersDto.getC_bno());
			estimateDto.setEmail(usersDto.getEmail());
			estimateDto.setPno(usersDto.getPno());
			estimateDto.setTime_pay(time_pay);
			estimateDto.setTotal_pay(total_pay);
			estimateDto.setAnser1(anser1);
			estimateService.estimateWrite(estimateDto);
			
			int matching_no = (int) session.getAttribute("matching_no"); //matching테이블에 해당 튜플 번호
			int estimate_no = estimateService.estimateNoGet(email); //estimate테이블에 해당등록 튜플 번호
			matchingService.matching2(matching_no, estimate_no);
			
			return "result";
		}
		
		@RequestMapping("/estimateRead")
		public String estimateRead(HttpServletRequest request, HttpSession session) throws IOException {
			int matchingno = Integer.parseInt(request.getParameter("matchingno"));
			MatchingDto matchingDto = matchingService.matchingGet(matchingno);
			int request_no = matchingDto.getRequest_no();
			int estimate_no = matchingDto.getEstimate_no();
			RequestDto requestDto = requestService.requestGet(request_no); //reqeust테이블 튜플
			EstimateDto estimateDto = estimateService.estimateGet(estimate_no); //estimate테이블 튜플
			int pno = estimateDto.getPno();
			ProfileDto profileDto = profileService.profileGet(pno); //profile테이블 튜블
			
			// <<해당 세부요청서 파일에서 질문 텍스트 가져오기
			String fileName = Integer.toString(requestDto.getCno());
			String path =  session.getServletContext().getRealPath("/resources/detailRequests/"+fileName);
			File file = new File(path);
					
			String[] q = new String[6];
			int count = 0;
					
			if(file.exists())
				{
					BufferedReader inFile = new BufferedReader(new FileReader(file));
					String sLine = null;
					while( (sLine = inFile.readLine()) != null ) {
						q[count] = sLine;
//					   	System.out.println(q[count]);
					    count++;
					}
				}
			request.setAttribute("q", q);
			// 해당 세부요청서 파일에서 질문 텍스트 가져오기>>
			
			request.setAttribute("requestDto", requestDto);
			request.setAttribute("estimateDto", estimateDto);
			request.setAttribute("profileDto", profileDto);
			request.setAttribute("matchingDto", matchingDto);
			
			return "estimateRead";
		}
		
		@RequestMapping("/chat")
		public String chat(HttpServletRequest request, HttpSession session) {
//			matchingService.matchingResult();
			int matching_no = Integer.parseInt(request.getParameter("matchingno"));
			matchingService.matchingResult(matching_no);
			MatchingDto matchingDto = matchingService.matchingGet(matching_no);
			int m_result = Integer.parseInt(request.getParameter("m_result"));
			
			if(m_result == 0) {
				String gosu_email = matchingDto.getGosu_email();
				String nomal_email = matchingDto.getNomal_email();
				profileService.matchingCount(gosu_email);
				profileService.matchingCount(nomal_email);
			}
			
			return "result";
		}
		
}
