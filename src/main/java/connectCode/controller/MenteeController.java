package connectCode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import connectCode.model.AuthUser;
import connectCode.model.MenteeDTO;
import connectCode.model.MenteeMentoringDTO;
import connectCode.model.PagingMaker;
import connectCode.model.PostBoardDTO;
import connectCode.model.ReviewDTO;
import connectCode.service.MenteeService;
import lombok.Setter;

@Controller
@RequestMapping("/mentee/*")
public class MenteeController {
	
	@Setter(onMethod_ = @Autowired)
	private MenteeService menteeService;
	
	@Autowired
	PasswordEncoder passwordEncorder;
	
	@GetMapping("main")
	public String getMenteeMain(Model model, Authentication auth) {
		int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
		
		model.addAttribute("menteeInfo", menteeService.getMenteeInfo(mentee_no));
		model.addAttribute("likedMentorCnt",menteeService.getLikedMentorCnt(mentee_no));
		model.addAttribute("reviewCnt",menteeService.getReviewCnt(mentee_no));
		model.addAttribute("mentoringCnt",menteeService.getMentoringCnt(mentee_no));
		
		return "mentee/menteeMypageMain";
	}
	
	@GetMapping("likedMentorList")
	public String getLikedMentorList(Model model, Authentication auth) {
		int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
		model.addAttribute("likedMentorList", menteeService.getLikedMentorList(mentee_no));
		
		return "mentee/likedMentorList";
	}
	
	@GetMapping("getMenteeProfile")
	public String getMenteeProfile(Model model, Authentication auth) {
		int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
		model.addAttribute("mentee", menteeService.getMenteeInfo(mentee_no));
		
		return "mentee/menteeProfile";
	}
	
@PostMapping("modifyProfile")
	public String modifyMenteeProfile(MenteeDTO mentee) {
		menteeService.modifyMenteeInfo(mentee);
		return "redirect:/mentee/getMenteeProfile";
	}
	
	
	
	
	// 1:1 게시판
	@GetMapping("inquireList")
	public String getList(@RequestParam(defaultValue = "1")int pageNum, Model model, Authentication auth) {
		
		int member_no = ((AuthUser)(auth.getPrincipal())).getMember().getMember_no();
		
		model.addAttribute("inquireList", menteeService.getInquireList(member_no, pageNum));
		model.addAttribute("pageMaker", new PagingMaker(pageNum, menteeService.getInquireListTotal(member_no)));
		
		return "mentee/menteeInquireList";
	}


	// 글쓰기 처리
	@PostMapping("inquireWrite")
	public String register(int pageNum, PostBoardDTO post, Authentication auth, RedirectAttributes attr) {
		int member_no = ((AuthUser)(auth.getPrincipal())).getMember().getMember_no();
		post.setMember_no(member_no);
		if(menteeService.insertInquire(post)) {
			attr.addFlashAttribute("check", "insert");
		};
		
		return "redirect:/mentee/inquireList?pageNum="+pageNum;
	}	

	// 2. 글 상세보기
	@GetMapping("getInquire")
	@ResponseBody
	public PostBoardDTO get(int post_no) {	
		return menteeService.getInquire(post_no);
	}

	// 글삭제 처리
	@PostMapping("inquireDelete")
		public String delete(int post_no, int pageNum, RedirectAttributes attr){
		
		if(menteeService.deleteInquire(post_no)) {
			attr.addFlashAttribute("check", "delete");
		};
		
		return "redirect:/mentee/inquireList?pageNum="+pageNum;
	}
	
	// ---------------------------------------------- 혜지 작성 ------------------------------------------------------------------
	
		// 탈퇴 폼
		@GetMapping("deleteMentee")
		public String deleteMentee(Authentication auth) {
			return "mentee/deleteMentee";
		}
		
		// 멘티 탈퇴
		@PostMapping("menteeDel_ok")
		public String menteeDel_ok(String password, String quit_reason, HttpSession session, Model model, Authentication auth) {
			int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
			//System.out.println(mentee_no);
			
			//System.out.println(password);
			//System.out.println(quit_reason);
			
			MenteeDTO member = menteeService.menteeDetail(mentee_no);
			//System.out.println("member;;;;;;;;;;;;;;;"+member);
			
			int result = 0;
			
			if(passwordEncorder.matches(password, member.getPassword())) {
				
				member.setQuit_reason(quit_reason);
				
				//System.out.println("member;;;;;;"+member);
				
				menteeService.insertquittbl(member);
				menteeService.quit_mentee(member);
				
				result = 1;
				model.addAttribute("result", result);

				session.invalidate();
				return "mentee/deleteMenteeResult";
			}else {
				result = 2;
				model.addAttribute("result", result);
				
				return "mentee/deleteMenteeResult";
			}
			
		}
		
		// 비밀번호 변경 폼
		@GetMapping("menteeChangePwd")
		public String menteeChangePwd(Authentication auth, MenteeDTO mentee) {
			return "mentee/menteeChangePwd";
		}
		
		@PostMapping("menteeUpdatePw_ok")
		public String menteeUpdatePw_ok(String password, String newpasswd, Authentication auth, Model model) {
			int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
			
			int result = 0;
			
			MenteeDTO member = menteeService.menteeDetail(mentee_no);
			//System.out.println("member;;;;;;;;;;;;" + member);

			if(passwordEncorder.matches(password, member.getPassword())) {
				
				String encodepw = passwordEncorder.encode(newpasswd);
				
				member.setPassword(encodepw);
				
				menteeService.menteeNewPwd(member);
				
				result = 3;
				
				model.addAttribute("result", result);
				
				return "mentee/deleteMenteeResult";
			}else {
				
				result = 2;

				model.addAttribute("result", result);
				
				return "mentee/deleteMenteeResult";
			}
			
		}
		
		// ---------------------------------------------- 혜지 작성 ------------------------------------------------------------------
		/* --------------- 지수 작업 영역 ---------------------*/
		
		// 멘토링 예약 내역 페이지로 이동 ( 페이징 처리 x ) 
		@GetMapping("myMentoringHistoryPage")
		public String myMentoringHistoryPage(Model model, Authentication auth) {
			
			int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
			
			List<MenteeMentoringDTO>  dto = menteeService.getMentoringHistory(mentee_no);
			model.addAttribute("list",dto);
			
			return "mentee/myMentoringHistoryPage";
		}
		
		
		// 리뷰 insert 
		@PostMapping("insertReviewAndAlarm")
		@ResponseBody
		public int insertReviewAndAlarm(ReviewDTO dto, Model model,Authentication auth) {
			
			int result = 0;
			
			// reivew insert
			result = menteeService.insertReview(dto);
			
			if(result != 0) {
				
				int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
				System.out.println("멘티의 mentee_no : "+mentee_no);
				System.out.println("멘토의 member_no : "+dto.getMember_no());
				menteeService.sendReviewAlarm(dto.getMember_no(),mentee_no);
			}
			
			return result;
		}
}
	

