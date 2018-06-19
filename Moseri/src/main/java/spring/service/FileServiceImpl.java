package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.bean.FileDto;

import spring.repository.FileDao;

@Service("fileService")
public class FileServiceImpl implements FileService{
	@Autowired
	private FileDao fileDao;

	@Override
	public void registe_file(String email, String rname, String text,FileDto fileDto) {
		// TODO Auto-generated method stub
		
		fileDto.setEmail(email);
		fileDto.setPath(rname);
		fileDto.setText(text);
		
	
		fileDao.register_file(fileDto);
		
	}
	
	

}
