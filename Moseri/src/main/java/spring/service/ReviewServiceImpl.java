package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.ReviewDto;
import spring.repository.ReviewDao;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	/////////////////////////////////20180625추가/////////////////////////////////////
	@Autowired
	private ReviewDao reviewDao;
	@Override
	public void insert(String nick, int pro_no, ReviewDto reviewDto) {
		reviewDto.setNick(nick);
		reviewDto.setPro_no(pro_no);
		reviewDao.insert(reviewDto);
	}
	@Override
	public List<ReviewDto> getReview(int no) {
		return reviewDao.getReview(no);
	}
	/////////////////////////////////list뽐기/////////////////////////////////////
	@Override
	public List<ReviewDto> getMyReview(String email) {
		return reviewDao.getMyReview(email);
	}
}
