package connectCode.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import connectCode.mapper.MemberMapper;
import connectCode.model.MemberDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {

	@Value("${phone_key_1}")
	private String phonekey1;

	@Value("${phone_key_2}")
	private String phonekey2;

	@Value("${myphone}")
	private String myphone;

	@Autowired
	MemberMapper membermapper;
	
	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return membermapper.getMember(id);
	}

	@Override
	public MemberDTO findUuid(Long uuid) {
		// TODO Auto-generated method stub
		return membermapper.findUuid(uuid);
	}

	@Override
	public void insertMenteeMember(MemberDTO member) {
		// TODO Auto-generated method stub
		membermapper.insertMenteeMember(member);
	}

	@Override
	public int getMemberNo(String uuid) {
		// TODO Auto-generated method stub
		return membermapper.getMemberNo(uuid);
	}

	// 휴대폰 본인인증
	public String phoneNumber(String phone) throws CoolsmsException {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);

		Random randomNum = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(randomNum.nextInt(10));
			numStr += ran;
		}

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[ConnectCode] 인증번호는" + "[" + numStr + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		coolsms.send(params);
		return numStr;
	}
	
	@Override
	public void insertMentee(MenteeDTO mentee, int member_no) {
		// TODO Auto-generated method stub
		membermapper.insertMentee(mentee,member_no);
	}
	
	@Override
	public int getSameId(String id) {
		// TODO Auto-generated method stub
		return membermapper.getSameId(id);
	}
	
	@Override
	public void normalMenteeMemberInsert(MemberDTO member) {
		// TODO Auto-generated method stub
		membermapper.normalMenteeMemberInsert(member);
	}
	
@Override
	public int getNormalMemberNo(String id) {
		// TODO Auto-generated method stub
		return membermapper.getNormalMemberNo(id);
	}

@Override
public void insertNormalMentee(MenteeDTO mentee, int member_no) {
	// TODO Auto-generated method stub
		membermapper.insertNormalMentee(mentee, member_no);
	}

	@Override
	public List<MemberDTO> findId(String email, String phone) {
		// TODO Auto-generated method stub
		return membermapper.findId(email, phone);
	}
	
	
	@Override
	public void updateMenteePw(String encodepw, String id) {
		// TODO Auto-generated method stub
		membermapper.updateMenteePw(encodepw, id);
	}
	
///////////////////////// 용경멘토

@Override
public void insertMentorMember(MemberDTO member) {
// TODO Auto-generated method stub
membermapper.insertMentorMember(member);
}

@Override
public void insertNormalMentor(MentorDTO mentor, int member_no) {
// TODO Auto-generated method stub
membermapper.insertNormalMentor(mentor, member_no);
}
	
@Override
public int findMentorId(String phone) {
   // TODO Auto-generated method stub
   return membermapper.findMentorId(phone);
}

@Override
public MemberDTO getMemberMentor(int member_no) {
   // TODO Auto-generated method stub
   return membermapper.getMemberMentor(member_no);
}

@Override
public void updateMentorPw(String encodepw, String id) {
   // TODO Auto-generated method stub
   membermapper.updateMentorPw(encodepw, id);
}
	
}
