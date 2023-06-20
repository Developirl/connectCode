package connectCode.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import connectCode.model.FileDTO;
import connectCode.model.InqueryBean;
import connectCode.model.MentorDTO;
import connectCode.model.MyMentoringBean;
import connectCode.service.FileService;
import connectCode.service.FileUtils;
import connectCode.service.InqueryServiceImpl;
import connectCode.service.MentorService;
import connectCode.service.Paging;

@Controller
@RequestMapping("/mentor/*")
public class MentorController {

	@Autowired
	private MentorService ms;
	@Autowired
	private FileService fileService;
	@Autowired
	private FileUtils fileUtils;
	@Autowired
	private InqueryServiceImpl inqueryService;

	//  **********************************************[작 지현]******************************************************
	//  **********************************************[멘토 메인 start]******************************************************
	// 멘토 메인 페이지
	@GetMapping("mentorPage")
	public String mentorPage(MentorDTO mentor, HttpSession session, Model model) {
		
		// session ******************************************** security로 바뀌면 삭제
		
		//session.setAttribute("mentor_no", 5); // 최멘토 21(미승인)
		//session.setAttribute("mentor_no", 3); // 김멘토 22(승인요청)
 		//session.setAttribute("mentor_no", 4); // 오멘토 23(승인)
 		session.setAttribute("mentor_no", 13); // 송강 23(승인)
		System.out.println("누가 접속 하셨나요?:" + (int)session.getAttribute("mentor_no"));
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPage";
	}

	// 멘토 프로필 관리 페이지
	@GetMapping("mentorProfileModifyPage")
	public String mentorProfileModifyPage(MentorDTO mentor, HttpSession session, Model model) {

		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorProfileModifyPage";
	}
	
	//  **********************************************[멘토 메인 end]******************************************************
	//  **********************************************[기본정보 start]******************************************************
	
	// 멘토 프로필 수정 [기본정보 입력 전] 페이지
	@GetMapping("mentorBasicInfoPage")
	public String mentorBasicInfoPage(MentorDTO mentor, HttpSession session, Model model) {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		/*
		 * if(mentor_select.getIntro() != null & mentor_select.getUnable_date() != null
		 * & mentor_select.getMentoring_time() != null) {
		 * 
		 * model.addAttribute("msel", mentor_select);
		 * 
		 * return "mentor/mentorBasicInfoPage_View"; // 입력 완료 페이지 (상세페이지)
		 * 
		 * } else {
		 */
			model.addAttribute("msel", mentor_select);
			return "mentor/mentorBasicInfoPage"; // 입력 전 페이지 (입력폼)
		/*}*/
	}
	
	// 멘토 프로필 수정 [기본정보] 입력 정보 DB에 update
	@PostMapping("mentorBasicInfo_Up")
	public String mentorBasicInfo_Up(MentorDTO mentor, HttpSession session, Model model) {

		// mentor 객체에 member_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));

		// update 수행
		ms.mentorBasic_update(mentor);

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);

