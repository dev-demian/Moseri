package spring.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.FileDto;
import spring.bean.ProfileDto;
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
