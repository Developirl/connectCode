package connectCode.service;

import java.util.List;

import connectCode.model.FindMentorDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MenteeMentoringDTO;
import connectCode.model.PostBoardDTO;
import connectCode.model.ReviewDTO;

public interface MenteeService {

	public MenteeDTO getMenteeInfo(int mentee_no);
	
	public int getLikedMentorCnt(int mentee_no);
	
	public int getReviewCnt(int mentee_no);
	
	public List<Integer> getMentoringCnt(int mentee_no);
	
	public List<FindMentorDTO> getLikedMentorList(int mentee_no);

	public boolean modifyMenteeInfo(MenteeDTO mentee);
	
	// 1:1 게시판 START **************************************************

	public List<PostBoardDTO> getInquireList(int member_no, int pageNum);
	
	public int getInquireListTotal(int member_no);
	
	public boolean insertInquire(PostBoardDTO post);
	
	public PostBoardDTO getInquire(int post_no);
	
	public boolean deleteInquire(int post_no);
	
	// 1:1 게시판 END **************************************************
	
	// ----------------------- 혜지 작성 -----------------------------
	public MenteeDTO menteeDetail(int mentee_no);

	public void quit_mentee(MenteeDTO member);

	public void insertquittbl(MenteeDTO member);

	public void menteeNewPwd(MenteeDTO member);

	// ----------------------- 지수 작성 -----------------------------
	public List<MenteeMentoringDTO> getMentoringHistory(int mentee_no);

	public int insertReview(ReviewDTO dto);

	public void sendReviewAlarm(int member_no, int mentee_no);
}
