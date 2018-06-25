package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.MatchingDto;
import spring.repository.MatchingDao;

@Service
public class MatchingServiceImpl implements MatchingService {
	@Autowired
	private MatchingDao matchingDao;

	@Override
	public void matching1(MatchingDto matchingDto) {
		matchingDao.matching1(matchingDto);
	}

	@Override
	public List<MatchingDto> matchingRequestList(String email) {
		return matchingDao.matchingRequestList(email);
	}

	@Override
	public MatchingDto matchingGet(int no) {
		return matchingDao.matchingGet(no);
	}

	@Override
	public void matching2(int matching_no, int estimate_no) {
		matchingDao.matching2(matching_no, estimate_no);
	}

	@Override
	public List<MatchingDto> matchingEstimateList(String email) {
		return matchingDao.matchingEstimateList(email);
	}

	@Override
	public void matchingResult(int matching_no) {
		matchingDao.matchingResult(matching_no);
	}
	@Override
	public List<MatchingDto> matchingTtl() {
		return matchingDao.matchingTtl();
	}

	@Override
	public void matchingDelete(int matching_no) {
		matchingDao.matchingDelete(matching_no);
	}
	@Override
	public void nomal_emailUpdate(int matching_no) {
		matchingDao.nomal_emailUpdate(matching_no);
	}

	@Override
	public void gosu_emailUpdate(int matching_no) {
		matchingDao.gosu_emailUpdate(matching_no);
	}

}
