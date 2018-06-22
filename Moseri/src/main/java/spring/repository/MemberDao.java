package spring.repository;

import org.springframework.stereotype.Repository;

import spring.bean.MemberDto;

@Repository
public interface MemberDao {

	
	void register(MemberDto memberDto);

	void register_gosu(MemberDto memberDto);
	
	MemberDto login(String email);

	MemberDto get(String email);
	//소분류 번호를 가져온다
	int getBno(int no);



	
}
