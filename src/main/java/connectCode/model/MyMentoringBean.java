package connectCode.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("my_mentoring") // 이거 사용해야하나용 ? ? 
public class MyMentoringBean {
	private int mentoring_no;		 //	멘토링(mentoring)
	private String request_content;
	private Timestamp apply_time;
	private Timestamp reserve_date;
	private int classification;
	private String location;
	private int file_no;
	private String comment;
	private String cancel_reason;
	private int mentee_no;
	private int service_no;	
	
	private String name;			 //	멘티(mentee)
	private String phone;
	private String gender;
	private Date birthday;
	private String email;
	private String mentoring_location;
	private String desired_job;
	private String technology_stack;
	private String git;
	private String blog;
	private String bank;
	private String account;
	private String account_name;
	private int member_no;
	
	private String mentoring_kind;   //	서비스(service)
	private int mentoring_fee;       
	private int mentor_no;
	
	private int board_no;			 //	게시판
	private String board_name;         
	private String board_kind;       
	private String board_url;
	
	private int post_no;			 //	게시글
	private int ref_post_no;
	private String title;
	private String content;
	private Timestamp reg_date;
	private String reply_yn;		 // 원래 char인데 오류떠서 String으로 변경
	private int ref_step; 
	
	private int review_no;			 //	리뷰 (review)
	private int rating;
	
	private int file_serial_number;	 //	파일(file)
	private String origin_name;
	private String physical_name;
	private String file_url;
	private int size;
	private String extension;
	
	private int startRow;			 //	페이징
	private int endRow;
		
	private String id;	//세션id
	
	private String acceptsearch;	 //	검색 및 select
	private String search;
	private String keyword;
}