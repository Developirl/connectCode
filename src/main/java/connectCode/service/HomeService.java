package connectCode.service;

import java.util.List;

import connectCode.model.FindMentorDTO;
import connectCode.model.HomeReviewListDTO;

public interface HomeService {
	
	//이달의 인기 멘토 가지고오기
	public List<FindMentorDTO> getPopularMentorList();
	
	public List<HomeReviewListDTO> getRecentReviewList();
}
