package spring.bean;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import lombok.Data;

@Data
public class MemberDto {

		String email;
		String pwd;
		String salt;
		String nickname;
		String phone;
		String sex;
		String distance;
		String addr;
		float lat;
		float longi;
		int c_bno;
		int loop;
		
		public void convert(HttpServletRequest request) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			this.setEmail(request.getParameter("email"));
			this.setPwd(request.getParameter("pwd"));
			this.setNickname(request.getParameter("nickname"));
			this.setPhone(request.getParameter("phone"));
			this.setSex(request.getParameter("sex"));
			this.setDistance(request.getParameter("distance"));
			this.setAddr(request.getParameter("addr"));
			this.setLat(Float.parseFloat(request.getParameter("lat")));
			this.setLongi(Float.parseFloat(request.getParameter("longi")));
			this.setC_bno(Integer.parseInt(request.getParameter("c_bno")));
			
			
		}
		
		public void convert(ResultSet rs) throws SQLException{
			this.setEmail(rs.getString("email"));
			this.setPwd(rs.getString("pwd"));
			
		}
		}
 