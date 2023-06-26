package connectCode.service;

import java.util.List;

import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.freeMentoringBoardDTO;
import connectCode.model.freeMentoringReplyDTO;

public interface freeMentoringService {

	List<freeMentoringBoardDTO> getList(freeMentoringBoardDTO free, int limitdata, int limitdata2);

	MenteeDTO getMentee(int member_no);

	int getFreeBoardCount(freeMentoringBoardDTO free);

	freeMentoringBoardDTO freeRead(int free_no);

	void updatefreeReadCount(int free_no);

	MentorDTO getMentor(int mentor_no);

	List<freeMentoringReplyDTO> getFreeReplyList(int free_no);

	int getFreeReplyCount(int free_no);

	int InsertFreeReply(freeMentoringReplyDTO freereply);

	int DeleteFreeReply(int free_reply_no);

	int UpdateFreeReply(int free_reply_no, String free_reply_content);

	void updateFreeCommentCount(int free_no);

	void updateMinusFreeCommentCount(int free_no);

	int freeInsert(freeMentoringBoardDTO free);

	int freeUpdate(freeMentoringBoardDTO free);

	int deleteFree(int free_no);

}
