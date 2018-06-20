package spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.MemberDto;
import spring.bean.ProfileDto;
import spring.repository.ProfileDao;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProfileDao profileDao;
	
	@Override
	public List<ProfileDto> profileList(int bot, String addr) {
		Map<String,Object> map = new HashMap<>();
		//주소자르기
		String subAddr = addr.substring(0,7);
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
}
