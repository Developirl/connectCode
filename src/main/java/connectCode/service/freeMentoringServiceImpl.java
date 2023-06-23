package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.freeMentoringMapper;
import connectCode.model.freeMentoringBoardDTO;
@Service
public class freeMentoringServiceImpl implements freeMentoringService {
	
	@Autowired
	private freeMentoringMapper mapper;
	
	
	@Override
	public List<freeMentoringBoardDTO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
}
