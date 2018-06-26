package spring.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.bean.FileDto;
import spring.bean.MemberDto;
import spring.bean.ProfileDto;

@Repository
public interface ProfileDao {
	List<ProfileDto> profileList(Map<String, Object> map);
	List<ProfileDto> getProfile(int no);
	void register_profile(ProfileDto profileDto);
	
	
	public ProfileDto profileGet(int no);
	public void matchingCount(String email);
	
	
	//프로필 업데이트 
	void update_profile(ProfileDto profileDto);
	void update_profile_pro(ProfileDto profileDto);
	void update_profile_img(ProfileDto profileDto);
	
	/////////////////////////////////20180625추가/////////////////////////////////////
	List<ProfileDto> getMyProfile(String email);
	String getNickname(int pro_no);
	
	List<ProfileDto> getProfileList();
}
