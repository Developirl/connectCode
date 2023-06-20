package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import connectCode.mapper.InqueryDao;
import connectCode.model.InqueryBean;


@Service
public class InqueryServiceImpl implements InqueryService{
	
	@Autowired
	private InqueryDao inqueryDao;

	// 게시물 갯수	
		@Override
		public int getInqueryListCount(InqueryBean inquery) throws Exception {		
			return inqueryDao.getInqueryListCount(inquery);
		}

		// 게시판 목록
		@Override
		public List<InqueryBean> inqueryList(InqueryBean inquery) throws Exception {
			// TODO Auto-generated method stub
			return inqueryDao.inqueryList(inquery);
		}
		
	
}