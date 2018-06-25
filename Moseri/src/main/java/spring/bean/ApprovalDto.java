package spring.bean;

import lombok.Data;

@Data
public class ApprovalDto {

	private int no;
	private String email;
	private String nickname;
	private String path;
	private int granted;
	private String message;
	private String reg;
}
