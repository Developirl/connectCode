package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.MenteeMapper;
import connectCode.model.MenteeDTO;
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

	
}
