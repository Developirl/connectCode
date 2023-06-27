package connectCode.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor
public class FindMentorDTO {
    
	
	// Mentor 테이블             
	private int mentor_no;
	private int member_no;
	private String name;
	private String gender;
	private String intro;
	private String technology;
	private String mentoring_location;
	
	// 즐겨찾기 유무 ( 0 또는 1 ) 
	private int checkedBookmark;
	
	// 리뷰수
	private int reviewcount;
	
	// 프로필 사진 url
	private String file_url;
	private String physical_name;
	
	// service 테이블 데이터 
	private String[] mentoring_payment;
	private String available_NY;
	
	//career 경력사항 테이블
	private String company;
	private int years;
	private String task;
	
	//페이징 처리를 위한 변수 
	private int startRow;
	private int endRow;
	
	
	
	
	/*
	public void setStartEndRow(FindMentorPageMaker pmk) {
		FindMentorPageMaker pm = pmk;
	    startRow = (pm.getCurrentPage()-1)*pm.getLimit()+1;
	    endRow = pm.getCurrentPage()*pm.getLimit();
		
	}*/
	
}