		return "mentor/mentorBasicInfoPage_View"; // 입력 완료 페이지 (상세페이지)
	}

	// 멘토 프로필 수정 [기본정보 입력 완료] 페이지
	@GetMapping("mentorBasicInfoPage_View")
	public String mentorBasicInfoPage_View(MentorDTO mentor, HttpSession session, Model model) {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorBasicInfoPage_View"; // 입력 완료 페이지 (상세페이지)
	}

	//   **********************************************[기본정보 end]******************************************************
	//   **********************************************[인적사항 start]******************************************************
	
	// 멘토 프로필 수정 [인적사항 작성 전] 페이지
	@GetMapping("mentorPersonInfoPage")
	public String mentorPersonInfoPage(MentorDTO mentor, HttpSession session, Model model) {

		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		// email split
		String email[] = mentor_select.getEmail().split("@");
		
		System.out.println("email:"+Arrays.toString(email));
		
		model.addAttribute("email", email);
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPersonInfoPage";
	}

	// 멘토 프로필 수정 [인적사항] 입력 정보 DB에  update
	@PostMapping("mentorPersonInfo_UP")
	public String mentorPersonInfo_UP(MentorDTO mentor, HttpSession session, Model model) {
		
		// mentor 객체에 member_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));

		// update 수행
		int result = ms.mentorPerson_update(mentor);
		System.out.println("result:"+result);

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPersonInfoPage_View";
	}
	
	// 멘토 프로필 수정 [인적사항 작성 완료] 페이지
	@GetMapping("mentorPersonInfoPage_View")
	public String mentorPersonInfoPage_View(MentorDTO mentor, HttpSession session, Model model) {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPersonInfoPage_View";
	}
	
	//   **********************************************[인적사항 end]******************************************************
	//   **********************************************[서비스요금 start]******************************************************
	
	// 멘토 프로필 수정 [서비스요금 작성 전] 페이지
	@GetMapping("mentorServiceCharPage")
	public String mentorServiceCharPage() {
		
		return "mentor/mentorServiceCharPage";
	}
	
	// 멘토 프로필 수정 [서비스요금] 입력 정보 DB에 insert
	@PostMapping("mentorServiceChar_Up")
	public String mentorServiceChar_Up(@RequestParam("call_mentoring") String call_mentoring, 
										@RequestParam("meet_mentoring") String meet_mentoring, 
										@RequestParam("call_mentoring_fee") int call_mentoring_fee, 
										@RequestParam("meet_mentoring_fee") int meet_mentoring_fee, 
										MentorDTO mentor, HttpSession session, Model model) {
		
		System.out.println("call_mentoring:"+call_mentoring);
		System.out.println("meet_mentoring:"+meet_mentoring);
		System.out.println("***************************************");
		System.out.println("call_mentoring_fee:"+call_mentoring_fee);
		System.out.println("meet_mentoring_fee:"+meet_mentoring_fee);
		System.out.println("***************************************");
		System.out.println("bank:"+mentor.getBank());
		System.out.println("account:"+mentor.getAccount());
		System.out.println("account_name:"+mentor.getAccount_name());
		
		
		/*
		 * int result = ms.service_kind_insert(mentor);
		 * System.out.println("result: "+result);
		 */
		 
		
		return "mentor/mentorServiceCharPage_View";
	}

	// 멘토 프로필 수정 [서비스요금 작성 완료] 페이지
	@PostMapping("mentorServiceCharPage_View")
	public String mentorServiceCharPage_View(MentorDTO mentor, HttpSession session, Model model) {
		
		
		return "mentor/mentorServiceCharPage_View";
	}
	
	//   **********************************************[서비스요금 end]******************************************************
	//   **********************************************[학력사항 start]******************************************************

	// 멘토 프로필 수정 [학력사항 작성 전] 페이지
	@GetMapping("mentorEduInfoPage")
	public String mentorEduInfoPage() {

		
		return "mentor/mentorEduInfoPage";
	}
	
	// 멘토 프로필 수정 [학력사항] 페이지
	@PostMapping("mentorEduInfo_UP")
	public String mentorEduInfo_UP(MentorDTO mentor, HttpSession session, Model model) {
		
		String[] school = mentor.getSchool().split(",");
		String[] entering_date = mentor.getEntering_date().split(",");
		String[] graduation_date = mentor.getGraduation_date().split(",");
		String[] degree = mentor.getDegree().split(",");
		String[] major = mentor.getMajor().split(",");
		String[] minor = mentor.getMinor().split(",");
		
		System.out.println(Arrays.toString(school));
		System.out.println(Arrays.toString(entering_date));
		System.out.println(Arrays.toString(graduation_date));
		System.out.println(Arrays.toString(degree));
		System.out.println(Arrays.toString(major));
		System.out.println(Arrays.toString(minor));
		
		for(int i=0; i<school.length; i++) {
			
			// mentor 객체에 mentor_no = session 할당
			mentor.setMentor_no((int) session.getAttribute("mentor_no"));
			
			mentor.setSchool(school[i]);
			mentor.setEntering_date(entering_date[i]);
			mentor.setGraduation_date(graduation_date[i]);
			mentor.setMajor(major[i]);
			
			if(degree[i].equals("N")) {
				mentor.setDegree(null);
			}else {
				mentor.setDegree(degree[i]);
			}
			
			System.out.println("mentor.getDegree()  "+ i + "  :  " +mentor.getDegree());
			
			if(minor[i].equals("N")) {
				mentor.setMinor(null);
			}else {
				mentor.setMinor(minor[i]);
			}

			System.out.println("mentor.getMinor()  "+ i + "  :  " +mentor.getMinor());
			
			int result = ms.education_insert(mentor);
			System.out.println("result  "+ i + "  :  " + result);
		}
		
		
		  // education 테이블 insert int result = ms.education_insert(mentor); // 글 작성 후
		  // 파일 업로드 처리(글_no 필요하므로)되도록 글 insert 실행 후 파일 insert 실행
		  
		  // System.out.println("education_insert:"+result);
		  
		  for (int i=0; i<mentor.getFiles().size(); i++) {
		  System.out.println("mentor.getFiles:"+mentor.getFiles().get(i)); }
		  
		  System.out.println(mentor.getFiles() == null);
		  System.out.println("mentor.getFile_no(): "+mentor.getFile_no());
		  System.out.println("mentor.getFiles(): "+mentor.getFiles());
		  
		  // file 테이블 insert [다중 파일 처리] 
		  List<FileDTO> files = fileUtils.uploadFiles(mentor.getFiles()); 
		  System.out.println(files);
		  
		  fileService.saveFiles(mentor.getFile_no(), files);
		 
		
		return "mentor/mentorEduInfoPage_View"; // [학력사항 작성 완료] 페이지
	}

	// 멘토 프로필 수정 [학력사항 작성 완료] 페이지
	@GetMapping("mentorEduInfoPage_View")
	public String mentorEduInfoPage_View() {
		
		
		return "mentor/mentorEduInfoPage_View";
	}
	
	//   **********************************************[학력사항 end]******************************************************
	//   **********************************************[경력사항 start]******************************************************

	// 멘토 프로필 수정 [경력사항] 페이지
	@GetMapping("mentorExpInfoPage")
	public String mentorExpInfoPage() {

		return "mentor/mentorExpInfoPage";
	}
	
	//   **********************************************[학력사항 end]******************************************************
	//   **********************************************[경력사항 start]******************************************************

	// 멘토 프로필 수정 [기술및분야] 페이지
	@GetMapping("mentorTechInfoPage")
	public String mentorTechInfoPage() {
		
		return "mentor/mentorTechInfoPage";
	}

	//   **********************************************[경력사항 end]******************************************************

	
	//   **********************************************[큰 지현]******************************************************
	//   **********************************************[상담 요청 start]******************************************************

	// 상담 신청 리스트 페이지
	@GetMapping("mentoringApplyListPage")
	public String boardList(@RequestParam(value="page", defaultValue="1") int currentPage,
							MyMentoringBean mymentoring, MentorDTO mentor,
							HttpSession session, Model model) throws Exception {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		System.out.println("search:"+ mymentoring.getSearch());
		System.out.println("currentPage:"+ currentPage);
					
		mymentoring.setMentor_no((int) session.getAttribute("mentor_no"));
		
        int rowPage = 10;
		int limit = 10;
	
		// 데이터 갯수
		int total = ms.getListCount(mymentoring);
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * limit;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
		System.out.println("startRow:"+ startRow);
		
		mymentoring.setStartRow(startRow);

		List<MyMentoringBean> list = ms.list(mymentoring);
		System.out.println("list:" + list);
		
		Paging paging = new Paging(total,rowPage,currentPage);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("page", currentPage);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);			
		model.addAttribute("search", mymentoring.getSearch());			
		model.addAttribute("keyword", mymentoring.getKeyword());			
			
		return "mentor/mentoringApplyListPage";
	}
				
	// 상담 신청 상세 페이지 (모달)
	@GetMapping("mentoringApplyDetailPage")
	public String mentoringApplyDetailPage() {
				
		return "mentor/mentoringApplyDetailPage";
	}
		
	// 예약된 상담 리스트 페이지
	@GetMapping("mentoringAcceptedListPage")
	public String mentoringAcceptedListPage(@RequestParam(value="page", defaultValue="1") int currentPage,
											MyMentoringBean mymentoring, MentorDTO mentor,
											HttpSession session, Model model) throws Exception {
			
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		System.out.println("search:"+ mymentoring.getSearch());
		System.out.println("currentPage:"+ currentPage);
					
		int rowPage = 10;
		int limit = 10;
		
		// 데이터 갯수
		int total = ms.getAcceptedListCount(mymentoring);
		System.out.println("total:" + total);
		
		int startRow = (currentPage - 1) * limit;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
		System.out.println("startRow:"+ startRow);
		
		mymentoring.setStartRow(startRow);
		
		List<MyMentoringBean> acceptedList = ms.acceptedList(mymentoring);
		System.out.println("acceptedList:" + acceptedList);
		
		Paging paging = new Paging(total,rowPage,currentPage);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("page", currentPage);
		model.addAttribute("paging", paging);
		model.addAttribute("acceptedList", acceptedList);			
		model.addAttribute("search", mymentoring.getSearch());			
		model.addAttribute("keyword", mymentoring.getKeyword());			

		
		return "mentor/mentoringAcceptedListPage";
	}
	
	// 예약된 상담 상세 페이지 (모달)
	@GetMapping("mentoringAcceptedDetailPage")
	public String mentoringAcceptedDetailPage() {
			
		return "mentor/mentoringAcceptedDetailPage";
	}
	
	// 멘토 일대일 문의 리스트 페이지
	@GetMapping("mentorInqueryListPage")
	public String mentorInqueryListPage(@RequestParam(value="page", defaultValue="1") int currentPage,
										InqueryBean inquery, MentorDTO mentor,
										HttpSession session, Model model) throws Exception {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		System.out.println("search:"+ inquery.getSearch());
		System.out.println("currentPage:"+ currentPage);
						
		int rowPage = 10;
		int limit = 10;
		
		// 데이터 갯수
		int total = inqueryService.getInqueryListCount(inquery);
		System.out.println("total:" + total);
		
		int startRow = (currentPage - 1) * limit;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
		System.out.println("startRow:"+ startRow);
		
		inquery.setStartRow(startRow);
		
		List<InqueryBean> inqueryList = inqueryService.inqueryList(inquery);
		System.out.println("list:" + inqueryList);
		
		Paging paging = new Paging(total,rowPage,currentPage);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("page", currentPage);
		model.addAttribute("paging", paging);
		model.addAttribute("inqueryList", inqueryList);	
		model.addAttribute("search", inquery.getSearch());
		
		return "mentor/mentorInqueryListPage";
	}
	

	// 멘토 일대일 문의 폼 페이지 이동
	@GetMapping("mentorInqueryFormPage")
	public String mentorInqueryFormPage(Model model) {
		
		return "mentor/mentorInqueryFormPage";
	}
	
	// 멘토 일대일 문의 폼 저장
	@PostMapping("mentorInquery")
	public String mentorInquery(@RequestParam String title, String content,
								int member_no, InqueryBean inquerybean, 
								Model model) {
		
		return "mentor/mentorInqueryListPage";	//	작성 후 리스트로 이동 
	}
		
}
