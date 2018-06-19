package spring.bean;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileDto {
	//NO
	private String email;
	private String path;
	private String text;
	



	public void convert(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		this.setEmail(request.getParameter("email"));
		this.setPath(request.getParameter("path"));
		this.setText(request.getParameter("text"));
		//파일도 추가
		
		
	}
	
}
