package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_no;
	private int rating;
	private String content;
	private Timestamp reg_date;
	private int mentoring_no;
	
	private int member_no; // 알림 insert를 위한 프로퍼티
	
}
