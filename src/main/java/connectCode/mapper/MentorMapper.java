package connectCode.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import connectCode.model.FileDTO;
import connectCode.model.MentorDTO;
import connectCode.model.MyMentoringBean;
@Mapper
public interface MentorMapper {

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
	
	public int career_delete(MentorDTO file_no);
	
	public List<MentorDTO> select_alarm(MentorDTO mentor);
	
	public MentorDTO select_alarm_detail(MentorDTO mentor);
	
	public int accepted_mentoring_count(MentorDTO mentor);

	public int mentoring_review_count(MentorDTO mentor);
	
	public List<MentorDTO> select_accepted_mentoring(MentorDTO mentor);
	
	public int update_alarm(int alarm_no);
	
	public List<FileDTO> select_file(int file_no);
	
   // ******************* 혜지 작성 *****************************
   public MentorDTO mentorDetail(int mentor_no);

   public void quit_mentor(MentorDTO member);

   public void insertquittbl(MentorDTO member);

   public void mentorNewPwd(MentorDTO member);
   
   public int getTotal(int member_no);
	
}

