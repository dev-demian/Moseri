package spring.bean;

import lombok.Data;

@Data
public class MatchingDto {
	private int no;
	private String gosu_email;
	private int request_no;
	private String nomal_email;
	private int estimate_no;
	private int gosu_end;
	private int nomal_end;
	private int m_result;
	//16.추가(두산)
		private String reg;
		private String ttl;
		//16.추가(두산)
}
