package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.ReplyDto;
import spring.repository.ReplyDao;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public List<ReplyDto> list(int bno) {
		return replyDao.list(bno);
	}

	@Override
	public int count(int bno) {
		return 0;
	}

	@Override
	public void create(ReplyDto replyDto) {
			replyDao.create(replyDto);
		
	}
			
	
	
	
	
}
