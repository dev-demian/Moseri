package spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import spring.bean.MemberDto;
import spring.bean.ProfileDto;

@Service
public interface ProfileService {
	List<ProfileDto> profileList(int bot, String addr);
	List<ProfileDto> getProfile(int no);
	void register_profile(HttpServletRequest request,  ProfileDto profileDto)throws Exception;
	
	
	public ProfileDto profileGet(int no);
	public void matchingCount(String email);
}
