
package spring.service;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.metal.MetalMenuBarUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;import ch.qos.logback.core.rolling.helper.IntegerTokenConverter;
import spring.bean.MemberDto;
import spring.repository.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Autowired
	private EncryptService sha256;

	private RowMapper<MemberDto> mapper = new RowMapper<MemberDto>() {

		@Override
		public MemberDto mapRow(ResultSet rs, int index) throws SQLException {

			MemberDto MemberDto = new MemberDto();
			MemberDto.convert(rs);

			return MemberDto;
		}
	};
	private ResultSetExtractor<MemberDto> extractor = new ResultSetExtractor<MemberDto>() {

		@Override
		public MemberDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if (rs.next()) {
				MemberDto MemberDto = new MemberDto();
				MemberDto.convert(rs);
				return MemberDto;
			}

			return null;
		}
	};
 
	// 회원가입
	@Override
	public void register(HttpServletRequest request, MemberDto memberDto) throws Exception {

		// [1] 파라미터 받기
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setName(request.getParameter("name"));
		memberDto.setSalt(UUID.randomUUID().toString());
		memberDto.setLoop((int) (Math.random() * 9) + 1);
		String encpw = sha256.encrypt(memberDto.getPwd(), memberDto.getSalt(), memberDto.getLoop());
		memberDto.setPwd(encpw);
		memberDto.setPhone(request.getParameter("phone"));
		memberDto.setSex(request.getParameter("sex"));
		memberDto.setDistance(request.getParameter("distance"));
		memberDto.setAddr(request.getParameter("addr"));
		memberDto.setLat(Float.parseFloat(request.getParameter("lat")));
		memberDto.setLongi(Float.parseFloat(request.getParameter("longi")));

		// [2] DB처리
		memberDao.register(memberDto);
	}

	// 로그인
	@Override
	public boolean login(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto)
			throws Exception {

		memberDto.setEmail(request.getParameter("id"));
		
		//DB 아디 존재 여부를 위한 메소드
		MemberDto id_exist = memberDao.get(memberDto.getEmail());

		boolean result = false;
		
		MemberDto db_mdto = new MemberDto();
		
			if(!(id_exist ==null)) {  // 아이디가 null이 아니면 
			db_mdto = memberDao.login(memberDto.getEmail());
			
			String db_id = db_mdto.getEmail();
			String db_pwd = db_mdto.getEmail();
			String pram_id = memberDto.getEmail();
			String encpw = sha256.encrypt(memberDto.getPwd(), db_mdto.getSalt(), db_mdto.getLoop());
			memberDto.setPwd(encpw);
			String pram_pw = memberDto.getPwd();
			
			if (db_id.equals(pram_id) && db_pwd.equals(pram_pw)) {
				result = true;
				// 추후 세션 추가
			} else {
				result = false;
			}
			}else {
				result = false;
			}
			return result;
		
	}
}
