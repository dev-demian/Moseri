package spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.CategoryTopDto;

@Repository
public interface CategoryDao {
	List<CategoryTopDto> getList();
	List<CategoryMidDto> midList(int no);
	List<CategoryBotDto> botList(int no);
	
	//
	List<CategoryMidDto> getCmid();
	List<CategoryBotDto> getCbot();

	/////////////////////////////////소분류 이름를 가져온다/////////////////////////////////////
	String getBotName(int no);
	/////////////////////////////////////검색어리스트미리보기//////////////////////////////////
	List<CategoryBotDto> botListText(String text);
}
