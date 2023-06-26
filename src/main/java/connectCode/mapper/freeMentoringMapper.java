package connectCode.mapper;

import java.util.List;

import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.freeMentoringBoardDTO;
import connectCode.model.freeMentoringReplyDTO;

public interface freeMentoringMapper {
	 
	public List<freeMentoringBoardDTO> getList(freeMentoringBoardDTO free, int limitdata, int limitdata2);

	public MenteeDTO getMentee(int member_no);

	public int getFreeBoardCount(freeMentoringBoardDTO free);

	public freeMentoringBoardDTO freeRead(int free_no);

	public void updatefreeReadCount(int free_no);

	public MentorDTO getMentor(int mentor_no);

	public List<freeMentoringReplyDTO> getFreeReplyList(int free_no);

	public int getFreeReplyCount(int free_no);

	public freeMentoringReplyDTO InsertFreeReply(int free_no, String name, String free_reply_content);

	public int InsertFreeReply(freeMentoringReplyDTO freereply);

	public int DeleteFreeReply(int free_reply_no);

	public int UpdateFreeReply(int free_reply_no, String free_reply_content);

	public void updateFreeCommentCount(int free_no);

	public void updateMinusFreeCommentCount(int free_no);

	public int freeInsert(freeMentoringBoardDTO free);

	public int freeUpdate(freeMentoringBoardDTO free);

	public int deleteFree(int free_no);
}
