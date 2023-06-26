package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.MenteeMapper;
import connectCode.model.FindMentorDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MenteeMentoringDTO;
import connectCode.model.PostBoardDTO;
import connectCode.model.ReviewDTO;
import lombok.Setter;

@Service
public class MenteeServiceImpl implements MenteeService{
	
	@Setter(onMethod_ = @Autowired)
	private MenteeMapper menteeMapper;
	
	@Override
	public MenteeDTO getMenteeInfo(int mentee_no) {
		return menteeMapper.getMenteeInfo(mentee_no);
	}

	@Override
	public int getLikedMentorCnt(int mentee_no) {
		return menteeMapper.getLikedMentorCnt(mentee_no);
	}

	@Override
	public int getReviewCnt(int mentee_no) {
		return menteeMapper.getReviewCnt(mentee_no);
	}

	@Override
	public List<Integer> getMentoringCnt(int mentee_no) {
		return menteeMapper.getMentoringCnt(mentee_no);
	}

	@Override
	public List<FindMentorDTO> getLikedMentorList(int mentee_no) {
		return menteeMapper.getLikedMentorList(mentee_no);
	}

	@Override
	public boolean modifyMenteeInfo(MenteeDTO mentee) {
		return menteeMapper.modifyMenteeInfo(mentee) == 1;
	}
	
	// 1:1 게시판 START **************************************************
	@Override
	public List<PostBoardDTO> getInquireList(int member_no, int pageNum) {
		int firstLow = (pageNum-1)*10;
		return menteeMapper.getInquireList(member_no, firstLow);
	}
	
	@Override
	public int getInquireListTotal(int member_no) {
		return menteeMapper.getInquireListTotal(member_no);
	}

	@Override
	public boolean insertInquire(PostBoardDTO post) {
		return menteeMapper.insertInquire(post) == 1;
	}
	
	@Override
	public PostBoardDTO getInquire(int post_no) {
		
		PostBoardDTO post = menteeMapper.getInquire(post_no);
		if(post.getReply_yn().equals("Y")) {
			post.setReply(menteeMapper.getInquireReply(post_no));
		}
		
		return post; 
	}
	
	@Override
	public boolean deleteInquire(int post_no) {
		return menteeMapper.deleteInquire(post_no) > 0;
	}
	
	// --------------------------------- 혜지 작성 --------------------------------------------
	@Override
	public MenteeDTO menteeDetail(int mentee_no) {
		return menteeMapper.menteeDetail(mentee_no);
	}

	@Override
	public void quit_mentee(MenteeDTO member) {
		menteeMapper.quit_mentee(member);
	}

	@Override
	public void insertquittbl(MenteeDTO member) {
		menteeMapper.insertquittbl(member);
	}

	@Override
	public void menteeNewPwd(MenteeDTO member) {
		menteeMapper.menteeNewPwd(member);
	}
	
	
	// --------------------------------- 지수 작성 --------------------------------------------
	@Override
	public List<MenteeMentoringDTO> getMentoringHistory(int mentee_no) {
		return menteeMapper.getMentoringHistory(mentee_no);
	}
	
	@Override
	public int insertReview(ReviewDTO dto) {
		return menteeMapper.insertReview(dto);
	}
	
	
	
	@Override
	public void sendReviewAlarm(int member_no, int mentee_no) {
		menteeMapper.sendReviewAlarm(member_no,mentee_no);
	}
}
