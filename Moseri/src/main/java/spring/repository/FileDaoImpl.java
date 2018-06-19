package spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.bean.FileDto;

@Repository("fileDao")
public class FileDaoImpl implements FileDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void register_file(FileDto fileDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("register_file",fileDto);
	}
	
	
	
}
