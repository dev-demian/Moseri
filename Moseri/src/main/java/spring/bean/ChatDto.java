package spring.bean;

import lombok.Data;

@Data
public class ChatDto {
	private int no;
	private String fromID;
	private String toID;
	private String chatContent;
	private int matchNo;
	private String chatTime;
	
}
