package spring.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.FileDto;

@Service
public interface FileService {

	public void registe_file(String email, String rname,String text, FileDto fileDto);
}
