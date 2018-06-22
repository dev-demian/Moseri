package spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.MatchingDto;

@Repository
public interface MatchingDao {
	public void matching1(MatchingDto matchingDto);
	public List<MatchingDto> matchingRequestList(String email);
	public MatchingDto matchingGet(int no);
	public void matching2(int matching_no, int estimate_no);
	public List<MatchingDto> matchingEstimateList(String email);
	public void matchingResult(int matching_no);
	public List<MatchingDto> matchingTtl();
	public void matchingDelete(int matching_no);
	
}
