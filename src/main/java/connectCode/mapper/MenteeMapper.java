package connectCode.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import connectCode.model.FindMentorDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MenteeMentoringDTO;
import connectCode.model.PostBoardDTO;
import connectCode.model.ReviewDTO;

public interface MenteeMapper {

	
	public MenteeDTO getMenteeInfo(int mentee_no);
	
	public int getLikedMentorCnt(int mentee_no);
	
	public int getReviewCnt(int mentee_no);
	
	public List<Integer> getMentoringCnt(int mentee_no);
	
	public List<FindMentorDTO> getLikedMentorList(int mentee_no);

	public int modifyMenteeInfo(MenteeDTO mentee);
	
	// 1:1게시판 CRUD START
	public List<PostBoardDTO> getInquireList(@Param("member_no") int member_no, @Param("firstLow") int firstLow);
	
	public int getInquireListTotal(int member_no);
	
	public int insertInquire(PostBoardDTO post);
	
	public PostBoardDTO getInquire(int post_no);
	
	public String getInquireReply(int ref_post_no);
	
	public int deleteInquire(int post_no);
	// 1:1게시판 CRUD END
	
	// -------------------------- 혜지 작성 -------------------------------
	public MenteeDTO menteeDetail(int mentee_no);

	public void quit_mentee(MenteeDTO member);

	public void insertquittbl(MenteeDTO member);

	public void menteeNewPwd(MenteeDTO member);
	// -------------------------- 혜지 작성 -------------------------------
		
	// -------------------------- 지수 작성 -------------------------------
	public List<MenteeMentoringDTO> getMentoringHistory(int mentee_no);

	public int insertReview(ReviewDTO dto);

	public void sendReviewAlarm(@Param("member_no") int member_no,@Param("mentee_no") int mentee_no);
	// -------------------------- 지수  작성 -------------------------------
}
