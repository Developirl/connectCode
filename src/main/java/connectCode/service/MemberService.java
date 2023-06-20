package connectCode.service;

import connectCode.model.MemberDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface MemberService {

	MemberDTO findUuid(Long uuid);

	void insertMenteeMember(MemberDTO member);

	int getMemberNo(String uuid);
	
	public String phoneNumber(String phone) throws CoolsmsException;
	
	void insertMentee(MenteeDTO mentee, int member_no);

	int getSameId(String id);

	void normalMenteeMemberInsert(MemberDTO member);

	int getNormalMemberNo(String id);

	void insertNormalMentee(MenteeDTO mentee, int member_no);

	MemberDTO getMember(String id);

	int findMenteeId(String phone);

	MemberDTO getMemberMentee(int member_no);
	
	void updateMenteePw(String encodepw, String id);
	
//////////////////////용경멘토
	
void insertMentorMember(MemberDTO member);

void insertNormalMentor(MentorDTO mentor, int member_no);

int findMentorId(String phone);

MemberDTO getMemberMentor(int member_no);

void updateMentorPw(String encodepw, String id);

}
