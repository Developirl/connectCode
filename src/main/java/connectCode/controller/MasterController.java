package connectCode.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.List;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connectCode.model.FileDTO;
import connectCode.model.MailDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.PostDTO;
import connectCode.model.ReportDTO;
import connectCode.service.MasterService;
import connectCode.service.Paging;
import edu.emory.mathcs.backport.java.util.Arrays;

@Controller
@RequestMapping("/master/*")
public class MasterController {
	@Autowired
	MasterService ms;

	// 관리자 대시보드
	@RequestMapping("masterMainPage")
	public String masterMainPage(Model model) {
		
		model.addAttribute("totalVisitors", ms.getTotalVisitors());
		model.addAttribute("todayVisitors", ms.getTodayVisitors());
		model.addAttribute("mentors", ms.getMentors());
		model.addAttribute("mentees", ms.getMentees());
		model.addAttribute("unreadyMentors", ms.getUnreadyMentors());
		model.addAttribute("readyMentors", ms.getReadyMentors());
		
		return "master/masterMainPage";
	}

	// 승인_리스트 + 페이징 + 검색
	@RequestMapping("masterMentorApplyList")
	public String masterMentorApplyList(String pageNum, MentorDTO mentor, Model model) {
		final int rowPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = ms.getTotal1(mentor);

		int startRow = (currentPage - 1) * rowPage;
		int endRow = rowPage;

		Paging p = new Paging(total, rowPage, currentPage);

		mentor.setStartRow(startRow);
		mentor.setEndRow(endRow);

		List<MentorDTO> mentorlist = ms.mentorlist(mentor);

//		System.out.println("total:"+total);

		model.addAttribute("mentorlist", mentorlist);
		model.addAttribute("search", mentor.getSearch());
		model.addAttribute("keyword", mentor.getKeyword());
		model.addAttribute("p", p);

		return "master/masterMentorApplyList";
	}

	// 승인_상세
	@RequestMapping("masterMentorApplyDetail")
	public String masterMentorApplyDetail(int mentor_no, String pageNum, Model model) {

		MentorDTO mentor = ms.mentorDetail(mentor_no);
		List<MentorDTO> career = ms.mentorCareer(mentor_no);
		List<MentorDTO> education = ms.mentorEducation(mentor_no);
		List<MentorDTO> license = ms.mentorLicense(mentor_no);
		List<MentorDTO> service = ms.mentorService(mentor_no);
		
		List<MentorDTO> careerFile = ms.mentorCareerFile(mentor_no);
		//System.out.println(careerFile);
		List<MentorDTO> educationFile = ms.mentorEducationFile(mentor_no);
		//System.out.println("educationFile:"+educationFile);
		List<MentorDTO> licenseFile = ms.mentorLicenseFile(mentor_no);
		
		//System.out.println(mentor);

		model.addAttribute("mentor", mentor);
		model.addAttribute("career", career);
		model.addAttribute("education", education);
		model.addAttribute("license", license);
		model.addAttribute("service", service);
		
		model.addAttribute("careerFile", careerFile);
		model.addAttribute("educationFile", educationFile);
		model.addAttribute("licenseFile", licenseFile);

		return "master/masterMentorApplyDetail";
	}

	// 승인_상세_승인
	@RequestMapping("mentorDetailApply")
	@ResponseBody
	public String mentorDetailApply(int mentor_no) {

		MentorDTO mentor = ms.mentorDetail(mentor_no);
	
		System.out.println(mentor);

		String phone = mentor.getPhone();
		/* System.out.println(phone); */
		ms.mentorDetailApply(phone);
		ms.mentorlApplyUpdate(mentor);

		return "redirect:masterMentorList";
	}

	// 승인_상세_미승인
	@RequestMapping("mentorDetailRefuse")
	@ResponseBody
	public String mentorDetailRefuse(@RequestParam("mentor_no") int mentor_no) {

		MentorDTO mentor = ms.mentorDetail(mentor_no);

		String phone = mentor.getPhone();
//		System.out.println(phone);

		ms.mentorDetailRefuse(phone);
		ms.mentorlRefuseUpdate(mentor);

		return "redirect:masterMentorList";
	}

