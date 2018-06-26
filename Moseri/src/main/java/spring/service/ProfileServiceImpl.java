package spring.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.MemberDto;
import spring.bean.ProfileDto;
import spring.repository.MemberDao;
import spring.repository.ProfileDao;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProfileDao profileDao;
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public List<ProfileDto> profileList(int bot, String addr) {
		Map<String,Object> map = new HashMap<>();
		//주소자르기
		String subAddr = addr.substring(0,6);
		log.info("bot = {}",bot);
		log.info("addr = {}",addr);
		log.info("subAddr = {}",subAddr);
		map.put("bot", bot);
		map.put("addr", subAddr);
		return profileDao.profileList(map);
	}
	@Override
	public List<ProfileDto> getProfile(int no) {
		return profileDao.getProfile(no);
	}
	@Override
	public void register_profile(HttpServletRequest request ,ProfileDto profileDto) throws Exception {
		// TODO Auto-generated method stub

		profileDto.setEmail(request.getParameter("email"));
		profileDto.setNickname(request.getParameter("nickname"));
		
		
		//여기서 합친다음에 넣기 
		profileDao.register_profile(profileDto);
		
	}
	
	
	
	
	
	
	@Override
	public ProfileDto profileGet(int no) {
		return profileDao.profileGet(no);
	}

	@Override
	public void matchingCount(String email) {
		profileDao.matchingCount(email);
	}
	
	
	
	
	
	
	@Override
	public void update_profile(MultipartHttpServletRequest mRequest,
			HttpServletResponse response, HttpSession session, Model model, ProfileDto profileDto) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		
		profileDto.setEmail((String)session.getAttribute("email"));
		profileDto.setSelf(mRequest.getParameter("self"));
		profileDto.setResume(mRequest.getParameter("resume"));
		
		
		//파일 업로드
		File dir = new File(mRequest.getSession().getServletContext().getRealPath("/res/pro_img"));
		System.out.println(dir);
		//프로필 이미지
		List<MultipartFile> plist = mRequest.getFiles("profileimg");//여기서 다 들어가 있다고 뜸 그래서 이상한 쓰래기값이 들어가는거임;;
		System.out.println(plist.isEmpty());
		System.out.println(plist.size());
		
		if(!(plist.isEmpty())) {
			String rname = null;
			for(MultipartFile file : plist) {
		         //1개의 파일에 대한 작업을 수행
				 //해당 파일이 이미지파일인지 확인하는 작업 넣어야함
		         rname = System.currentTimeMillis()+"-"+UUID.randomUUID();
		         String fname = file.getOriginalFilename();	
		         long fsize = file.getSize();
		         String ftype = file.getContentType();
		         File target = new File(dir, rname+"."+ftype.substring(6));
		         rname+="."+ftype.substring(6);
		         profileDto.setPro_img(rname);
		         
		         if(ftype.contains("image")) {
		        	 file.transferTo(target);
		        	 profileDao.update_profile_pro(profileDto);//email, self , resume, proimg 
		         }else {
		        	 
		        	 System.out.println("이미지를 넣으셔아 합니다");
		         }
		         
		    
		    System.out.println(rname+""+fname+""+fsize+""+ftype);
			}
			
		}
		
		//일반 업로드 이미지
		List<MultipartFile> slist = mRequest.getFiles("swiperimg");
		if(!(slist.isEmpty())) {
			String rname = null;
			for(MultipartFile file : slist) {
		         //1개의 파일에 대한 작업을 수행
				 //해당 파일이 이미지파일인지 확인하는 작업 넣어야함
		         rname = System.currentTimeMillis()+"-"+UUID.randomUUID();
		         String fname = file.getOriginalFilename();	
		         long fsize = file.getSize();
		         String ftype = file.getContentType();
		         File target = new File(dir, rname+"."+ftype.substring(6));
		         rname+="."+ftype.substring(6);
		         profileDto.setImg(rname);
		         
		         if(ftype.contains("image")) {
		        	 file.transferTo(target);
		        	 profileDao.update_profile_img(profileDto);//email, self , resume, proimg ,img
		         }else {
		        	 
		        	 System.out.println("이미지를 넣으셔아 합니다");
		         }
		    
		    System.out.println(rname+""+fname+""+fsize+""+ftype);
			}
			
		}//email, self , resume, 
		
		profileDao.update_profile(profileDto);
		
	}
	
	/////////////////////////////////20180625추가/////////////////////////////////////
	@Override
	public List<ProfileDto> getMyProfile(String email) {
	return profileDao.getMyProfile(email);
	}
	@Override
	public String getNickname(int pro_no) {
	return profileDao.getNickname(pro_no);
	}
	
	
	@Override
	public List<ProfileDto> getProfileList() {
		
		List<ProfileDto> slist = profileDao.getProfileList();
		

		for(ProfileDto profileDto : slist){
			int pindex = profileDto.getNo();
			profileDto.setCname(memberDao.getCname(pindex));  
						
		} 
		
		return slist;
		//return profileDao.getProfileList();
	}
}
