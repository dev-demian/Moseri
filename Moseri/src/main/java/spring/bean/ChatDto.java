package spring.bean;

import lombok.Data;

@Data
public class ChatDto {
	private int no;
	private int matchNo;
	private String fromID;
	private String toID;
	private String chatContent;
	private String chatTime;
	
}
