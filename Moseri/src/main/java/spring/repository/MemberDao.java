package spring.repository;

import org.springframework.stereotype.Repository;

import spring.bean.MemberDto;

@Repository
public interface MemberDao {

	
	void register(MemberDto memberDto);

	MemberDto login(String id);

	MemberDto get(String id);

	



	
}
