package connectCode.model;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class freeMentoringBoardDTO {

	private int free_no; //pk
	private int mentee_no;//fk;
	private String free_title;
	private String free_content;
	private String name;
	private Timestamp free_regdate;
	private int readcount;
	private int free_comment_count;
	
	// pageing 처리
	private int startRow;
	private int endRow;
	
	//검색
	private String search;
	private String keyword;
	
	
	
}
