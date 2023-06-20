package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VisitDTO {
	private int visit_id;
	private String visit_ip;
	private Timestamp visit_time;
	private String visit_refer;
	private String visit_agent;
}
