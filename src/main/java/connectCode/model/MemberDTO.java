package connectCode.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDTO {

	private int member_no;
	private String id;
	private String password;
	private Timestamp last_login_date; // 최근로그인기록
	private Timestamp reg_date;		   // 가입일자
	private Timestamp change_pwd_date;	// 비밀번호 수정일
	private int pwd_err_cnt;		//암호 오류횟수	
	private String need_change_pwd_yn;	// 비밀번호 변경필요
	private Timestamp pwd_err_date;		// 암호오류 최종일시?
	private int classification;			// 구분코드
	private String uuid;
}
