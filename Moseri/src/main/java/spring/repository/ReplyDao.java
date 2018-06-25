package spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.ReplyDto;

@Repository
public interface ReplyDao {

	public List<ReplyDto> list(int bno);
	public int count(int bno);
	public void create(ReplyDto replyDto);
}
