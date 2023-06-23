package connectCode.mapper;

import java.util.List;

import connectCode.model.MenteeDTO;

public interface MenteeMapper {

	
	public MenteeDTO getMenteeInfo(int mentee_no);
	
	public int getLikedMentorCnt(int mentee_no);
	
	public int getReviewCnt(int mentee_no);
	
	public List<Integer> getMentoringCnt(int mentee_no);
}
