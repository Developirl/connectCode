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
	public int getListCount(MyMentoringBean mymentoring) throws Exception;

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

	public int education_update(MentorDTO mentor);

	
}
