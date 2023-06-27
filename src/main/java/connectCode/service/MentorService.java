package connectCode.service;

import java.util.List;

import connectCode.model.MentorDTO;
import connectCode.model.MyMentoringBean;

public interface MentorService {

	// ****************************** [작지현] ******************************
	public MentorDTO mentorProfile(MentorDTO mentor);

	public int mentorTBL_update(MentorDTO mentor);

	public int mentorPerson_update(MentorDTO mentor);

	public int service_insert(MentorDTO mentor);

	public int education_insert(MentorDTO mentor);

	
	// ****************************** [큰지현] ******************************
	public int getListCount(MyMentoringBean mymentoring);

	public List<MyMentoringBean> list(MyMentoringBean mymentoring);
	
	public int getAcceptedListCount(MyMentoringBean mymentoring);
	
	public List<MyMentoringBean> acceptedList(MyMentoringBean mymentoring);

	public int getFinishedListCount(MyMentoringBean mymentoring);
	
	public List<MyMentoringBean> finishedList(MyMentoringBean mymentoring);
	
	public int getInqueryListCount(MyMentoringBean mymentoring);

	public List<MyMentoringBean> inqueryList(MyMentoringBean mymentoring);
	
	public int inqueryBoard(MyMentoringBean mymentoring);
	
	public MyMentoringBean apply_detail(MyMentoringBean mymentoring);  //	신청모달
	
	public MyMentoringBean getDetail(int post_no);
	
	public List<MyMentoringBean> inqueryReply(int ref_post_no);
	
	public int delete_ok(int post_no);
	
	int inqueryUpdate_ok(MyMentoringBean mymentoring);
	
	public MyMentoringBean accepted_detail(MyMentoringBean mymentoring);//	예약 모달
	
	public MyMentoringBean finished_detail(MyMentoringBean mymentoring);//	지난 모달
		
	public int update_apply_ok(int mentoring_no);						//	멘토링 신청 상세 수락
		
	public int update_apply_no(int mentoring_no);						//	멘토링 신청 상세 거절

	public int update_accepted_no(MyMentoringBean mymentoring);					//	멘토링 예약 상세 예약취소
	
	public int update_accepted_ok(MyMentoringBean mymentoring);					//	멘토링 예약 상세 상담완료

	public List<MyMentoringBean> mentoringReview(int mentoring_no);
	
	public List<MyMentoringBean> acceptedCancel_reason(int mentoring_no);
	
	// ****************************** 추가 ******************************

	public List<MentorDTO> education_select(MentorDTO mentor);

	public int select_member_no(MentorDTO mentor);

	public List<MentorDTO> service_select(MentorDTO mentor);

	public List<MentorDTO> career_select(MentorDTO mentor);

	public int service_update(MentorDTO mentor);

	public int career_insert(MentorDTO mentor);

	public List<MentorDTO> license_select(MentorDTO mentor);

	public int license_insert(MentorDTO mentor);

	public int education_delete(MentorDTO mentor);

	public int apply_mentor_classification(MentorDTO mentor);

	public int delete_file(MentorDTO file_no);

	public void phoneNumber(String phone, int randomNum);

	public int career_delete(MentorDTO file_no);

	public List<MentorDTO> select_alarm(MentorDTO mentor);

	public MentorDTO select_alarm_detail(MentorDTO mentor);

	public int accepted_mentoring_count(MentorDTO mentor);
	
	public int mentoring_review_count(MentorDTO mentor);
	
	public List<MentorDTO> select_accepted_mentoring(MentorDTO mentor);
	
	public int update_alarm(int alarm_no);
	
   // ----------------------- 혜지 작성 -----------------------------
   public MentorDTO mentorDetail(int mentor_no);

   public void quit_mentor(MentorDTO member);

   public void insertquittbl(MentorDTO member);

   public void mentorNewPwd(MentorDTO member);

   public int getTotal(int member_no);





	
}
