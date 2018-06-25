package spring.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.MemberDto;
import spring.bean.ProfileDto;

@Service
public interface ProfileService {
	List<ProfileDto> profileList(int bot, String addr);
	List<ProfileDto> getProfile(int no);
	void register_profile(HttpServletRequest request,  ProfileDto profileDto)throws Exception;
	
	
	public ProfileDto profileGet(int no);
	public void matchingCount(String email);
	
	
	public void update_profile(MultipartHttpServletRequest mRequest , HttpServletResponse response,HttpSession session,Model model, ProfileDto profileDto)throws IllegalStateException, IOException;
	
	/////////////////////////////////20180625추가/////////////////////////////////////
	List<ProfileDto> getMyProfile(String email);
	String getNickname(int pro_no);

}
