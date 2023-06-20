package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.MentorMapper;
import connectCode.model.MentorDTO;
import connectCode.model.MyMentoringBean;

@Service
public class MentorServiceImpl implements MentorService{
	
	@Autowired
	MentorMapper mm;

	// ****************************** [작지현] ******************************
	@Override
	public MentorDTO mentorProfile(MentorDTO mentor) {
		return mm.mentorProfile(mentor);
	}

	@Override
	public int mentorBasic_update(MentorDTO mentor) {
		return mm.mentorBasic_update(mentor);
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
		return mm.getListCount(mymentoring);
	}

	// 신청 (apply) 게시판 목록
	@Override
	public List<MyMentoringBean> list(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mm.list(mymentoring);
	}
	
	// 예약 (accepted) 게시물 갯수	
	@Override
	public int getAcceptedListCount(MyMentoringBean mymentoring) {		
		return mm.getAcceptedListCount(mymentoring);
	}
	
	// 예약 (accepted) 게시판 목록
	@Override
	public List<MyMentoringBean> acceptedList(MyMentoringBean mymentoring) {
		// TODO Auto-generated method stub
		return mm.acceptedList(mymentoring);
	}

	
}
