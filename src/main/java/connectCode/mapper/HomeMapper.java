package connectCode.mapper;

import java.util.List;

import connectCode.model.FindMentorDTO;

public interface HomeMapper {
	
	public List<FindMentorDTO> getPopularMentorList();
	
}
