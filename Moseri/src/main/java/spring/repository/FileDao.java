package spring.repository;

import org.springframework.stereotype.Repository;

import spring.bean.FileDto;

@Repository
public interface FileDao {

	void register_file(FileDto fileDto);
	
	
}
