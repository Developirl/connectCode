package connectCode.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class FindMentorInfoDTO {

	//career table
	private String company;
	private Date entering_date;
	private Date departure_date;
	
	//license table
	private String kind;
	private String license_name;
	private Date issuing_date;
	
	//educaton table
	private String school;
	private Date graduation_date;
	private String major;
	private String minor;
	private String degree;
	
	
	//service table
	private String mentoring_kind; // 리뷰에서도 사용
	private int mentoring_fee;
	private int service_no;
	
	//review table + mentoring table
	private String name;
	private int rating;
	private String content;
	private Timestamp reg_date; 


}
