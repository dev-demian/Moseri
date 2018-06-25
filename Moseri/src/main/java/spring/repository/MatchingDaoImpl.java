package spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.MatchingDto;

@Repository("matchingDao")
public class MatchingDaoImpl implements MatchingDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void matching1(MatchingDto matchingDto) {
		sqlSession.insert("matching1", matchingDto);
	}

	@Override
	public List<MatchingDto> matchingRequestList(String email) {
		return sqlSession.selectList("matchingRequestList", email);
	}

	@Override
	public MatchingDto matchingGet(int no) {
		return sqlSession.selectOne("matchingGet", no);
	}

	@Override
	public void matching2(int matching_no, int estimate_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("matching_no", matching_no);
		map.put("estimate_no", estimate_no);
		sqlSession.update("matching2", map);
	}

	@Override
	public List<MatchingDto> matchingEstimateList(String email) {
		return sqlSession.selectList("matchingEstimateList", email);
	}

	@Override
	public void matchingResult(int matching_no) {
		sqlSession.update("matchingResult", matching_no);
	}
	
	@Override
	public List<MatchingDto> matchingTtl() {
		return sqlSession.selectList("matchingTtl");
	}

	@Override
	public void matchingDelete(int matching_no) {
		sqlSession.delete("matchingDelete", matching_no);
	}

	@Override
	public void nomal_emailUpdate(int matching_no) {
		sqlSession.update("nomal_emailUpdate", matching_no);
	}

	@Override
	public void gosu_emailUpdate(int matching_no) {
		sqlSession.update("gosu_emailUpdate", matching_no);
	}
}
