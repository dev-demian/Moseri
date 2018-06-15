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
}
