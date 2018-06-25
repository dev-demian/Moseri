package spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.ReviewDto;

@Repository("reviewDao")
public class ReviewDaoImpl implements ReviewDao {
	/////////////////////////////////20180625추가/////////////////////////////////////
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ReviewDto reviewDto) {
		sqlSession.insert("insert", reviewDto);
	}
	@Override
	public List<ReviewDto> getReview(int no) {
		return sqlSession.selectList("getReview", no);
	}
	@Override
	public List<ReviewDto> getMyReview(String email) {
		return sqlSession.selectList("getMyReview", email);
	}
}
