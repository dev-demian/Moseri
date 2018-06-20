package spring.service;

import spring.bean.EstimateDto;

public interface EstimateService {
	public void estimateWrite(EstimateDto estimateDto);
	public int estimateNoGet(String email);
	public EstimateDto estimateGet(int estimate_no);
}
