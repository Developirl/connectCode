package connectCode.model;

import javax.mail.Address;

import lombok.Data;

@Data
public class MailDTO {
	private Address[] emailAddress;
	private String title;
	private String content;

}
