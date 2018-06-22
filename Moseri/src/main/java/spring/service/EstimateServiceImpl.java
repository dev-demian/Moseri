package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.EstimateDto;
import spring.repository.EstimateDao;

@Service
public class EstimateServiceImpl implements EstimateService {
	@Autowired
	private EstimateDao estimateDao;

	@Override
	public void estimateWrite(EstimateDto estimateDto) {
		estimateDao.estimateWrite(estimateDto);
	}

	@Override
	public int estimateNoGet(String email) {
		return estimateDao.estimateNoGet(email);
	}

	@Override
	public EstimateDto estimateGet(int estimate_no) {
		return estimateDao.estimateGet(estimate_no);
	}
	@Override
	public void estimateDelete(int estimate_no) {
		estimateDao.estimateDelete(estimate_no);
	}
}