	// 문의_리스트
	@RequestMapping("masterInquireList")
	public String masterInquireList(String pageNum, PostDTO post, Model model) {
		final int rowPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = ms.getPostTotal(post);

		int startRow = (currentPage - 1) * rowPage;
		int endRow = rowPage;

		Paging p = new Paging(total, rowPage, currentPage);

		post.setStartRow(startRow);
		post.setEndRow(endRow);

//		System.out.println("total:"+total);
//		System.out.println(startRow);
//		System.out.println(endRow);

		List<PostDTO> postlist = ms.postlist(post);

//		System.out.println(post);

		model.addAttribute("postlist", postlist);
		model.addAttribute("p", p);

		return "master/masterInquireList";
	}

	// 문의_상세폼
	@RequestMapping("masterInquireDetail")
	public String masterInquireDetail(@RequestParam("post_no") int post_no, Model model) {

		PostDTO post = ms.postDetail(post_no);
		model.addAttribute("post", post);

		return "master/masterInquireDetail";
	}

	// 문의_답변 전송
	@RequestMapping("inquireRelpy")
	public String inquireRelpy(@RequestParam("post_no") int post_no, @RequestParam("reply") String content,
			PostDTO post) {

		PostDTO dbpost = ms.dbpost(post_no);

//		System.out.println(dbpost);
//		System.out.println(content);

		dbpost.setContent(content);
//		System.out.println(dbpost);

		ms.insertBoard(dbpost);
		ms.UpdateBoard(dbpost);

		return "redirect:masterInquireList";
	}

	// 회원_리스트
	@RequestMapping("masterMemberList")
	public String masterMemberList(String pageNum, MentorDTO mentor, MenteeDTO mentee, Model model) {
		final int rowPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int mentorTotal = ms.getTotal1(mentor);
		int menteeTotal = ms.getTotal2(mentee);
		int total = mentorTotal + menteeTotal;

		int startRow = (currentPage - 1) * rowPage;
		int endRow = rowPage;

		Paging p = new Paging(total, rowPage, currentPage);

		mentor.setStartRow(startRow);
		mentor.setEndRow(endRow);

		List<MentorDTO> mentorlist = ms.mentorlist(mentor);
		List<MenteeDTO> menteelist = ms.menteelist(mentee);

		List<MentorDTO> memberlist = ms.totallist(mentor);
//		System.out.println(memberlist);

		model.addAttribute("mentorlist", mentorlist);
		model.addAttribute("menteelist", menteelist);
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("mentorTotal", mentorTotal);
		model.addAttribute("menteeTotal", menteeTotal);
		model.addAttribute("p", p);

		return "master/masterMemberList";
	}
	
	// 회원 상세_멘토
	@RequestMapping("masterMentorDetail")
	public String mentorDetail(int member_no, int mentor_no, String pageNum, Model model) {
		
		  MentorDTO mentor = ms.mentorDetail(mentor_no);
		
		  List<MentorDTO> career = ms.mentorCareer(mentor_no); 
		  List<MentorDTO> education = ms.mentorEducation(mentor_no); 
		  List<MentorDTO> license = ms.mentorLicense(mentor_no); 
		  List<MentorDTO> service = ms.mentorService(mentor_no); 
		  int report = ms.mentorReport(mentor_no);
		  int review = ms.mentorReview(mentor_no);
		  double reviewAVG = ms.mentorAVG(mentor_no);
		  
		//System.out.println(mentor);
		
		model.addAttribute("mentor", mentor);
		model.addAttribute("career", career);
		model.addAttribute("education", education);
		model.addAttribute("license", license);
		model.addAttribute("service", service);
		model.addAttribute("report", report);
		model.addAttribute("review", review);
		model.addAttribute("reviewAVG", reviewAVG);
		
		return  "master/masterMentorDetail";
	}

	// 회원 상세_멘티
	@RequestMapping("masterMenteeDetail")
	public String menteeDetail(int member_no, int mentee_no, String pageNum, MenteeDTO mentee, Model model) {

		List<MenteeDTO> menteelist = ms.menteelist(mentee);
		
		List<MenteeDTO> menteeMentoring = ms.menteeMentoring(mentee);
	
		model.addAttribute("menteelist", menteelist);
		model.addAttribute("menteeMentoring", menteeMentoring);
		
		return  "master/masterMenteeDetail";
	}
	
