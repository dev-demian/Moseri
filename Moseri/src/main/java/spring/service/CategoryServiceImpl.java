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
}
