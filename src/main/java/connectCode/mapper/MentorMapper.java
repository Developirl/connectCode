package connectCode.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	public int serviceTBL_insert(MentorDTO mentor);
	
	public List<MentorDTO> education_select(MentorDTO mentor);
	
	public int select_member_no(MentorDTO mentor);

	public List<MentorDTO> serviceTBL_select(MentorDTO mentor);
	
	public List<MentorDTO> career_select(MentorDTO mentor);
	
	public int serviceTBL_update(MentorDTO mentor);
	
	public int career_insert(MentorDTO mentor);
}

