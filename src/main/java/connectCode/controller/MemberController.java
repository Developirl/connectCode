package connectCode.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connectCode.model.MemberDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.service.MemberService;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Value("${javascript_key}")
	private String javascriptkey;
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	PasswordEncoder passwordEncorder;

	// 로그인 폼 가기
	@GetMapping("/loginform")
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 휴대폰 인증번호
    @GetMapping("phoneChk")
    public @ResponseBody String phoneChk(@RequestParam(value="phone") String phone) throws CoolsmsException{
       return memberservice.phoneNumber(phone);
    }
	
	@RequestMapping("/find_map")
	public String find_map(Model model) {
		model.addAttribute("javascriptkey", javascriptkey);
		return "member/map";
	}
	
	@GetMapping("chooseForm")
	public String chooseForm() {
		return "/member/chooseform";
	}
	
	// 일반회원 동의서 가기
	@GetMapping("/normalmenteejoin")
	public String menteeJoin(Model model) {
		return "member/joinConstract";
	}
	
	// 일반회원 회원가입 폼
	@RequestMapping("/menteejoinform")
	public String normalMenteeJoin(Model model) {
		model.addAttribute("javascriptkey", javascriptkey);
		return "member/normalmenteeJoinForm";
	}
	
	//일반회원 id 중복검사
	@GetMapping("/normalidcheck")
	@ResponseBody
	public int normalIdCheck(@RequestParam("id") String id) {
		System.out.println("id중복검사 들어옴");
		int result = memberservice.getSameId(id);
		
		return result;
	}
	
	// 일반회원 회원가입후 
	@PostMapping("/join_normalmentee")
	public String join_NormalMentee(MemberDTO member, MenteeDTO mentee, @RequestParam("changebirthday") String changebirthday) {
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			// 변환된 Date 객체를 사용합니다.
		    Date birthday = formatter.parse(changebirthday);
		    mentee.setBirthday(birthday);
		} catch (Exception e) {
		    e.printStackTrace();
		    // 날짜 변환 실패 시 예외 처리를 수행합니다.
		}
						
		// 비밀번호 암호화
		String password = passwordEncorder.encode(member.getPassword());
		
		member.setPassword(password);
		
		//member 테이블에 insert
		memberservice.normalMenteeMemberInsert(member);
		
		//member 테이블에서 member_no가져오기
		int member_no = memberservice.getNormalMemberNo(member.getId());
		
		//mentee 테이블에 insert
		memberservice.insertNormalMentee(mentee, member_no);
		
		System.out.println("회원가입 완료");
		
		return "redirect:/member/joinSuccessForm";
	};
	
	@GetMapping("find_idform")
	public String menteeFindIdForm() {
		return "member/findidform";
	}
	
	//id list뽑아 오기
	@GetMapping("findid")
	public String FindId(String email, String phone, Model model) {
		
		// member_no로 멤버랑 멘티랑 멘토를 조인
		List<MemberDTO> memberList = memberservice.findId(email, phone);		
		System.out.println("멤버리스트: "+memberList);
		
		if(memberList.size() != 0) {
		
		int memberCount = memberList.size();
		
		model.addAttribute("membercount", memberCount);
		model.addAttribute("memberlist", memberList);
		model.addAttribute("findidok", "list");
			
			
		}else {
			System.out.println("없는 회원입니다.");
			model.addAttribute("findidok", "no");
		}
		
		return "member/findidform";
	}
	
	// 비밀번호 찾기 폼
		@GetMapping("find_pwform")
		public String menteeFindPwForm(String id, Model model) {
			
			if(id != null) {
				model.addAttribute("id", id);				
			}
			
			return "member/findpasswordform";
			
		}
		
		// 비밀번호 찾기
		@PostMapping("findpw")
		public String menteeFindPw(String id, Model model) {
			
			MemberDTO member = memberservice.getMember(id);
		
			if(member != null) {
				
			System.out.println("일반 회원가입 회원입니다.");
					model.addAttribute("id", member.getId());
					model.addAttribute("findpwok", "normalmember");
				
				
			}else {
				System.out.println("없는 회원입니다.");
				model.addAttribute("findpwok", "no");
			}
			
			return "member/findpasswordform";
		}
		
		// 비밀번호 재설정
		@PostMapping("newpw")
		public String menteeNewPw(String id, String password, Model model) {
			
			//비밀번호 암호화
			String encodepw = passwordEncorder.encode(password);
			
			// 새 비밀번호 재설정
			memberservice.updateMenteePw(encodepw, id);
			
			model.addAttribute("findpwok", "newpw");
			
			
			return "member/findpasswordform";
		}
		
		@GetMapping("joinSuccessForm")
		public String joinSucessForm(){
			return "member/joinsuccessform";
		}
			
		
	
/////////////////////////////////////////////////////////////////////////////////////////////용경 멘토
	
	// 멘토회원 동의서 가기
	@GetMapping("/mentorjoin")
	public String mentorJoin(Model model) {
		return "member/MentorjoinConstract";
	}

	// 멘토회원 회원가입 폼
	@RequestMapping("/mentorJoinForm")
	public String normalMentorJoin(Model model) {
		model.addAttribute("javascriptkey", javascriptkey);
		return "member/mentorJoinForm";
	}

	// 멘토회원 회원가입후 
	@PostMapping("/join_normalmentor")
	public String join_NormalMentee(MemberDTO member, MentorDTO mentor, @RequestParam("changebirthday") String changebirthday) {
	
	
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			// 변환된 Date 객체를 사용합니다.
			Date birthday = formatter.parse(changebirthday);
			mentor.setBirthday(birthday);
		} catch (Exception e) {
			e.printStackTrace();
			// 날짜 변환 실패 시 예외 처리를 수행합니다.
		}
		
		// 비밀번호 암호화
		String password = passwordEncorder.encode(member.getPassword());
		
		member.setPassword(password);
		
		//member 테이블에 insert
		memberservice.insertMentorMember(member);
		
		//member 테이블에서 member_no가져오기
		int member_no = memberservice.getNormalMemberNo(member.getId());
		
		//mentee 테이블에 insert
		memberservice.insertNormalMentor(mentor, member_no);
		
		return "redirect:/member/joinSuccessForm";
	}
		
	
	
}
