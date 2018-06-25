package spring.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDto {
	private int rno; //댓글 번호
	private int bno; //게시물 번호
	private String replytext; //댓글 내용
	private String replyer; //댓글 작성자 id
	private String name; //댓글 작성자 이름
	private Date regdate; //java.util.Date, 작성일자
	private Date updatedate; //수정일자
	private String secret_reply; //비밀댓글 여부
	private String writer; //member 테이블의 id
}
