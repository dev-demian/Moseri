package spring.repository;

import org.springframework.stereotype.Repository;

import spring.bean.EstimateDto;

@Repository
public interface EstimateDao {
	public void estimateWrite(EstimateDto estimateDto);
	public int estimateNoGet(String email);
	public EstimateDto estimateGet(int estimate_no);
}
