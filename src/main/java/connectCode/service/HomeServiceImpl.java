package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.HomeMapper;
import connectCode.model.FindMentorDTO;
import connectCode.model.HomeReviewListDTO;
import lombok.Setter;

@Service
public class HomeServiceImpl implements HomeService {

	@Setter(onMethod_ = @Autowired)
	private HomeMapper homeMapper;
	
	@Override
	public List<FindMentorDTO> getPopularMentorList() {
		return homeMapper.getPopularMentorList();
	}

	@Override
	public List<HomeReviewListDTO> getRecentReviewList() {
		return homeMapper.getRecentReviewList();
	}

}
