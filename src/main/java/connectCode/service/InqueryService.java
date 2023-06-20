package connectCode.service;

import java.util.List;

import org.springframework.stereotype.Service;

import connectCode.model.InqueryBean;

@Service
public interface InqueryService {

	public int getInqueryListCount(InqueryBean inquery) throws Exception;

	public List<InqueryBean> inqueryList(InqueryBean inquery) throws Exception;

}