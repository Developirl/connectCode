package connectCode.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
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
import retrofit2.http.HTTP;

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
 		//session.setAttribute("mentor_no", 13); // 송강 23(승인)
		session.setAttribute("mentor_no", 19); // 김방정
		System.out.println("누가 접속 하셨나요?:" + (int)session.getAttribute("mentor_no"));
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));

		// mentor_no으로 member_no 찾아서 할당 [alarm 테이블 조회에 사용]
		int member_no = ms.select_member_no(mentor); // member_no 찾기
		mentor.setMember_no(member_no);				 // mentor 객체에 member_no 할당

		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPage";
	}

	// 멘토 프로필 관리 페이지
	@GetMapping("mentorProfileModifyPage")
	public String mentorProfileModifyPage(MentorDTO mentor, Model model) {

		System.out.println("mentorProfileModifyPage :: mentor_no :: "+mentor.getMentor_no());
		
		// mentor_no으로 member_no 찾아서 할당 [alarm 테이블 조회에 사용] 
		int member_no = ms.select_member_no(mentor); // member_no 찾기 
		mentor.setMember_no(member_no);				 // mentor 객체에 member_no 할당
		  
		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용 & 입력 확인용 : progress 증감] 
		MentorDTO  mentor_select = ms.mentorProfile(mentor);
		
		// mentor_no으로 education JOIN file 테이블 전체 검색 [입력 확인용 : progress 증감]
		List<MentorDTO> education_select = ms.education_select(mentor);
		
		// mentor_no으로 career JOIN file 테이블 전체 검색 [입력 확인용 : progress 증감]
		List<MentorDTO> career_select = ms.career_select(mentor);
		
		model.addAttribute("car_list_size", career_select.size());		// List 이므로 size로 반환하여 입력 확인
		model.addAttribute("edu_list_size", education_select.size());	// List 이므로 size로 반환하여 입력 확인
		model.addAttribute("msel", mentor_select); 						// 입력 확인은 intro, account로 확인
		
		return "mentor/mentorProfileModifyPage";
	}
	
	//  **********************************************[멘토 메인 end]******************************************************
	//  **********************************************[기본정보 start]******************************************************
	
	// 멘토 프로필 수정 [기본정보 입력 전] 페이지
	@GetMapping("mentorBasicInfoPage")
	public String mentorBasicInfoPage(MentorDTO mentor, Model model) {
		
		System.out.println("mentorBasicInfoPage :: mentor_no :: "+mentor.getMentor_no());
		
		// mentor_no으로 mentor 테이블 전체 검색 [수정폼 value 출력용]
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorBasicInfoPage"; // 입력 전 페이지 (입력폼)
	}
	
	// 멘토 프로필 수정 [기본정보] 입력 정보 DB에 update
	@PostMapping("mentorBasicInfo_Up")
	public String mentorBasicInfo_Up(MentorDTO mentor, Model model) {

		System.out.println("mentorBasicInfo_Up :: mentor_no :: "+mentor.getMentor_no());

		// mentor 테이블 update 수행 [프사, 소개글, 상담불가요일, 상담가능시간]
		ms.mentorTBL_update(mentor);

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		System.out.println(mentor.getFiles() == null);
		System.out.println("Files size ::: "+mentor.getFiles().size());
		System.out.println("mentor.getFile_no(): "+mentor.getFile_no());
		System.out.println("mentor.getFiles(): "+mentor.getFiles());
		
		// file 테이블 insert [다중 파일 처리] 
		List<FileDTO> files = fileUtils.uploadFiles(mentor.getFiles()); 
		System.out.println(files);
		  
		fileService.saveFiles(mentor.getFile_no(), files);
		
		model.addAttribute("msel", mentor_select);

		return "mentor/mentorBasicInfoPage_View"; // 입력 완료 페이지 (상세페이지)
	}

	// 멘토 프로필 수정 [기본정보 입력 완료] 페이지
	@GetMapping("mentorBasicInfoPage_View")
	public String mentorBasicInfoPage_View(MentorDTO mentor, Model model) {
		
		System.out.println("mentorBasicInfoPage_View :: mentor_no :: "+mentor.getMentor_no());
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorBasicInfoPage_View"; // 입력 완료 페이지 (상세페이지)
	}

	//   **********************************************[기본정보 end]******************************************************
	//   **********************************************[인적사항 start]******************************************************
	
	// 멘토 프로필 수정 [인적사항 작성 전] 페이지
	@GetMapping("mentorPersonInfoPage")
	public String mentorPersonInfoPage(MentorDTO mentor, Model model) {

		System.out.println("mentorPersonInfoPage :: mentor_no :: "+mentor.getMentor_no());
		
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
	public String mentorPersonInfo_UP(MentorDTO mentor, Model model) {

		System.out.println("mentorPersonInfo_UP :: mentor_no :: "+mentor.getMentor_no());

		// update 수행
		int result = ms.mentorPerson_update(mentor);
		System.out.println("result:"+result);

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPersonInfoPage_View";
	}
	
	// 멘토 프로필 수정 [인적사항 작성 완료] 페이지
	@GetMapping("mentorPersonInfoPage_View")
	public String mentorPersonInfoPage_View(MentorDTO mentor, Model model) {

		System.out.println("mentorPersonInfoPage_View :: mentor_no :: "+mentor.getMentor_no());
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPersonInfoPage_View";
	}
	
	//   **********************************************[인적사항 end]******************************************************
	//   **********************************************[서비스요금 start]******************************************************
	
	// 멘토 프로필 수정 [서비스요금 작성 전] 페이지
	@GetMapping("mentorServiceCharPage")
	public String mentorServiceCharPage(MentorDTO mentor, Model model) {
		
		System.out.println("mentorServiceCharPage :: mentor_no :: "+mentor.getMentor_no());
		
		// mentor_no으로 mentor 테이블 전체 검색 
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		/*
		 * List<MentorDTO> serviceTBL_select = ms.serviceTBL_select(mentor); MentorDTO[]
		 * serviceTBL_select_array = serviceTBL_select.toArray(new MentorDTO[0]);
		 * 
		 * for(int i=0; i<serviceTBL_select_array.length; i++) {
		 * System.out.println(serviceTBL_select_array[i]); }
		 * model.addAttribute("ser_sel", serviceTBL_select_array);
		 */
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorServiceCharPage";
	}
	
	// 멘토 프로필 수정 [서비스요금] 입력 정보 DB에 insert & update
	@PostMapping("mentorServiceChar_Up_first")
	public String mentorServiceChar_Up_first(@RequestParam("call_mentoring") String call_mentoring, 
										@RequestParam("meet_mentoring") String meet_mentoring, 
										@RequestParam("call_mentoring_fee") String call_mentoring_fee, 
										@RequestParam("meet_mentoring_fee") String meet_mentoring_fee, 
										MentorDTO mentor, Model model) {

		System.out.println("mentorServiceChar_Up_first :: mentor_no :: "+mentor.getMentor_no());
		
		// 이용하지 않을 [상담 종류] 체크 안할 경우, [상담 요금]에 "0"을 넣음 => null 값 insert 못하므로오 ..왜?!
		if(call_mentoring_fee.equals("")) {
			call_mentoring_fee = "0";
		}
		if(meet_mentoring_fee.equals("")) {
			meet_mentoring_fee = "0";
		}
		
		// service 테이블 insert
		// 전화상담
		mentor.setMentoring_kind("20분 전화 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(call_mentoring_fee));
		mentor.setAvailable_NY(call_mentoring);
		ms.serviceTBL_insert(mentor);
		
		// 대면상담
		mentor.setMentoring_kind("30분 대면 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(meet_mentoring_fee));
		mentor.setAvailable_NY(meet_mentoring);
		ms.serviceTBL_insert(mentor);
		
		// mentor 테이블 update 수행 [은행, 계좌번호, 예금주명]
		ms.mentorTBL_update(mentor);
		
		return "mentor/mentorServiceCharPage_View";
	}

	// 멘토 프로필 수정 [서비스요금 작성 완료] 페이지
	@GetMapping("mentorServiceCharPage_View")
	public String mentorServiceCharPage_View(MentorDTO mentor, Model model) {
		
		System.out.println("mentorServiceCharPage_View :: mentor_no :: "+mentor.getMentor_no());
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		List<MentorDTO> serviceTBL_select = ms.serviceTBL_select(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("ser_sel", serviceTBL_select);
		
		return "mentor/mentorServiceCharPage_View";
	}
	
	@PostMapping("mentorServiceChar_Up")
	public String mentorServiceChar_Up(@RequestParam("call_mentoring") String call_mentoring, 
										@RequestParam("meet_mentoring") String meet_mentoring, 
										@RequestParam("call_mentoring_fee") String call_mentoring_fee, 
										@RequestParam("meet_mentoring_fee") String meet_mentoring_fee, 
										MentorDTO mentor, Model model) {
		
		System.out.println("mentorServiceChar_Up :: mentor_no :: "+mentor.getMentor_no());

		// 이용하지 않을 [상담 종류] 체크 안할 경우, [상담 요금]에 "0"을 넣음 => null 값 insert 못하므로오 ..왜?!
		if(call_mentoring_fee.equals("")) {
			call_mentoring_fee = "0";
		}
		if(meet_mentoring_fee.equals("")) {
			meet_mentoring_fee = "0";
		}
		
		// service 테이블 insert
		// 전화상담
		mentor.setMentoring_kind("20분 전화 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(call_mentoring_fee));
		mentor.setAvailable_NY(call_mentoring);
		int result1 = ms.serviceTBL_update(mentor);
		System.out.println("20전화 result::"+result1);
		
		// 대면상담
		mentor.setMentoring_kind("30분 대면 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(meet_mentoring_fee));
		mentor.setAvailable_NY(meet_mentoring);
		int result2 = ms.serviceTBL_update(mentor);
		System.out.println("30대면 result::"+result2);
		
		// mentor 테이블 update 수행 [은행, 계좌번호, 예금주명]
		ms.mentorTBL_update(mentor);
		
		
		return "mentor/mentorServiceCharPage_View";
	}
	
	//   **********************************************[서비스요금 end]******************************************************
	//   **********************************************[학력사항 start]******************************************************

	// 멘토 프로필 수정 [학력사항 작성 전] 페이지
	@GetMapping("mentorEduInfoPage")
	public String mentorEduInfoPage(MentorDTO mentor, Model model) {
		
		System.out.println("mentorEduInfoPage :: mentor_no :: "+mentor.getMentor_no());
		
		List<MentorDTO> education_select = ms.education_select(mentor);
		
		model.addAttribute("edu_sel", education_select);
		
		return "mentor/mentorEduInfoPage";
	}
	
	// 멘토 프로필 수정 [학력사항] 페이지
	@PostMapping("mentorEduInfo_UP")
	public String mentorEduInfo_UP(MentorDTO mentor, Model model) {
		
		System.out.println("mentorEduInfo_UP :: mentor_no :: "+mentor.getMentor_no());

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
			  System.out.println("mentor.getFiles:"+mentor.getFiles().get(i));
		  }
		  
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
	public String mentorEduInfoPage_View(MentorDTO mentor, HttpSession session, Model model) {
		
		System.out.println("mentorEduInfoPage_View :: mentor_no :: "+mentor.getMentor_no());

		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		List<MentorDTO> education_select = ms.education_select(mentor);
		
		MentorDTO find_file_no = education_select.get(0); // 인덱스 0번의 MentorDTO 객체 가져오기
		int file_no = find_file_no.getFile_no();
		System.out.println("fileNo:::"+file_no);
		
		model.addAttribute("edu_sel", education_select);
		
		return "mentor/mentorEduInfoPage_View";
	}
	
	//   **********************************************[학력사항 end]******************************************************
	//   **********************************************[경력사항 start]******************************************************

	// 멘토 프로필 수정 [경력사항] 페이지
	@GetMapping("mentorExpInfoPage")
	public String mentorExpInfoPage(MentorDTO mentor, Model model) {

		System.out.println("mentorExpInfoPage :: mentor_no :: "+mentor.getMentor_no());
		
		List<MentorDTO> career_select = ms.career_select(mentor);
		
		model.addAttribute("car_sel", career_select);
		
		return "mentor/mentorExpInfoPage";
	}
	
	// 멘토 프로필 수정 [경력사항] 페이지
	@PostMapping("mentorExpInfoPage_Up")
	public String mentorExpInfoPage_Up(MentorDTO mentor, Model model) {

		System.out.println("mentorExpInfoPage_Up :: mentor_no :: "+mentor.getMentor_no());
		
		String[] company = mentor.getCompany().split(",");
		String[] entering_dates = mentor.getEntering_date().split(",");
		String[] departure_dates = mentor.getDeparture_date().split(",");
		String[] task = mentor.getTask().split(",");
		
		System.out.println(Arrays.toString(company));
		System.out.println(Arrays.toString(entering_dates));
		System.out.println(Arrays.toString(departure_dates));
		System.out.println(Arrays.toString(task));
		
		int[] years = new int[entering_dates.length]; // 연차를 저장할 배열
		
		for (int i = 0; i < entering_dates.length; i++) {
		    String entering_date = entering_dates[i];
		    
		    if(departure_dates[i].equals("")) {
		    	LocalDate localDate = LocalDate.now(); // 현재 날짜
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 원하는 날짜 형식 지정
				departure_dates[i] = localDate.format(formatter); // LocalDate 타입을 String 타입으로 변환

		    }
		    String departure_date = departure_dates[i];
		    
			LocalDate enteringDate = LocalDate.parse(entering_date);
			LocalDate departureDate = LocalDate.parse(departure_date);
			
			Period period = Period.between(enteringDate, departureDate);
			years[i] = period.getYears();
		}
		
		// 결과 확인을 위해 배열 출력
		for (int year : years) {
		    System.out.println("년차 ::::: " + year + "년");
		}
		
		for(int i=0; i<company.length; i++) { 
			mentor.setSchool(company[i]);
			mentor.setEntering_date(entering_dates[i]);
			mentor.setDeparture_date(departure_dates[i]); 
			mentor.setMajor(task[i]);
			mentor.setYears(mentor.getYears()+years[i]);
			  
			int result = ms.career_insert(mentor); 
			System.out.println("result  "+ i + "번째  :: " + result); 
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
		 
		
		return "mentor/mentorExpInfoPage_View";
	}

	// 멘토 프로필 수정 [학력사항 작성 완료] 페이지
	@GetMapping("mentorExpInfoPage_View")
	public String mentorExpInfoPage_View(MentorDTO mentor, HttpSession session, Model model) {
		
		System.out.println("mentorExpInfoPage_View :: mentor_no :: "+mentor.getMentor_no());

		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		List<MentorDTO> career_select = ms.career_select(mentor);
		
		model.addAttribute("car_sel", career_select);
		
		return "mentor/mentorExpInfoPage_View";
	}
	//   **********************************************[경력사항 end]******************************************************
	//   **********************************************[기술및분야 start]******************************************************

	// 멘토 프로필 수정 [기술및분야] 페이지
	@GetMapping("mentorTechInfoPage")
	public String mentorTechInfoPage() {
		
		return "mentor/mentorTechInfoPage";
	}

	//   **********************************************[기술및분야 end]******************************************************

	
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
		
	
	// ********************************************************************
	@GetMapping("mentorPwModifyPage")
	public String mentorPwModifyPage(MentorDTO mentor, HttpSession session, Model model) {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// member_no 찾아서 할당
		int member_no = ms.select_member_no(mentor);
		mentor.setMember_no(member_no);
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPwModifyPage";
	}
	
	@GetMapping("mentorAlarmListPage")
	public String mentorAlarmListPage(MentorDTO mentor, HttpSession session, Model model) {
		
		// mentor 객체에 mentor_no = session 할당
		mentor.setMentor_no((int) session.getAttribute("mentor_no"));
		
		// member_no 찾아서 할당
		int member_no = ms.select_member_no(mentor);
		mentor.setMember_no(member_no);
		
		// mentor_no으로 mentor 테이블 전체 검색
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorAlarmListPage";
	}
	
	
	
}
