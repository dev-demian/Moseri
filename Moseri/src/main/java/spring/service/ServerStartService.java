package spring.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import spring.bean.MatchingDto;

@Service
public class ServerStartService {
	@Autowired
	MatchingService matchingService;
	@Autowired
	RequestService requestService;
	@Autowired
	EstimateService estimateService;
	
	@Scheduled(fixedDelay=9000L)
	public void work() {
		System.out.println("스케쥴러 실행");
		
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("HH");
		String nowTime = dayTime.format(new Date(time));
		int nowHour = Integer.parseInt(nowTime); //현재 시간
		
		if(nowHour == 21) {
			long time2 = System.currentTimeMillis();
			SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyyMMdd");
			String nowTime2 = dayTime2.format(new Date(time2));
			int nowDate = Integer.parseInt(nowTime2); //현재 년원일
			int deleteCount = 0;
			
			List<MatchingDto> list = matchingService.matchingTtl();
			for(MatchingDto matchingDto : list) {
				int ttl = Integer.parseInt(matchingDto.getTtl()); //m_result가 null인 ttl값
				int matching_no = matchingDto.getNo();
				int request_no = matchingDto.getRequest_no();
				int estimate_no = matchingDto.getEstimate_no();
				if(ttl < nowDate) {
					if(estimate_no != 0) {
						estimateService.estimateDelete(estimate_no); //해당 matching테이블에서 estimate_no가 1이면 estimate삭제
					}
					requestService.requestDelete(request_no); //해당 request테이블 삭제
					matchingService.matchingDelete(matching_no); //해당 matching테이블 삭제
					
					deleteCount++;
					System.out.println(deleteCount+"개의 matching관련 삭제");
				}
				
				
			}
			
		}
		
	}
}






