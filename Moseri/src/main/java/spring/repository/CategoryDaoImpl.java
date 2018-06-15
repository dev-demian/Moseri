package spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.CategoryBotDto;
import spring.bean.CategoryMidDto;
import spring.bean.CategoryTopDto;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<CategoryTopDto> getList() {
		return sqlSession.selectList("getList");
	}
	@Override
	public List<CategoryMidDto> midList(int no) {
		return sqlSession.selectList("midList",no);
	}
	@Override
	public List<CategoryBotDto> botList(int no) {
		return sqlSession.selectList("botList",no);
	}
}
