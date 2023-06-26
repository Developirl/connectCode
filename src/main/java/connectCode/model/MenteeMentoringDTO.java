package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MenteeMentoringDTO {

	
	private int menClassification;
	private String name;
	private String mentoring_kind;
	private Timestamp reserve_date;
	private int mentee_no;
	private int mentor_no;
	private int pay_amount;
	private int review_no;
	private int mentoring_no;
	private int payment_no;
	private String order_no;
	private String iamport_order_no;
	
	
	
}