	// 회원관리_메일 전송폼
	@RequestMapping("masterSendMailForm")
	public String masterSendMail(@RequestParam("member_no") List<String> member_no, Model model) {
		// System.out.println(member_no);

		String allEmail ="";
		
		for (String memberNum : member_no) {
			MentorDTO dbemail = ms.getEmailbyMember(memberNum);
			// System.out.println(dbemail);

			String memberMail = dbemail.getEmail();
			// System.out.println(memberMail);
			
			allEmail += memberMail + "-";
		}
//		System.out.println("allEmail: " +allEmail);
		
		model.addAttribute("allEmail", allEmail);

		return "master/masterSendMail";
	}

	// 회원관리_메일 전송
	@RequestMapping("emailSend")
	public String SendMail(@RequestParam("allEmail") String allEmail, MailDTO mail, MentorDTO mentor) throws UnsupportedEncodingException, MessagingException {
		// System.out.println("allEmail00: " +allEmail);
		// System.out.println(mail);
		
		String [] allEmailArr = allEmail.split("-");
		String emailArr = Arrays.deepToString(allEmailArr);
		// System.out.println("emailArr: " +emailArr);
		
		String[] extractedEmails = emailArr.substring(1, emailArr.length()-1).split(",");
		
		// address[] 배열
		Address [] emailAdd = new Address[extractedEmails.length];
		for(int i=0; i<extractedEmails.length; i++) {
			emailAdd[i] = new InternetAddress(extractedEmails[i].trim());
		}
		
		// System.out.println(extractedEmails);
		
		mail.setEmailAddress(emailAdd);
		
		ms.mailSend(mail);
		
		
		return "redirect:masterMemberList";
	}
	
	// 멘티 회원 탈퇴
	@RequestMapping("memberDelete")
	public String memberDelete(int member_no) {
		
		ms.mmDelUpdate(member_no);
		ms.mmDelete(member_no);
		
		return "redirect:masterMemberList";
	}
	

	// 결제_리스트
	@RequestMapping("masterPaymentList")
	public String masterPaymentList() {
	

		return "master/masterPaymentList";
	}

	// 신고_리스트
	@RequestMapping("masterReportList")
	public String masterReportList(String pageNum, ReportDTO report, Model model) {
		final int rowPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		// 신고 미처리
//		int total = ms.getReport(report);
		
		// 신고 처리
//		int total = ms.getReport(report);
		
		int total = ms.getReport(report);

		int startRow = (currentPage - 1) * rowPage;
		int endRow = rowPage;

		Paging p = new Paging(total, rowPage, currentPage);

		report.setStartRow(startRow);
		report.setEndRow(endRow);

		// 미처리
//		List<ReportDTO> reportUncomplete = ms.reportUncomplete(report);
		
		// 처리
//		List<ReportDTO> reportComplete = ms.reportComplete(report);
		
		List<ReportDTO> reportList = ms.reportList(report);
		
//		model.addAttribute("reportUncomplete", reportUncomplete);
//		model.addAttribute("reportComplete", reportComplete);
		model.addAttribute("reportList", reportList);
		model.addAttribute("p", p);
		
		return "master/masterReportList";
	}
	
	// 신고_상세
	@RequestMapping("masterReportDetail")
	public String masterReportDetail(int member_no, int mentor_no, int report_no, ReportDTO report,  Model model) {
		
		MentorDTO mentor = ms.mentorDetail(mentor_no);
		List<MentorDTO> service = ms.mentorService(mentor_no);
		ReportDTO reportDetail = ms.reportDetail(report_no);
		//System.out.println(reportDetail);
		
		model.addAttribute("mentor", mentor);
		model.addAttribute("service", service);
		model.addAttribute("reportDetail", reportDetail);

		return "master/masterReportDetail";
	}
	
	// 첨부파일 다운로드
	@RequestMapping("filedownload")
	public void download(int efile_no, int mentor_no) {
		
		FileDTO file = ms.file(mentor_no);
		System.out.println(file);
		
		String filename = file.getOrigin_name();

		
	}

}
