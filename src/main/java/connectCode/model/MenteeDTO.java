package connectCode.model;

import java.util.Date;

import lombok.Data;

@Data
public class MenteeDTO {
	private int mentee_no;         
	private String name;                
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
	private String uuid;
	
	private int startRow;
	private int endRow;
	
	private String member;
	private String id;
	
	// ******** 혜지 추가추가 *********
	private String password;
	private String newpasswd;
	private String quit_reason;
}
