package connectCode.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
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
import connectCode.model.PaymentDTO;
import connectCode.service.PaymentService;

@Controller
@RequestMapping("/payment/*")
public class MentoringPayment {
	
	
	@Value("${iamport_rest_api_key}")
	private String imaport_key;
	
	@Value("${iamport_api_secret}")
	private String iamport_secret;
	
	
	private IamportClient client = new IamportClient("2186618541054470","x4P1ndP7RQsdC0kG26uycOp0efeF0WeIVKUyfzJlLzBPUqDJna7g68KqJAeIMK6hxk9bRxC3rpjlHLuF");

	@Autowired
	private PaymentService payService;
	
	//결제하는 창으로 이동한다.
	@GetMapping("kakaopay")
	public String KakaopayForm() {
		return "findMentor/kakaopay2";
	}
	
	
	// 결제 검증
	@ResponseBody
	@PostMapping(value="/order/verify_iamport/{imp_uid}")
	public IamportResponse<Payment> verifyIamportPost(@PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException{
		System.out.println("verify_iamport 까지 도달");
		return client.paymentByImpUid(imp_uid);
	}
	
	// 결제 정보 DB에 저장하기 위해 값을 받는다. 
	/*
	 * @PostMapping("/order/complete") public void paymentComplete(String
	 * imp_uid,String orderDate) { System.out.println("imp_uid : "+imp_uid);
	 * System.out.println("orderDate : "+orderDate); }
	 */
	
	// 진짜 결제 
	@RequestMapping(value ="order/complete", consumes = "application/json")
	@ResponseBody
	public int paymentComplete(@RequestBody MentoringDTO mentoringDTO, @RequestBody String reserve_dat, @RequestBody String reserve_time) throws Exception {
		    
		    System.out.println("여기 도달");
			System.out.println("imp_uid:"+mentoringDTO.getIamport_order_no());
			System.out.println("merchant_uid:"+mentoringDTO.getOrder_no());
			System.out.println("orderDTO 객체 출력:"+mentoringDTO);
		
		    String token = payService.getToken();
		    
		    // 결제 완료된 금액
		    String amount = payService.paymentInfo(mentoringDTO.getIamport_order_no(), token);
		    
		    int res = 1;
		    
		    
		    // 결제 금액 오류시 해당 메소드를 빠져나간다. 
		    if (mentoringDTO.getPay_amount() != Long.parseLong(amount)) {
				res = 0;
				// 결제 취소
				payService.payMentCancle(token, mentoringDTO.getIamport_order_no(), amount,"결제 금액 오류");
				return res;
			}
		    
		    System.out.println("DB에 저장하는 내용들 : "+mentoringDTO);
			//orderService.insert_pay(orderDTO); // 이게 DB에 저장하는 내용
			return res;
		 
	}
	
}
