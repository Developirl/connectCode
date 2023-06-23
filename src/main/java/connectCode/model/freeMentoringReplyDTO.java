package connectCode.model;

import java.sql.Timestamp;


public class freeMentoringReplyDTO {
private int free_reply_no;
private int mentor_no;
private int free_no;
private int board_no;
private String name;
private Timestamp free_reply_regdate;
private String free_reply_content;
public int getFree_reply_no() {
	return free_reply_no;
}
public void setFree_reply_no(int free_reply_no) {
	this.free_reply_no = free_reply_no;
}
public int getMentor_no() {
	return mentor_no;
}
public void setMentor_no(int mentor_no) {
	this.mentor_no = mentor_no;
}
public int getFree_no() {
	return free_no;
}
public void setFree_no(int free_no) {
	this.free_no = free_no;
}
public int getBoard_no() {
	return board_no;
}
public void setBoard_no(int board_no) {
	this.board_no = board_no;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Timestamp getFree_reply_regdate() {
	return free_reply_regdate;
}
public void setFree_reply_regdate(Timestamp free_reply_regdate) {
	this.free_reply_regdate = free_reply_regdate;
}
public String getFree_reply_content() {
	return free_reply_content;
}
public void setFree_reply_content(String free_reply_content) {
	this.free_reply_content = free_reply_content;
}


}
