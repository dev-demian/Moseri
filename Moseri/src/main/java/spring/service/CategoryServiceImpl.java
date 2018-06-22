package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.CategoryTopDto;
import spring.repository.CategoryDao;

@Service("categoryServie")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	@Override
	public List<CategoryTopDto> getList() {
		return categoryDao.getList();
	}
	@Override
	public List<CategoryMidDto> midList(int no) {
		return categoryDao.midList(no);
	}
	@Override
	public List<CategoryBotDto> botList(int no) {
		return categoryDao.botList(no);
	}
	
	
	
	
	@Override
	public List<CategoryMidDto> selectMid() {
		return categoryDao.getCmid();
	}
	@Override
	public List<CategoryBotDto> selectBot() {
		return categoryDao.getCbot();
	}


		/////////////////////////////////소분류 이름를 가져온다/////////////////////////////////////
		@Override
			public String getBotName(int no) {
				return categoryDao.getBotName(no);
			}
		/////////////////////////////////////검색어리스트미리보기//////////////////////////////////
		@Override
		public List<CategoryBotDto> botListText(String text) {
			return categoryDao.botListText(text);
		}
	
	
}
