package connectCode.controller;

import java.io.IOException;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import connectCode.model.MentoringDTO;
import connectCode.service.FindMentorService;
import connectCode.service.PaymentService;

@Controller
@RequestMapping("/payment/*")
public class MentoringPayment {

	@Value("${iamport_key}")
	private String apiKey;

	@Value("${iamport_secret}")
	private String apiSecret;

	
	@Autowired
	private PaymentService payService;
	
	@Autowired
	private FindMentorService findMentor;
	
	@Autowired
	private FindMentorService fmservice;



	// 결제 검증
	@ResponseBody
	@PostMapping(value = "/order/verify_iamport/{imp_uid}")
	public IamportResponse<Payment> verifyIamportPost(@PathVariable(value = "imp_uid") String imp_uid)
			throws IamportResponseException, IOException {
		
		IamportClient client = new IamportClient(apiKey,apiSecret);
		
		return client.paymentByImpUid(imp_uid);
	}


	// 진짜 결제
	// @RequestMapping(value ="order/complete", consumes = "application/json")
	@ResponseBody
	@RequestMapping(value = "/order/complete", method = RequestMethod.POST)
	public int paymentComplete(@RequestBody MentoringDTO mentoringDTO) throws Exception {

		 Timestamp time = fmservice.getReserveDate(mentoringDTO.getReserve_day(), mentoringDTO.getReserve_time());
		 
		 mentoringDTO.setReserve_date(time);
		 
		 // service 클래스에서 iamport 의 key값을 주고 토큰을 구해온다. 
		 String token = payService.getToken();
		    
		 // service 클래스에서 결제 완료 후 가격을 구해온다. 
		 String amount = payService.paymentInfo(mentoringDTO.getIamport_order_no(), token);
		    
		 int res = 1;
		    
		    
		 // 결제 금액 오류시 해당 메소드를 빠져나간다. 
		 if (mentoringDTO.getPay_amount() != Long.parseLong(amount)) {
			 res = 0;
			// 결제 취소
			payService.payMentCancle(token, mentoringDTO.getIamport_order_no(), amount,"결제 금액 오류");
			return res;
		}
		    
		    
		payService.insertMentoringAndPayment(mentoringDTO);
		findMentor.sendMentoringApplyalarm(mentoringDTO);
			
		    
		return mentoringDTO.getPayment_no();

	}
	
	
	
	@GetMapping("refund")
	@ResponseBody
	public int refund(int payment_no) {
		
		int result = 0;
		
		try {
			result = payService.orderCancle(payment_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@PostMapping("getPaymentCancelInfo")
	public String getPaymentCancelInfo(int payment_no,Model model) {
		
		MentoringDTO info = payService.getPaymentCancelInfo(payment_no);
		model.addAttribute("info",info);
		
		return "findMentor/etc/paymentCancelInfo";
	}
	
	
	
	
	
	
	
	
	

}
