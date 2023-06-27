package connectCode.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import connectCode.mapper.MentorDao;
import connectCode.mapper.MentorMapper;
import connectCode.model.MentorDTO;
import connectCode.model.MyMentoringBean;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MentorServiceImpl implements MentorService{
	
	@Autowired
	private MentorMapper mm;
	
	@Autowired
	private MentorDao mentorDao;
	
	@Value("${phone_hj_1}")
	private String phonekey1;

	@Value("${phone_hj_2}")
	private String phonekey2;

	@Value("${hjphone}")
	private String myphone;

	// ****************************** [작지현] ******************************
	@Override
	public MentorDTO mentorProfile(MentorDTO mentor) {
		return mm.mentorProfile(mentor);
	}

	@Override
	public int mentorTBL_update(MentorDTO mentor) {
		return mm.mentorTBL_update(mentor);
	}

	@Override
	public int mentorPerson_update(MentorDTO mentor) {
		return mm.mentorPerson_update(mentor);
	}

	@Override
	public int service_insert(MentorDTO mentor) {
		return mm.service_insert(mentor);
	}

	@Override
	public int education_insert(MentorDTO mentor) {
		return mm.education_insert(mentor);
	}

	
	// ****************************** [큰지현] ******************************
	// 신청 (apply) 게시물 갯수	
	@Override
	public int getListCount(MyMentoringBean mymentoring) {		
		return mentorDao.getListCount(mymentoring);
	}

	// 신청 (apply) 게시판 목록
	@Override
	public List<MyMentoringBean> list(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.list(mymentoring);
	}
	
	// 예약 (accepted) 게시물 갯수	
	@Override
	public int getAcceptedListCount(MyMentoringBean mymentoring) {		
		return mentorDao.getAcceptedListCount(mymentoring);
	}
	
	// 예약 (accepted) 게시판 목록
	@Override
	public List<MyMentoringBean> acceptedList(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.acceptedList(mymentoring);
	}
	
	// 일대일 문의 게시물 갯수	
	@Override
	public int getInqueryListCount(MyMentoringBean mymentoring) {		
		return mentorDao.getInqueryListCount(mymentoring);
	}

	// 일대일 문의 게시판 목록
	@Override
	public List<MyMentoringBean> inqueryList(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.inqueryList(mymentoring);	
	}
	
	//	일대일 게시판 폼 입력
	@Override
	public int inqueryBoard(MyMentoringBean mymentoring) {
		return mentorDao.inqueryBoard(mymentoring);
	}
	
	//	지난 멘토링 게시물 갯수
	@Override
	public int getFinishedListCount(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.getFinishedListCount(mymentoring);
	}
	//	지난 멘토링 게시판 목록
	@Override
	public List<MyMentoringBean> finishedList(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.finishedList(mymentoring);	
	}
	
	//	멘토링 신청 상세
	@Override
	public MyMentoringBean apply_detail(MyMentoringBean mymentoring) {
		return mentorDao.apply_detail(mymentoring);
	}
	
	//	일대일 문의 상세
	@Override
	public MyMentoringBean getDetail(int post_no) {
		// TODO Auto-generated method stub
		return mentorDao.getDetail(post_no);
	}
	
	//	일대일 답글
	@Override
	public List<MyMentoringBean> inqueryReply(int ref_post_no) {
		// TODO Auto-generated method stub
		return mentorDao.inqueryReply(ref_post_no);
	}
	
	//	일대일 문의 수정
	@Override
	public int inqueryUpdate_ok(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.inqueryUpdate_ok(mymentoring);
	}
	
	//	일대일 문의 삭제
	@Override
	public int delete_ok(int post_no) {
		// TODO Auto-generated method stub
		return mentorDao.delete_ok(post_no);
	}
	
	@Override
	public MyMentoringBean accepted_detail(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.accepted_detail(mymentoring);
	}
	
	@Override
	public MyMentoringBean finished_detail(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mentorDao.finished_detail(mymentoring);
	}

	@Override
	public int update_apply_ok(int mentoring_no) {	//	멘토링 신청 상세 수락
		// TODO Auto-generated method stub
		return mentorDao.update_apply_ok(mentoring_no);
	}

	@Override
	public int update_apply_no(int mentoring_no) {	//	멘토링 신청 상세 거절
		// TODO Auto-generated method stub
		return mentorDao.update_apply_no(mentoring_no);
	}

	@Override
	public int update_accepted_no(MyMentoringBean mymentoring) {	//	멘토링 예약 상세 예약취소
		// TODO Auto-generated method stub
		return mentorDao.update_accepted_no(mymentoring);
	}

	@Override
	public int update_accepted_ok(MyMentoringBean mymentoring) {	//	멘토링 예약 상세 상담완료
		// TODO Auto-generated method stub
		return mentorDao.update_accepted_ok(mymentoring);
	}

	@Override
	public List<MyMentoringBean> mentoringReview(int mentoring_no) {	//	지난 멘토링 상담완료 리뷰
		// TODO Auto-generated method stub
		return mentorDao.mentoringReview(mentoring_no);
	}

	@Override
	public List<MyMentoringBean> acceptedCancel_reason(int mentoring_no) {
		// TODO Auto-generated method stub
		return mentorDao.acceptedCancel_reason(mentoring_no);
	}

	
	// ****************************** 추가 ******************************

	@Override
	public List<MentorDTO> education_select(MentorDTO mentor) {
		return mm.education_select(mentor);
	}

	@Override
	public int select_member_no(MentorDTO mentor) {
		return mm.select_member_no(mentor);
	}

	@Override
	public List<MentorDTO> service_select(MentorDTO mentor) {
		return mm.service_select(mentor);
	}

	@Override
	public List<MentorDTO> career_select(MentorDTO mentor) {
		return mm.career_select(mentor);
	}

	@Override
	public int service_update(MentorDTO mentor) {
		return mm.service_update(mentor);
	}

	@Override
	public int career_insert(MentorDTO mentor) {
		return mm.career_insert(mentor);
	}

	@Override
	public List<MentorDTO> license_select(MentorDTO mentor) {
		return mm.license_select(mentor);
	}

	@Override
	public int license_insert(MentorDTO mentor) {
		return mm.license_insert(mentor);
	}

	@Override
	public int education_delete(MentorDTO mentor) {
		return mm.education_delete(mentor);
	}

	@Override
	public int apply_mentor_classification(MentorDTO mentor) {
		return mm.apply_mentor_classification(mentor);
	}

	@Override
	public int delete_file(MentorDTO file_no) {
		return mm.delete_file(file_no);
	}

	@Override
	public void phoneNumber(String phone, int randomNum) {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[ConnectCode] 인증번호는" + "[" + randomNum + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	@Override
	public int career_delete(MentorDTO file_no) {
		return mm.career_delete(file_no);
	}

	@Override
	public List<MentorDTO> select_alarm(MentorDTO mentor) {
		return mm.select_alarm(mentor);
	}

	@Override
	public MentorDTO select_alarm_detail(MentorDTO mentor) {
		return mm.select_alarm_detail(mentor);
	}
	
	@Override
	public int accepted_mentoring_count(MentorDTO mentor) {
		return mm.accepted_mentoring_count(mentor);
	}
	
	@Override
	public int mentoring_review_count(MentorDTO mentor) {
		return mm.mentoring_review_count(mentor);
	}
	
	@Override
	public List<MentorDTO> select_accepted_mentoring(MentorDTO mentor) {
		return mm.select_accepted_mentoring(mentor);
	}
	
	@Override
	public int update_alarm(int alarm_no) {
		return mm.update_alarm(alarm_no);
	}
	
   // ***************** 혜지 추가 *******************
   @Override
   public MentorDTO mentorDetail(int mentor_no) {
      return mm.mentorDetail(mentor_no);
   }

   @Override
   public void quit_mentor(MentorDTO member) {
      mm.quit_mentor(member);
   }

   @Override
   public void insertquittbl(MentorDTO member) {
      mm.insertquittbl(member);
   }

   @Override
   public void mentorNewPwd(MentorDTO member) {
      mm.mentorNewPwd(member);
   }
   
   @Override
   public int getTotal(int member_no) {
      return mm.getTotal(member_no);
   }

	
}
