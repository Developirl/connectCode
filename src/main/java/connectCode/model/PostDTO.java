package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostDTO {
	private int post_no;
	private int ref_post_no;
	private String title;
	private String content;
	private Timestamp reg_date;
	private String reply_yn;
	private int member_no;
	private int board_no;
		
	private int startRow;
	private int endRow;
	
	private String search;
	private String keyword;
	
	private String name;
	private String reply_status;
	private int number;

}
