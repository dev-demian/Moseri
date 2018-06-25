package spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spring.bean.ReviewDto;

@Service
public interface ReviewService {
	/////////////////////////////////20180625추가/////////////////////////////////////
	void insert(String nick, int pro_no, ReviewDto reviewDto);
	List<ReviewDto> getReview(int no);
	List<ReviewDto> getMyReview(String email);
}
