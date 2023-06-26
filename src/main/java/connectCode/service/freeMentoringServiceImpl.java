package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.freeMentoringMapper;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.freeMentoringBoardDTO;
import connectCode.model.freeMentoringReplyDTO;
@Service
public class freeMentoringServiceImpl implements freeMentoringService {
	
	@Autowired
	private freeMentoringMapper mapper;
	
	@Override
	public int freeInsert(freeMentoringBoardDTO free) {
		// TODO Auto-generated method stub
		return mapper.freeInsert(free);
	}
	
	@Override
	public int freeUpdate(freeMentoringBoardDTO free) {
		// TODO Auto-generated method stub
		return mapper.freeUpdate(free);
	}
	
	@Override
	public int deleteFree(int free_no) {
		// TODO Auto-generated method stub
		return mapper.deleteFree(free_no);
	}

	////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<freeMentoringBoardDTO> getList(freeMentoringBoardDTO free, int limitdata, int limitdata2) {
		// TODO Auto-generated method stub
		return mapper.getList(free, limitdata, limitdata2);
	}
	
	@Override
	public MenteeDTO getMentee(int member_no) {
		// TODO Auto-generated method stub
		return mapper.getMentee(member_no);
	}
	
	// 총 개수
	@Override
	public int getFreeBoardCount(freeMentoringBoardDTO free) {
		// TODO Auto-generated method stub
		return mapper.getFreeBoardCount(free);
	}
	
	@Override
	public freeMentoringBoardDTO freeRead(int free_no) {
		// TODO Auto-generated method stub
		return mapper.freeRead(free_no);
	}
	
	@Override
	public void updatefreeReadCount(int free_no) {
		// TODO Auto-generated method stub
		mapper.updatefreeReadCount(free_no);
	}
	
	@Override
	public MentorDTO getMentor(int mentor_no) {
		// TODO Auto-generated method stub
		return mapper.getMentor(mentor_no);
	}
	
	@Override
	public List<freeMentoringReplyDTO> getFreeReplyList(int free_no) {
		// TODO Auto-generated method stub
		return mapper.getFreeReplyList(free_no);
	}
	
	@Override
	public int getFreeReplyCount(int free_no) {
		// TODO Auto-generated method stub
		return mapper.getFreeReplyCount(free_no);
	}
	
	@Override
	public int InsertFreeReply(freeMentoringReplyDTO freereply) {
		// TODO Auto-generated method stub
		return mapper.InsertFreeReply(freereply);
	}
	
	@Override
	public int DeleteFreeReply(int free_reply_no) {
		// TODO Auto-generated method stub
		return mapper.DeleteFreeReply(free_reply_no);
	}
	
	@Override
	public int UpdateFreeReply(int free_reply_no, String free_reply_content) {
		// TODO Auto-generated method stub
		return mapper.UpdateFreeReply(free_reply_no, free_reply_content);
	}
	
	@Override
	public void updateFreeCommentCount(int free_no) {
		// TODO Auto-generated method stub
		mapper.updateFreeCommentCount(free_no);
	}
	
	@Override
	public void updateMinusFreeCommentCount(int free_no) {
		// TODO Auto-generated method stub
		mapper.updateMinusFreeCommentCount(free_no);
	}
}
