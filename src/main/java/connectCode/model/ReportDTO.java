package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportDTO {
	private int report_no;
	private String content;
	private Timestamp reg_date;
	private int reporter_file;
	private int reported_file;
	private String reported_response;
	private int classification;
	private int mentoring_no;
	
	// 조인
	private int mentor_no;
	private int mentee_no;
	private int service_no;
	private String mentor_name;
	private String mentee_name;
	private String report_state;
	private int number;
	
	private int startRow;
	private int endRow;
}
