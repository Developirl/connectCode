package connectCode.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import connectCode.model.MyMentoringBean;

@Mapper	//	sqlsession 안 써도 됨
public interface MentorDao{

	public int getListCount(MyMentoringBean mymentoring);

	public List<MyMentoringBean> list(MyMentoringBean mymentoring);

	public int getAcceptedListCount(MyMentoringBean mymentoring);

	public List<MyMentoringBean> acceptedList(MyMentoringBean mymentoring);
	
	public int getInqueryListCount(MyMentoringBean mymentoring);

	public List<MyMentoringBean> inqueryList(MyMentoringBean mymentoring);
	
	public int getFinishedListCount(MyMentoringBean mymentoring);

	public List<MyMentoringBean> finishedList(MyMentoringBean mymentoring);
	
	public int inqueryBoard(MyMentoringBean mymentoring);

	public MyMentoringBean apply_detail(MyMentoringBean mymentoring);	//	신청 모달
	
	public MyMentoringBean getDetail(int post_no);	//	상세 정보 
	
	public MyMentoringBean accepted_detail(MyMentoringBean mymentoring);//	예약 모달
	
	public MyMentoringBean finished_detail(MyMentoringBean mymentoring);//	지난 모달
	
	public List<MyMentoringBean> inqueryReply(int ref_post_no);	//	답글 list
	
	public int inqueryUpdate_ok(MyMentoringBean mymentoring);	//	일대일 수정
	
	public int delete_ok(int post_no);	//	일대일 삭제
	
	public int update_apply_ok(int mentoring_no);				//	멘토링 신청 상세 수락
	
	public int update_apply_no(int mentoring_no);				//	멘토링 신청 상세 거절

	public int update_accepted_no(MyMentoringBean mymentoring);			//	멘토링 예약 상세 예약취소
	
	public int update_accepted_ok(MyMentoringBean mymentoring);			//	멘토링 예약 상세 상담완료
	
	public List<MyMentoringBean> mentoringReview(int mentoring_no);
	
	public List<MyMentoringBean> acceptedCancel_reason(int mentoring_no);
	
	// *********************************** 삭제 해야돼 ***********************************

	public MyMentoringBean mentorProfile(MyMentoringBean mymentoring);



	
}