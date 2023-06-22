package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private int payment_no;
	private String payment_method;
	private Long order_no;
	private int pay_amount;
	private String pay_state;
	private Timestamp pay_time;
	private Timestamp cancel_pay_time;
	private Timestamp refund_time;
	private String iamport_order_no;
	private String buyer_name;
	private String buyer_email;
	private String buyer_phone;
	private int mentoring_no;
	
	private int startRow;
	private int endRow;
	
}
