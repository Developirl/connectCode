package connectCode.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connectCode.model.MemberDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.service.KakaoService;
import connectCode.service.MemberService;
import connectCode.service.UserDetailsServiceImpl;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Value("${rest_api_key}")
	private String restapikey;
	
	@Value("${admin_key}")
	private String adminkey;
	
	@Value("${javascript_key}")
	private String javascriptkey;
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	PasswordEncoder passwordEncorder;
	
	@Autowired
	UserDetailsServiceImpl userDetailService;

	@Autowired
	KakaoService kakaoservice;
	
	// 로그인 폼 가기
	@GetMapping("/loginform")
	public String loginForm(Model model) {
		model.addAttribute("restapikey", restapikey);
		return "member/loginForm";
	}
	
	@PostMapping("/menteeLogin")
	public String processMenteeLogin(@RequestParam("id") String id, @RequestParam("password") String password) {
	    // 받은 ID와 비밀번호로 로그인 처리를 수행합니다.
		
		log.info("로그인 처리 들어옴");
		
		if(userDetailService.loadUserByUsername(id)==null) {
			log.info("로그인이 실패하였습니다. 다시 로그인 해주세요");
			return "redirect:/member/loginform";
		}else {
			
			MemberDTO member = memberservice.getMember(id);
			
			// 카카오 로그인
			if(member.getUuid() == null) {
				
				if(passwordEncorder.matches(password, member.getPassword())) {
					log.info("로그인 성공");
					return "redirect:/"; // 로그인 성공 시 리다이렉트할 URL				
				}else {
					log.info("비밀번호가 틀립니다. 다시 로그인 해주세요");
					return "redirect:/member/loginform";
				}
			
			//일반 로그인
			}else {
				if(passwordEncorder.matches(password, member.getPassword())) {
					log.info("로그인 성공");
					return "redirect:/"; // 로그인 성공 시 리다이렉트할 URL				
				}else {
					log.info("비밀번호가 틀립니다. 다시 로그인 해주세요. 여기서 오류가 나는건가?");
					return "redirect:/member/loginform";
				}
			}
			
			
			
			
		}
	    // 로그인 성공 또는 실패에 따라 적절한 동작을 수행합니다.
	    
	}
	
	
	// 휴대폰 인증번호
    @RequestMapping("phoneChk")
    public @ResponseBody String phoneChk(@RequestParam(value="phone") String phone) throws CoolsmsException{
       return memberservice.phoneNumber(phone);
    }
	
	@GetMapping("/kakaoLogin")
	public String KakaoLogin(@RequestParam("code") String code,HttpSession session
			,Model model) throws Exception{
		
		String access_Token = kakaoservice.getKakaoAccessToken(code);
		System.out.println(access_Token);
		
		HashMap<String, Object> kakaouserInfo = kakaoservice.getUserInfo(access_Token);
		System.out.println("유저 인포 : " + kakaouserInfo);
		
		Long uuid = (Long) kakaouserInfo.get("id");		
		
		System.out.println("아이디 나옴 :" +  kakaouserInfo.get("id"));
		
		MemberDTO member = memberservice.findUuid(uuid);
		System.out.println("멤버 확인: " +member);
		
		
		session.setAttribute("kakaouserInfo", kakaouserInfo);
		
		
		if(member == null) {
			
			//동의서로 보내고 kakaouserInfo는 세션에 저장한후 받아서 쓰고 동의서 후 회원가입후 메인으로 갔을때 
			//session remove 시켜준다.
			
			model.addAttribute("gotojoin", "/member/menteejoin");
			return "member/joinConstract";
		}else {
			System.out.println("카카오 아이디 있음");
			
			String id = member.getId();
			String password = member.getPassword();
			
			System.out.println(userDetailService.loadUserByUsername(id));
			model.addAttribute("uuid", uuid);
			
			// POST 방식으로 id와 password 값을 전달하기 위해 RedirectAttributes에 값 추가
			model.addAttribute("id", id);
			model.addAttribute("password", password);
			
			// 일반 로그인 mapping에 post방식으로 id와 password를 값에 넣고 넘김
			return "member/kakaoLoginForm";
		
		}
	}
	
	@RequestMapping("/menteejoin")
	public String menteeJoin(HttpSession session, Model model) {
		System.out.println("카카오 멘티 조인 들어옴");
		model.addAttribute("kakaouserInfo", session.getAttribute("kakaouserInfo"));
		model.addAttribute("javascriptkey", javascriptkey);
		
		return "member/menteeJoinForm";
	}
	
	@PostMapping("/kakaomain")
	public String main(@ModelAttribute MenteeDTO mentee,
		@RequestParam("changebirthday") String changebirthday, String uuid,
		HttpSession session,Model model) {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			// 변환된 Date 객체를 사용합니다.
		    Date birthday = formatter.parse(changebirthday);
		    mentee.setBirthday(birthday);
		} catch (Exception e) {
		    e.printStackTrace();
		    // 날짜 변환 실패 시 예외 처리를 수행합니다.
		}
		
		// 암호화
		String password = passwordEncorder.encode(uuid);
		
		MemberDTO member = new MemberDTO();
		
		member.setId(uuid);
		member.setPassword(password);
		member.setUuid(uuid);

		// insert 멤버테이블
		memberservice.insertMenteeMember(member);
		System.out.println("insert 멤버테이블");
		
		// 멤버 테이블에서 member_no컬럼 가져오는 메소드
		int member_no = memberservice.getMemberNo(uuid);
		System.out.println("member_no컬럼 가져옴" + member_no);
		
		// insert 멘티테이블
		memberservice.insertMentee(mentee, member_no);
		System.out.println("insert 멘티 테이블");
		
		model.addAttribute("uuid", session.getAttribute("uuid"));
		model.addAttribute("restapikey", restapikey);
		model.addAttribute("adminkey", adminkey);
		
		return "member/menteelogout";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		System.out.println("로그아웃");
		
		return "/";
	}
		
		// uuid가 우리 데이터베이스에 있는거 확인(카카오 회원가입이 되어있을때)
		//uuid와 id가 같으면  바로 session만들어주고 로그인 ->메인
		
		// 아예 처음 카카오 로그인 시 회원가입 폼으로 가서 추가 데이터 입력하고 로그인 시킴.
	@GetMapping("/kakaoexit")
	public String kakaoexit(HttpSession session) {
		System.out.println("회원탈퇴 들어옴");
		
		session.invalidate();
		System.out.println("회원탈퇴");
		
		return "/";
	}
	
	@RequestMapping("/find_map")
	public String find_map(Model model) {
		model.addAttribute("javascriptkey", javascriptkey);
		return "member/map";
	}
	
