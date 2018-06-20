package spring.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.bean.MemberDto;
import spring.bean.ProfileDto;

@Repository
public interface ProfileDao {
	List<ProfileDto> profileList(Map<String, Object> map);
	List<ProfileDto> getProfile(int no);
	void register_profile(ProfileDto profileDto);
}
