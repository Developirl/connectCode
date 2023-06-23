package connectCode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import connectCode.model.AuthUser;
import connectCode.service.MenteeService;
import lombok.Setter;

@Controller
@RequestMapping("/mentee/*")
public class MenteeController {
	
	@Setter(onMethod_ = @Autowired)
	private MenteeService menteeService;
	
	@GetMapping("main")
	public String getMenteeMain(Model model, Authentication auth) {
		int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
		
		model.addAttribute("menteeInfo", menteeService.getMenteeInfo(mentee_no));
		model.addAttribute("likedMentorCnt",menteeService.getLikedMentorCnt(mentee_no));
		model.addAttribute("reviewCnt",menteeService.getReviewCnt(mentee_no));
		model.addAttribute("mentoringCnt",menteeService.getMentoringCnt(mentee_no));
		
		return "/mentee/menteeMypageMain";
	}
}
	