//////////////////////////////////////////////////////////////////// 일반 멘티 회원
	
	// 일반회원 동의서 가기
	@GetMapping("/normalmenteejoin")
	public String menteeJoin(Model model) {
		model.addAttribute("gotojoin", "/member/normalmenteejoinform");
		return "member/joinConstract";
	}
	
	// 일반회원 회원가입 폼
	@RequestMapping("/normalmenteejoinform")
	public String normalMenteeJoin(Model model) {
		model.addAttribute("javascriptkey", javascriptkey);
		return "member/normalmenteeJoinForm";
	}
	
	//일반회원 id 중복검사
	@RequestMapping("/normalidcheck")
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
		
		return "redirect:/";
	};
	
	@GetMapping("menteefind_idform")
	public String menteeFindIdForm() {
		return "member/findidform";
	}
	
	@PostMapping("menteefindid")
	public String menteeFindId(String phone, Model model) {
		
		int member_no = memberservice.findMenteeId(phone);
		
		if(member_no != 0) {
			MemberDTO member =  memberservice.getMemberMentee(member_no);
			
			if(member.getUuid() != null) {
				System.out.println("카카오 회원가입 회원입니다.");
				model.addAttribute("findidok", "kakaomentee");
			}else {
				System.out.println("일반 회원가입 회원입니다.");
				model.addAttribute("id", member.getId());
				model.addAttribute("findidok", "normalmentee");
			}
			
		}else {
			System.out.println("없는 회원입니다.");
			model.addAttribute("findidok", "no");
		}
		
		return "member/findidform";
	}
	
	// 비밀번호 찾기 폼
		@GetMapping("menteefind_pwform")
		public String menteeFindPwForm() {
			return "member/findpasswordform";
		}
		
		// 비밀번호 찾기
		@PostMapping("menteefindpw")
		public String menteeFindPw(String phone, Model model) {
			
			int member_no = memberservice.findMenteeId(phone);
			System.out.println("멤버_노값" + member_no);
			
			if(member_no != 0) {
				MemberDTO member =  memberservice.getMemberMentee(member_no);
				
				if(member.getUuid() != null) {
					System.out.println("카카오 회원가입 회원입니다.");
					model.addAttribute("findpwok", "kakaomentee");
				}else {
					System.out.println("일반 회원가입 회원입니다.");
					model.addAttribute("id", member.getId());
					model.addAttribute("findpwok", "normalmentee");
				}
				
			}else {
				System.out.println("없는 회원입니다.");
				model.addAttribute("findpwok", "no");
			}
			
			return "member/findpasswordform";
		}
		
		// 비밀번호 재설정
		@PostMapping("menteenewpw")
		public String menteeNewPw(String id, String password, Model model) {
			
			//비밀번호 암호화
			String encodepw = passwordEncorder.encode(password);
			
			// 새 비밀번호 재설정
			memberservice.updateMenteePw(encodepw, id);
			
			model.addAttribute("findpwok", "newpw");
			
			
			return "member/findpasswordform";
		}
	
