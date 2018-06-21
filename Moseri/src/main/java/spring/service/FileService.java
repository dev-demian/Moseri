package spring.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.FileDto;
import spring.bean.ProfileDto;

@Service
public interface FileService {

	public void registe_file(String email, String rname,String text, FileDto fileDto);
	
	
}
