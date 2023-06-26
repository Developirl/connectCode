package connectCode.model;

import java.sql.Date;

import lombok.Data;

@Data
// 번호, 제목, 내용, 작성자, 작성일, 답변여부
public class PostBoardDTO {
	private int post_no; // 글번호
	private int ref_post_no; // 원문글의 번호
	private int ref_step;	// 0번 : 문의합니다. 1번 : 답변입니다.
	private int board_no; // 게시판 구분코드 1. 1:1 2. 무료상담
	private Integer member_no; // JOIN
	private String title;
	private String content;
	private Date reg_date;
	private String reply_yn;
	
	//관리자 댓글 담을 변수
	private String reply;

}
