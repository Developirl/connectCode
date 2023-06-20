package connectCode.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import connectCode.model.InqueryBean;

@Mapper	//	sqlsession 안 써도 됨
public interface InqueryDao{

	public int getInqueryListCount(InqueryBean inquery) throws Exception;

	public List<InqueryBean> inqueryList(InqueryBean inquery);

	
}