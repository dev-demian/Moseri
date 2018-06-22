package spring.bean;

import lombok.Data;

@Data
public class UsersDto {
	private int userno;
	private String email;
	private String pwd;
	private String salt;
	private int loop;
	private String nickname;
	private String phone;
	private String addr;
	private int lat;
	private int longi;
	private int c_bno;
	private int granted;
	private String sex;
	private String reg;
	private int pno;
	private String distance;
	private char noticelimit;
	private char pnoticelimit;
	private char nnoticelimit;
}
