package spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.ReviewDto;

@Repository
public interface ReviewDao {
	/////////////////////////////////20180625추가/////////////////////////////////////
	void insert(ReviewDto reviewDto);
	List<ReviewDto> getReview(int no);
	List<ReviewDto> getMyReview(String email);
}
