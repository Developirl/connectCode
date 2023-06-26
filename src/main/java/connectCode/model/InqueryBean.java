package connectCode.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("inquery")
public class InqueryBean{	//	일대일 문의 게시판
	private int board_no;	//	게시판
	private String board_name;         
	private String board_kind;       
	private String board_url;
	
	private int post_no;	//	게시글
	private int ref_post_no;
	private String title;
	private String content;
	private Timestamp reg_date;
	private String reply_yn;// 원래 char인데 오류떠서 String으로 변경
	private int member_no;
	private int ref_step; 
	
	private int startRow;	//	페이징 처리
	private int endRow;
	
	private String search;
}
