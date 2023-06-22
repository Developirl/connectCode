package connectCode.mapper;

import java.util.List;

import connectCode.model.FindMentorDTO;
import connectCode.model.HomeReviewListDTO;

public interface HomeMapper {
	
	public List<FindMentorDTO> getPopularMentorList();
	
	public List<HomeReviewListDTO> getRecentReviewList();
}
