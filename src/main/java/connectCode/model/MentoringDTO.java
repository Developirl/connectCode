package connectCode.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MentoringDTO {
	
	private int mentoring_no;
	private String request_content;
	private Timestamp apply_time;
	private Timestamp reserve_date; //controller 에서 timestamp로 만들어주기
	private int classification;
	private String location;
	private int file_no;
	private String comment;
	private String cancel_reason;
	private int mentee_no;
	private int service_no;
	private String git_yn;
	private String blog_yn;
	
	// file 업로드 용 변수
	private List<MultipartFile> files = new ArrayList<>();
}
