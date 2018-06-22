package spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.EstimateDto;

@Repository("estimateDao")
public class EstimateDaoImpl implements EstimateDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void estimateWrite(EstimateDto estimateDto) {
		sqlSession.insert("estimateWrite", estimateDto);
	}

	@Override
	public int estimateNoGet(String email) {
		return sqlSession.selectOne("estimateNoGet", email);
	}

	@Override
	public EstimateDto estimateGet(int estimate_no) {
		return sqlSession.selectOne("estimateGet", estimate_no);
	}
	@Override
	public void estimateDelete(int estimate_no) {
		sqlSession.delete("estimateDelete", estimate_no);
	}
	
}
