package spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spring.bean.ReplyDto;

@Service
public interface ReplyService {

	public List<ReplyDto> list(int bno);
	public int count(int bno);
	public void create(ReplyDto replyDto);
}
