package connectCode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import connectCode.service.HomeService;
import lombok.Setter;

@Controller
public class HomeController {
	
	@Setter(onMethod_ = @Autowired)
	private HomeService homeService;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("pMentorList", homeService.getPopularMentorList());
		model.addAttribute("rReviewList", homeService.getRecentReviewList());
		return "home";
	}
	
	@GetMapping("/academy")
	public String getAcademyBoard() {
		return "academy/academyList";
	}
	
}
