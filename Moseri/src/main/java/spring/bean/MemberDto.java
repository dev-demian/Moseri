package spring.bean;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import lombok.Data;

@Data
public class MemberDto {

		String id;
		String pw;
		String salt;
		int loop;
		
		public void convert(HttpServletRequest request) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			this.setId(request.getParameter("id"));
			this.setPw(request.getParameter("pw"));
		}
		
		public void convert(ResultSet rs) throws SQLException{
			this.setId(rs.getString("id"));
			this.setPw(rs.getString("pw"));
		}
		
		
		}
 