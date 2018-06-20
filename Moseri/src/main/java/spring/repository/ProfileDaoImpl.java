package spring.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.ProfileDto;

@Repository("profileDao")
public class ProfileDaoImpl implements ProfileDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<ProfileDto> profileList(Map<String, Object> map) {
		return sqlSession.selectList("profileList", map);
	}
	@Override
	public List<ProfileDto> getProfile(int no) {
		return sqlSession.selectList("getProfile", no);
	}
	@Override
	public void register_profile(ProfileDto profileDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("register_profile",profileDto);
		
	}
	
	
	
	@Override
	public ProfileDto profileGet(int no) {
		return sqlSession.selectOne("profileGet", no);
	}

	@Override
	public void matchingCount(String email) {
		sqlSession.update("matchingCount", email);
	}
	
}
