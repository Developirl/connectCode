package connectCode.model;


import java.sql.Timestamp;


public class freeMentoringBoardDTO {

	private int free_no; //pk
	private int mentee_no;//fk;
	private String free_title;
	private String free_content;
	private String name;
	private Timestamp free_regdate;
	private int readcount;
	private int free_comment_count;
	
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public int getMentee_no() {
		return mentee_no;
	}
	public void setMentee_no(int mentee_no) {
		this.mentee_no = mentee_no;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getFree_regdate() {
		return free_regdate;
	}
	public void setFree_regdate(Timestamp free_regdate) {
		this.free_regdate = free_regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getFree_comment_count() {
		return free_comment_count;
	}
	public void setFree_comment_count(int free_comment_count) {
		this.free_comment_count = free_comment_count;
	}
	
}
