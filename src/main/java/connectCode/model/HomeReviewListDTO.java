package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HomeReviewListDTO {
	private int mentor_no;
	private String mentor_name;
	private String mentoring_kind;
	private String mentee_name;
	private Timestamp reg_date;
	private int rating;
	private String content;
}
