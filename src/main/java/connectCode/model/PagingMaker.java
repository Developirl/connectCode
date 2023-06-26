package connectCode.model;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private int currentPage;
	
	public PagingMaker(int currentPage, int total) {
		
		this.currentPage = currentPage;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(currentPage / 10.0)) * 10; //선택할 수 있는 페이지 5개씩
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0) / 10));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