/////////////////////////////////////////////////////////////////////////////////////////////용경 멘토
	
// 멘토회원 동의서 가기
@GetMapping("/mentorjoin")
public String mentorJoin(Model model) {
model.addAttribute("gotojoin", "/member/mentorJoinForm");
return "member/joinConstract";
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
		
		return "/";
	}
	
	//멘토아이디 찾기폼
	@GetMapping("mentorfind_idform")
	public String mentorFindIdForm() {
	   return "member/mentorfind_idform";
	}

	// 멘토 아이디 찾기
	@PostMapping("mentorfindid")
	public String mentorFindId(String phone, Model model) {
	   
	   int member_no = memberservice.findMentorId(phone);
	   System.out.println("멤버_노값" + member_no);
	   
	   if(member_no != 0) {
	      MemberDTO member =  memberservice.getMemberMentor(member_no);
	         System.out.println("일반 회원가입 회원입니다.");
	         model.addAttribute("id", member.getId());
	         model.addAttribute("findidok", "normalmentor");
	      
	      
	   }else {
	      System.out.println("없는 회원입니다.");
	      model.addAttribute("findidok", "no");
	   }
	   
	   return "member/mentorfind_idform";
	}

	@GetMapping("mentorfind_pwform")
	public String mentorFindPwForm() {
	   return "member/mentorfind_pwform";
	}

	@PostMapping("mentorfindpw")
	public String mentorFindPw(String phone, Model model) {
	   
	   int member_no = memberservice.findMentorId(phone);
	   System.out.println("멤버_노값" + member_no);
	   
	   if(member_no != 0) {
	      MemberDTO member =  memberservice.getMemberMentor(member_no);
	         System.out.println("일반 회원가입 회원입니다.");
	         model.addAttribute("id", member.getId());
	         model.addAttribute("findpwok", "normalmentor");
	      }
	      
	   else {
	      System.out.println("없는 회원입니다.");
	      model.addAttribute("findpwok", "no");
	   }
	   
	   return "member/mentorfind_pwform";
	}

	@PostMapping("mentornewpw")
	public String mentorNewPw(String id, String password, Model model) {
	   
	   //비밀번호 암호화
	   String encodepw = passwordEncorder.encode(password);
	   
	   // 새 비밀번호 재설정
	   memberservice.updateMenteePw(encodepw, id);
	   
	   model.addAttribute("findpwok", "newpw");
	   
	   
	   return "member/mentorfind_pwform";
	}
	
	
}
