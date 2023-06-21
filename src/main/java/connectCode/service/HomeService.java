package connectCode.service;

import java.util.List;

import connectCode.model.FindMentorDTO;

public interface HomeService {
	
	//이달의 인기 멘토 가지고오기
	public List<FindMentorDTO> getPopularMentorList();
}
