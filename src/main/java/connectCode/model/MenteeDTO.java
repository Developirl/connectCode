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
	private Character uuid;
	
	private int startRow;
	private int endRow;
}