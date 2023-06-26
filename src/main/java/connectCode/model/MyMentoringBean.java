package connectCode.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("my_mentoring") // 이거 사용해야하나용 ? ? 
public class MyMentoringBean {
	private int mentoring_no;		//	멘토링(mentoring)
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
	
	private String name;			//	멘티(mentee)
	private String phone;
	private char gender;
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
	
	private int startRow;			 //	페이징
	private int endRow;
		
	private String acceptsearch;	 //	검색 및 select
	private String search;
	private String keyword;
}