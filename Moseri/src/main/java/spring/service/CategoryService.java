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
	
	/////////////////////////////////소분류 이름를 가져온다/////////////////////////////////////
	String getBotName(int no);
	/////////////////////////////////////검색어리스트미리보기//////////////////////////////////
	List<CategoryBotDto> botListText(String text);


}
