package connectCode.service;

import lombok.Data;

@Data
public class FindMentorPageMaker {

	private int limit;        // 페이지에서 보여줄 총 레코드 수
	private int currentPage;  // 현재 페이지 번호
	private int total;        // board 테이블의 총 레코드 수
	private int block;        // 페이저 처리를 위한 보여줄 버튼 개수
	private int pageCount;    // total과 limit으로 따졌을 때 총 생성해야할 페이지 수
	private int startPage;    // 페이저에서 시작 번호
	private int endPage;      // 페이저에서 끝 번호
	private int number;       // 해당 페이지의 맨 위 게시글 No.
	private int startRow;     // 한 페이지의 시작 번호
	private int endRow;       // 한 페이지의 끝 번호
	
	
	private String gender;
	private String technology;
	private String mentoring_location;
	
	
	public FindMentorPageMaker(int limit,int currentPage, int total, int block) {
		this.limit = limit;
		this.currentPage = currentPage;
		this.total = total;
		this.block = block;
		
		number = total-(currentPage-1)*limit;
		pageCount = (total/limit)+((total%limit)>0?1:0);
		startPage = ((currentPage-1)/block)*block+1;
		endPage = Math.min((startPage+block-1), pageCount);
	}
	
	
}
