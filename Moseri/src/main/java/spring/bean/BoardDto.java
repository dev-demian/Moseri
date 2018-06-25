package spring.bean;

import java.util.Date;

import lombok.Data;
@Data
public class BoardDto {

	private int bno;
	private String title;
	private String content;
	private String writer; //작성자 id
	private Date regdate; //java.util.Date
	private int viewcnt;
	private String name; //작성자 이름
	private int cnt; //댓글 갯수
	private String show; //화면 표시 여부
	private String[] files; //첨부파일 이름 배열
}
