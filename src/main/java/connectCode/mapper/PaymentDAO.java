package connectCode.mapper;

import connectCode.model.MentoringDTO;
import connectCode.model.PaymentDTO;

public interface PaymentDAO {
	
	public void insertMentoring(MentoringDTO dto);

	public void insertPayment(MentoringDTO dto);

	public PaymentDTO getPaymentInfo(int payment_no);

	public int orderCancle(int payment_no);

}
