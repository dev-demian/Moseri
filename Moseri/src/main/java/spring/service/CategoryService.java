package spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.CategoryTopDto;

@Service
public interface CategoryService {
	List<CategoryTopDto> getList();
	List<CategoryMidDto> midList(int no);
	List<CategoryBotDto> botList(int no);
	
	//
	public List<CategoryMidDto> selectMid();
	public List<CategoryBotDto> selectBot();

}
