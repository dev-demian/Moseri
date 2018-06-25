package spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.MemberDto;
import spring.bean.ProfileDto;
import spring.bean.RequestDto;
import spring.bean.ReviewDto;
import spring.bean.UsersDto;
import spring.service.MemberService;
import spring.service.ProfileService;
import spring.service.RequestService;
import spring.service.ReviewService;
import spring.service.UsersService;
import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.ChatDto;
import spring.bean.EstimateDto;
import spring.bean.FileDto;
import spring.bean.MatchingDto;
import spring.service.CategoryService;
import spring.service.ChatService;
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
	@Autowired
	ChatService chatService;
	@Autowired
	ReviewService reviewService;

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
		
		
		// 회원가입 id 체크(post)
		@RequestMapping("/register_check")
		 @ResponseBody
		public Map<Object, Object> register_check(@RequestBody String useremail) {
			 int count = 0;
		        Map<Object, Object> map = new HashMap<Object, Object>();
		        count = memberservice.emailcheck(useremail);
		        map.put("cnt", count);
			
			return map;
		}
		
		// 회원가입 닉네임 체크(post)
				@RequestMapping("/register_ncikcheck")
				 @ResponseBody
				public Map<Object, Object> register_ncikcheck(@RequestBody String usernick) {
					 int count = 0;
				        Map<Object, Object> map = new HashMap<Object, Object>();
				        count = memberservice.nickcheck(usernick);
				        map.put("cnt", count);
					
					return map;
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
			session.setAttribute("addr", db_data.getAddr());
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
	
	@RequestMapping("/botListText")
	@ResponseBody
	public List<CategoryBotDto> botListText(@RequestParam(value="text") String text){
		return categoryService.botListText(text);
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
	public String profile(HttpServletRequest request,HttpSession session) {
		/////////////////////////////////20180625추가/////////////////////////////////////
		String email = (String) session.getAttribute("email");
		request.setAttribute("getMyReview", reviewService.getMyReview(email));
		request.setAttribute("getMyProfile", profileService.getMyProfile(email));
		return "myprofile";
	}

	//마이페이지 - 알림

	@RequestMapping("/notification")
	public String notification() {
		return "notification";
	}

	//마이페이지 - 개인정보

	@RequestMapping("/information")
	public String information(HttpSession session) {
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
		System.out.println(dir.getAbsolutePath());
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
					/////////////////////////////////소분류 번호를 가져온다/////////////////////////////////////
					int cbno = memberservice.getBno(no);
					request.setAttribute("getBno", cbno);
					/////////////////////////////////소분류 이름를 가져온다/////////////////////////////////////
					request.setAttribute("getBotName", categoryService.getBotName(no));
					//
					request.setAttribute("getReview", reviewService.getReview(no));
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
			System.out.println(midDto.size());
			//골라낸 중분류(midDto)만 담겨있음. 
			model.addAttribute("categoryMidDto",midDto);
//			
		}
		
		@RequestMapping(value="/category")
		public String category(Model model,  HttpServletRequest request, HttpSession session) {
//			app.setAttribute("start", "ture");
//			System.out.println(app.getAttribute("start"));
			
//			session.setAttribute("login", "success"); /*임시로그인을위함*/
//			session.setAttribute("email", "twosan2@naver.com"); /*일반 사용자 임시 로그인을 위함*/
//			session.setAttribute("granted", 1); /*일반 사용자 임시 로그인을 위함*/
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
			log.info("{}",pagenum);
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
	//	
		@RequestMapping("/construction")
		public String construction(Model model,  HttpServletRequest request) {

			int pagenum =3;
			log.info("{}",pagenum);
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
	//	
		@RequestMapping("/it")
		public String it(Model model,  HttpServletRequest request ) {
			
			int pagenum = 4;
			log.info("{}",pagenum);
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		@RequestMapping("/health")
		public String health(Model model,  HttpServletRequest request ) {
			
			int pagenum = 5;
			log.info("{}",pagenum);
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		
		@RequestMapping("/event")
		public String event(Model model,  HttpServletRequest request ) {
			
			int pagenum = 6;
			log.info("{}",pagenum);
			convert_mid(model, pagenum, request);
			return "category_mid";
		}
		
		@RequestMapping("/category_bot")
		public String category_bot(Model model,  HttpServletRequest request ) {
////			//중분류의 no를 불러옴
			log.info("{}",request.getParameter("midNo"));
			int no = Integer.parseInt(request.getParameter("midNo"));
			
			System.out.println(no);
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
			System.out.println(botDto.size());
			//골라낸 중분류(midDto)만 담겨있음. 
			model.addAttribute("categoryBotDto",botDto);
			
			return "category_bot";
		}
		
		@RequestMapping("/writeRequest")
		public String writeEstimate(HttpSession session, HttpServletRequest request) throws IOException {
			int categoryno = Integer.parseInt(request.getParameter("categoryno"));
			session.setAttribute("categoryno", categoryno);
			String fileName = request.getParameter("categoryno");
			String path =  session.getServletContext().getRealPath("/res/detailRequests/"+fileName);
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
			System.out.println(userList.size() + "유저리스트 사이즈");
			for(UsersDto user : userList) {
				gosu_addr = user.getAddr().substring(0,6); //고수 주소(구or시까지) 주소매칭은 추후 논의 필요
				
				System.out.println(requestDto.getCno()==user.getC_bno()&&requestDto.getSex().equals(user.getSex())&&nomal_addr.equals(gosu_addr));
				
				if(requestDto.getCno()==user.getC_bno()&&
						   requestDto.getSex().equals(user.getSex())||requestDto.getSex().equals("무관")&& ///37.수정(두산)
						   nomal_addr.equals(gosu_addr)&&
						   !email.equals(user.getEmail())) { ///38,추가(두산)
					
					MatchingDto matchingDto = new MatchingDto();
					matchingDto.setRequest_no(request_no); 
					matchingDto.setGosu_email(user.getEmail());
					matchingDto.setNomal_email(requestDto.getEmail());
					///17.추가(두산)
					Calendar cal = Calendar.getInstance();
				    cal.setTime(new Date());
				    cal.add(Calendar.DATE, 6);
				    DateFormat df = new SimpleDateFormat("yyyyMMdd");
				    String strDate = df.format(cal.getTime());
				    matchingDto.setTtl(strDate);
				    ///17.추가(두산)
					
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
			System.out.println(list2.isEmpty());
			
			
			return "estimate";
		}
		
		@RequestMapping("/estimateWrite")
		public String estimateWrite(HttpServletRequest request, HttpSession session) throws IOException {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println("넘버가 잘들어가나 확인"+no);
			
			session.setAttribute("matching_no", no); //견적서 작성 완료 후에 matching테이블에서 해당 튜플을 찾기 위한 값
			session.setAttribute("matchingno", no);
			MatchingDto matchingDto = matchingService.matchingGet(no); //matching테이블에서 request_no가져오기
			System.out.println("매칭테이블"+matchingDto.getRequest_no());
			int request_no = matchingDto.getRequest_no(); //matching테이블에서 request_no가져오기
			System.out.println("리퀘스트 번호 :" +request_no);
			RequestDto requestDto = requestService.requestGet(request_no); //request테이블에서 reqeust_no에 해당하는 튜플가져오기
			System.out.println("리퀘스트 DTO호출성공"+requestDto.getCno());
			request.setAttribute("requestDto", requestDto);
			System.out.println("리퀘스트 DTO저장성공"+request.getAttribute("cno"));
			System.out.println("리퀘스트 DTO저장성공"+request.getAttribute("email"));
			System.out.println("리퀘스트 DTO저장성공"+request.getAttribute("addr"));
			System.out.println("리퀘스트 DTO저장성공"+request.getAttribute("sex"));
			
			
			
			
			// <<해당 세부요청서 파일에서 질문 텍스트 가져오기
			String fileName = Integer.toString(requestDto.getCno());
			String path =  session.getServletContext().getRealPath("/res/detailRequests/"+fileName);
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
			    inFile.close();
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
				request.setAttribute("matchingDto", matchingDto); ///13.추가(두산)
			}
			
			return "estimate_write";
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
			String path =  session.getServletContext().getRealPath("/res/detailRequests/"+fileName);
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
			session.setAttribute("matchingno", matchingno);
			return "estimateRead";
		}
		
		@RequestMapping("/chat")
		public String chat(HttpServletRequest request, HttpSession session, HttpServletResponse response)throws IOException  {


			///39.수정(두산)
			int matching_no = Integer.parseInt(request.getParameter("matchingno"));
			MatchingDto matchingDto = matchingService.matchingGet(matching_no);
			String myEmail = (String) session.getAttribute("email");
			String gosuEmail = matchingDto.getGosu_email();
			
			if(myEmail.equals(gosuEmail)) { //고수로 채팅창에 접근할 때
				request.setAttribute("participant", "gosu");
				request.setAttribute("matchingDto", matchingDto);
			}else { //요청자로 채팅창에 접근할 때
				matchingService.matchingResult(matching_no);
				int m_result = Integer.parseInt(request.getParameter("m_result"));
				if(m_result == 0) {
					String gosu_email = matchingDto.getGosu_email();
					String nomal_email = matchingDto.getNomal_email();
					profileService.matchingCount(gosu_email);
					profileService.matchingCount(nomal_email);
				}
				
				request.setAttribute("matchingDto", matchingDto); ///30.추가(두산)
				request.setAttribute("participant", "requester"); ///28.추가(두산)
			}
			///39.수정(두산)
			
			//각종 chat작업 수행을 위해서 ID 편집해서  Session에 다시 저장함
			
			//로그인 시 세션에 저장한 이메일 주소를 가져와서 자름 
			String emailID = (String)session.getAttribute("email");
			//메일주소 자르기
			int index = emailID.indexOf("@");
			String ID =emailID.substring(0,index);
			
			//메일주소를 자른 ID값을 다시 세션에 저장
			session.setAttribute("ID", ID);
//			log.info("ID={}",ID);
			
//			System.out.println(emailID + ID +"email:"+(String)session.getAttribute("email"));
//			System.out.println("participant :"+ request.getAttribute("participant"));
			return "chat";
		}
		
		public int submit(String fromID, String toID, String chatContent, int matchno) {
			ChatDto chatDto = new ChatDto();
			chatDto.setFromID(fromID);
			chatDto.setToID(toID);
			chatDto.setChatContent(chatContent);
			chatDto.setMatchNo(matchno);
			Date d = new Date();
			SimpleDateFormat date = new SimpleDateFormat("YYYY년 MM월 dd일 aa hh:mm");
			String time = date.format(d);
			chatDto.setChatTime(time);
			chatService.chatWrite(chatDto);
			
			//성공하면 1
			return 1;
		}
		
		
		@RequestMapping(value="/chatwrite")
		@ResponseBody
		public int chatWrite(@RequestParam(value="fromID") String fromID, 
										@RequestParam(value="chatContent") String chatContent, 	HttpServletResponse response, 
											HttpServletRequest request,HttpSession session) throws Exception {
				int matchingno = (int) session.getAttribute("matchingno");
				MatchingDto matchingDto = matchingService.matchingGet(matchingno);
				//아이디 저장
				//발신자 수신자 구분
				String toID = null;
				if(fromID.equals(matchingDto.getGosu_email())) {
					//고수가 접속한 상태 : 일반사용자가 받는 사람(toID)
					toID = matchingDto.getNomal_email();
				}
				else if(fromID.equals(matchingDto.getNomal_email())) {
					//일반사용자 접속 상태 : 고수가 받는 사람(toID)
					toID = matchingDto.getGosu_email();
				}
				else
					log.info("{}","오류발생");
				
				//보낸시각 구하기
				Date d = new Date();
				SimpleDateFormat date = new SimpleDateFormat("YYYY년 MM월 dd일 aa hh:mm");
				String time = date.format(d);
				
				//발신자메일주소 자르기
				int index = fromID.indexOf("@");
				String noEmailFromID =fromID.substring(0,index);
				
				//수신자메일주소 자르기
				int index2 = toID.indexOf("@");
				String noEmailToID =toID.substring(0,index2);
				
					 
//				log.info("{}",fromID);
//				log.info("{}",toID);
				
				//보낸사람, 받은사람, 내용, 매치넘버, 발신시각 DB저장
				if(noEmailFromID == null || noEmailFromID.equals(" ") || noEmailToID == null || noEmailToID.equals(" ") || chatContent == null || chatContent.equals(" ")
						|| matchingno == 0 || time == null || time.equals(" ")) {
					return 0;
				}else {
					return submit(noEmailFromID, noEmailToID, chatContent, matchingno);
				}
		} 
		
		private List<ChatDto> getChat(int matchingno) {
			return chatService.getChat(matchingno);
		}
		private List<ChatDto> getChatList(int matchgno, int no) {
			return chatService.getChatList(matchgno, no);
		}
		
		@RequestMapping("/getlist")
		@ResponseBody
		public Map<String,Object> getlist(@RequestParam(value="fromID") String fromID, @RequestParam(value="listType")String listType, 
													HttpServletRequest request, HttpSession session) throws Exception {
			
			//matchingno 받아오기
			int matchingno = (int) session.getAttribute("matchingno");
			log.info("matchno={}",matchingno);
			//해당하는 매치정보 가져옴
			MatchingDto matchingDto = matchingService.matchingGet(matchingno);
			//발신자 수신자 구분
			String toID = null;
			//로그인->세션저장을 통해서 페이지를 거쳐온 아이디를 ajax를 통해서 받음
			//로그인 아이디로 매칭된 상대 아이디를 구함
			// 고수가 fromID(발신자)라면 
			if(fromID.equals(matchingDto.getGosu_email())) {
				//고수가 접속한 상태 : 일반사용자가 받는 사람(toID)
				toID = matchingDto.getNomal_email();
			}
			else if(fromID.equals(matchingDto.getNomal_email())) {
				//일반사용자 접속 상태 : 고수가 받는 사람(toID)
				toID = matchingDto.getGosu_email();
			}
			else
				log.info("{}","오류발생");
			
			//보낸 시각 구하기
			Date d = new Date();
			SimpleDateFormat date = new SimpleDateFormat("YYYY년 MM월 dd일 aa hh:mm");
			String time = date.format(d);
			
//			//발신자메일주소 자르기
			int index = fromID.indexOf("@");
			String noEmailFromID =fromID.substring(0,index);
			log.info("fromID={}",fromID);
			
			//수신자메일주소 자르기
			int index2 = toID.indexOf("@");
			String noEmailToID =toID.substring(0,index2);
			
			//페이지로 보냄 : 마지막 no
			
			log.info("gosuID={}",noEmailFromID);
			log.info("요청자ID={}",noEmailToID);
			log.info("listType={}",listType);
			log.info("matchingno={}",matchingno);
			log.info("time={}",time);
			
			
			
			//매칭번호로 검색해서, 그 튜플에 해당하는 모든 정보를 가져오는 부분
			List<ChatDto> cdto =  getChat(matchingno);
			log.info("cdto.size()={}",cdto.size());
//			log.info("cdto={}",cdto);
			
			//해당 매칭번호로 주고받은 튜플의 마지막 번호 구함.  마지막 번호는 나중에 마지막 메시지만 가져오기 위해서 사용함 
			
			Integer lastNo = cdto.get(cdto.size()-1).getNo();
			
			//ajax로 보낼  map에다가 마지막 번호를 저장
			Map<String,Object> map = new HashMap<>();
			map.put("lastNo", lastNo);
			
			//아무것도  null이 없다면
			if(fromID == null || fromID.equals(" ") || toID == null || toID.equals(" ") || listType == null || listType.equals(" ")
					|| matchingno == 0 || time == null || time.equals(" "))
			{
				return null;
			}
			//클라이언트가 ten을 입력하면 그 매칭에 해당하는 자료를 모두 저장하여 보내준다. 
			//위에서 이미 만들어서 모든 정보 저장해둔 cdto를 그대로 전송한다.
			else if(listType.equals("ten")) {
				map.put("getchat", cdto);
				return map;
			}
			else {
				//클라이언트에게 마지막 메시지만 골라서 가져다주는 부분
//				log.info("matchingno={}",matchingno);
				int number = Integer.parseInt(listType);
				List<ChatDto> cdto2 = getChatList(matchingno, number);
				log.info("lastNofinal={}",lastNo);
				map.put("getchat", cdto2);
				return map;
			}
		}
		
//		///15.추가(두산)
//				@RequestMapping("/chat2")
//				public String chat2(HttpServletRequest request, HttpSession session) {
//					return "result";
//				}
//		///15.추가(두산)
		
		//////////////////////////////////////////////////////////////////////
		
		
		@RequestMapping(value = "/profile_update" , method = RequestMethod.POST)
		public String profile_update(MultipartHttpServletRequest mRequest , HttpServletResponse response,HttpSession session,Model model, @ModelAttribute ProfileDto profileDto)throws IllegalStateException, IOException{
			
	
			profileService.update_profile(mRequest,  response, session, model, profileDto);
			
			
			return "redirect:myprofile";
		}
		
		////////////////////////////////리뷰/////////////////////////////////////////
		////////////////////////////////리뷰/////////////////////////////////////////
		/*@GetMapping("/review")
		public String review(HttpServletRequest request) {
			/////////////////////////////////20180625추가/////////////////////////////////////
			int pro_no = 3;
			request.setAttribute("getNickname", profileService.getNickname(pro_no));
			return "review";
		}*/
		/////////////////////////////////20180625추가/////////////////////////////////////
		@RequestMapping("/review")
		public String review(HttpServletRequest request, HttpSession session,@ModelAttribute ReviewDto reviewDto) {
			String nick = (String)request.getParameter("nickname");
			System.out.println("리뷰로 넘어왔고 본인 닉네임 찍어놓기: "+nick);
			int pro_no = Integer.parseInt(request.getParameter("pno"));
			System.out.println("고수의 프로필 넘버: "+pro_no);
			reviewService.insert(nick,pro_no,reviewDto);
			return "redirect:/home";
		}
		
		
		@RequestMapping("/reviewInsert")//안쓸예정
			public String reviewWrite() {
				return "home";
		}
				
				///32.추가(두산)
				@RequestMapping("/chatEnd")
				public String chatEnd(HttpServletRequest request, HttpSession session) {
					int matching_no = Integer.parseInt(request.getParameter("matchingno"));
//					System.out.println(matching_no);
					String participant = (String) request.getParameter("participant"); //채팅 종료 버튼을 누른 사람을 구별(요청자/고수)
//					System.out.println(participant);
					if(participant.equals("requester")) {
						matchingService.nomal_emailUpdate(matching_no); ///33.추가(두산)
						
						MatchingDto matchingDto = matchingService.matchingGet(matching_no);
						int estimate_no = matchingDto.getEstimate_no();
						int request_no = matchingDto.getRequest_no();
						
						UsersDto nomalUsersDto = usersService.serch(matchingDto.getNomal_email());
						UsersDto gosuUsersDto = usersService.serch(matchingDto.getGosu_email());
						String nomalNickName = nomalUsersDto.getNickname(); //review페이지로 전달할 데이터
						int gosuPno = gosuUsersDto.getPno(); //review페이지로 전달할 데이터
						
						
						int gosu_end = matchingDto.getGosu_end();
						int nomal_end = matchingDto.getNomal_end();
						if(gosu_end == 1 && nomal_end == 1) {
							chatService.chatDelete(matching_no); //해당 매칭에 해당하는 모든 튜플 삭제
							estimateService.estimateDelete(estimate_no); //견적서 삭제
							requestService.requestDelete(request_no); //요청서 삭제
							matchingService.matchingDelete(matching_no); //매칭 삭제
						}
						
						request.setAttribute("nickname", nomalNickName);
						request.setAttribute("pno", gosuPno);
						//System.out.println(request.getAttribute("pno"));
						request.setAttribute("getNickname", profileService.getNickname(gosuPno));
						System.out.println(request.getAttribute("getNickname"));
						
						return "review";
						
					} else if(participant.equals("gosu")) {
						matchingService.gosu_emailUpdate(matching_no); ///34.추가(두산)
					}
					return "home";
				}
				///32.추가(두산)
				//36.추가(두산)
				@RequestMapping("/matchingGet")
				@ResponseBody
				public MatchingDto matchingGet(@RequestParam(value="no") int no){
					return matchingService.matchingGet(no);
				}
				///36.추가(두산)
		
		
}
