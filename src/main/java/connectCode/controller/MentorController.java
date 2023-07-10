package connectCode.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connectCode.model.AuthUser;
import connectCode.model.FileDTO;
import connectCode.model.MentorDTO;
import connectCode.model.MyMentoringBean;
import connectCode.service.FileService;
import connectCode.service.FileUtils;
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
	private PasswordEncoder passwordEncorder;

	//  **********************************************[작 지현]******************************************************
	//  **********************************************[멘토 메인 start]******************************************************
	// 멘토 메인 페이지
	@GetMapping("mentorPage")
	public String mentorPage(MentorDTO mentor, Authentication auth, Model model) {
		
		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		
		System.out.println("접속한 사람의 멘토넘은?: " + mentor_no);
		System.out.println("접속한 사람의 멤버넘은?: " + member_no);
		
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		mentor.setMember_no(member_no);	// mentor 객체에 member_no 할당

		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		String education_select_check = "";
		String career_select_check = "";
		String service_select_check = "";
		String license_select_check = "";
		
		// mentor_no으로 education  테이블 전체 검색 ['학력사항' 입력 확인용 : progress 증감]
		List<MentorDTO> education_select = ms.education_select(mentor);
		
		if (education_select.size() < 1) {
			education_select_check = "N";
		}else {
			education_select_check = "Y";
		}
		
		// mentor_no으로 career 테이블 전체 검색 ['경력사항' 입력 확인용 : progress 증감]
		List<MentorDTO> career_select = ms.career_select(mentor);

		if (career_select.size() < 1) {
			career_select_check = "N";
		}else {
			career_select_check = "Y";
		}
		
		// mentor_no으로 service 테이블 전체 검색 ['서비스요금' 입력 확인용 : progress 증감]
		List<MentorDTO> service_select = ms.service_select(mentor);
		
		if (service_select.size() < 1) {
			service_select_check = "N";
		}else {
			service_select_check = "Y";
		}
		
		List<MentorDTO> license_select = ms.license_select(mentor);
		
		if (license_select.size() < 1) {
			license_select_check = "N";
		}else {
			license_select_check = "Y";
		}
		
		int accepted_mentoring_count = ms.accepted_mentoring_count(mentor);
		int mentoring_review_count = ms.mentoring_review_count(mentor);
		List<MentorDTO> select_accepted_mentoring = ms.select_accepted_mentoring(mentor);
		
		model.addAttribute("select_accepted_mentoring", select_accepted_mentoring);
		model.addAttribute("mentoring_review_count", mentoring_review_count);
		model.addAttribute("accepted_mentoring_count", accepted_mentoring_count);
		model.addAttribute("license_select_check", license_select_check);
		model.addAttribute("service_select_check", service_select_check);
		model.addAttribute("career_select_check", career_select_check);
		model.addAttribute("education_select_check", education_select_check);
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPage";
	}

	// 멘토 프로필 관리 페이지
	@GetMapping("mentorProfileModifyPage")
	public String mentorProfileModifyPage(MentorDTO mentor, Authentication auth, Model model) {

		System.out.println("mentorProfileModifyPage :: mentor_no :: "+mentor.getMentor_no());
		System.out.println("mentorProfileModifyPage :: member_no :: "+mentor.getMember_no());
		
		mentor.setMember_no(mentor.getMember_no());
		
		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용 & 입력 확인용 : progress 증감] 
		MentorDTO  mentor_select = ms.mentorProfile(mentor);
		
		String education_select_check = "";
		String career_select_check = "";
		String service_select_check = "";
		String license_select_check = "";
		
		// mentor_no으로 education  테이블 전체 검색 ['학력사항' 입력 확인용 : progress 증감]
		List<MentorDTO> education_select = ms.education_select(mentor);
		
		if (education_select.size() < 1) {
			education_select_check = "N";
		}else {
			education_select_check = "Y";
		}
		
		// mentor_no으로 career 테이블 전체 검색 ['경력사항' 입력 확인용 : progress 증감]
		List<MentorDTO> career_select = ms.career_select(mentor);

		if (career_select.size() < 1) {
			career_select_check = "N";
		}else {
			career_select_check = "Y";
		}
		
		// mentor_no으로 service 테이블 전체 검색 ['서비스요금' 입력 확인용 : progress 증감]
		List<MentorDTO> service_select = ms.service_select(mentor);
		
		if (service_select.size() < 1) {
			service_select_check = "N";
		}else {
			service_select_check = "Y";
		}
		
		List<MentorDTO> license_select = ms.license_select(mentor);
		
		if (license_select.size() < 1) {
			license_select_check = "N";
		}else {
			license_select_check = "Y";
		}
		
		model.addAttribute("license_select_check", license_select_check);
		model.addAttribute("service_select_check", service_select_check);
		model.addAttribute("career_select_check", career_select_check);
		model.addAttribute("education_select_check", education_select_check);
		model.addAttribute("msel", mentor_select); 	// '기본정보' 입력 확인용 (intro로 확인)
		
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
		int result = ms.mentorTBL_update(mentor);
		System.out.println("result:"+result);

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorPersonInfoPage_View";
	}
	
	// 휴대폰 인증번호
	@RequestMapping("phoneChk")
	@ResponseBody
	public String phoneChk(String phone) {
		int randomNum = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);

		ms.phoneNumber(phone, randomNum);

		return Integer.toString(randomNum);
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
		
		String service_select_check = "";
		
		// mentor_no으로 service 테이블 전체 검색 ['서비스요금' 입력 확인용 : progress 증감]
		List<MentorDTO> service_select = ms.service_select(mentor);
		
		if (service_select.size() < 1) {
			service_select_check = "N";
		}else {
			service_select_check = "Y";
		}
		
		model.addAttribute("service_select_check", service_select_check);
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
		ms.service_insert(mentor);
		
		// 대면상담
		mentor.setMentoring_kind("30분 대면 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(meet_mentoring_fee));
		mentor.setAvailable_NY(meet_mentoring);
		ms.service_insert(mentor);
		
		// mentor 테이블 update 수행 [은행, 계좌번호, 예금주명]
		ms.mentorTBL_update(mentor);
		
		return "mentor/mentorServiceCharPage_View";
	}

	// 멘토 프로필 수정 [서비스요금 작성 완료] 페이지
	@GetMapping("mentorServiceCharPage_View")
	public String mentorServiceCharPage_View(MentorDTO mentor, Model model) {
		
		System.out.println("mentorServiceCharPage_View :: mentor_no :: "+mentor.getMentor_no());
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		List<MentorDTO> serviceTBL_select = ms.service_select(mentor);
		
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
		
		// service 테이블 update
		// 전화상담
		mentor.setMentoring_kind("20분 전화 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(call_mentoring_fee));
		mentor.setAvailable_NY(call_mentoring);
		int result1 = ms.service_update(mentor);
		System.out.println("20전화 result::"+result1);
		
		// 대면상담
		mentor.setMentoring_kind("30분 대면 멘토링");
		mentor.setMentoring_fee(Integer.parseInt(meet_mentoring_fee));
		mentor.setAvailable_NY(meet_mentoring);
		ms.service_update(mentor);
		
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
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("edu_sel", education_select);
		
		return "mentor/mentorEduInfoPage";
	}
	
	// 멘토 프로필 수정 [학력사항 승인 완료 후 수정] 페이지
	@GetMapping("mentorEduInfoPage_accepted")
	public String mentorEduInfoPage_accepted(MentorDTO mentor, Model model) {
		
		System.out.println("mentorEduInfoPage :: mentor_no :: "+mentor.getMentor_no());
		
		List<MentorDTO> education_select = ms.education_select(mentor);
		
		int file_no = education_select.get(0).getFile_no();
		System.out.println("fileNo:::"+file_no);
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("edu_sel", education_select);
		
		return "mentor/mentorEduInfoPage_accepted";
	}
	
	// 멘토 프로필 수정 [학력사항] 페이지
	@PostMapping("mentorEduInfo_Up")
	public String mentorEduInfo_Up_first(MentorDTO mentor, Model model) {
		
		System.out.println("mentorEduInfo_UP :: mentor_no :: "+mentor.getMentor_no());
		
	// 이미 데이터 있는데 수정하려 할 경우, delete 시키고 다시 insert 하는 걸로 처리함
		// mentor_no로 education 테이블 조회
		List<MentorDTO> find_file_no = ms.education_select(mentor);
		
		// 조회한 education 테이블의 List가 있으면 if문 실행, 없으면 if문 밖의 insert만 실행
		if(find_file_no.size() >= 1 ) {
			MentorDTO file_no = find_file_no.get(0); // 인덱스 0번의 MentorDTO 객체 가져오기
			System.out.println("file_no :: "+file_no);
			System.out.println("file_no.getFile_no() :: "+file_no.getFile_no());
			
			file_no.setMentor_no(mentor.getMentor_no());
			
			int result1 = ms.education_delete(file_no);	 // education 테이블 삭제
			int result2 = ms.delete_file(file_no);	 	 // file 테이블 삭제

			System.out.println("delete education :: "+ result1);
			System.out.println("delete file :: "+ result2);
		}
		
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
	public String mentorEduInfoPage_View(MentorDTO mentor, Model model) {
		
		System.out.println("mentorEduInfoPage_View :: mentor_no :: "+mentor.getMentor_no());

		List<MentorDTO> education_select = ms.education_select(mentor);
		
		//MentorDTO find_file_no = education_select.get(0); // 인덱스 0번의 MentorDTO 객체 가져오기
		int file_no = education_select.get(0).getFile_no();
		System.out.println("fileNo:::"+file_no);
		List<FileDTO> edu_file_list = ms.select_file(file_no);
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("edu_file_list", edu_file_list);
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

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("car_sel", career_select);
		
		return "mentor/mentorExpInfoPage";
	}
	
	// 멘토 프로필 수정 [경력사항] 페이지
	@PostMapping("mentorExpInfoPage_Up")
	public String mentorExpInfoPage_Up(MentorDTO mentor, Model model) {

		System.out.println("mentorExpInfoPage_Up::::::"+mentor);
		System.out.println("mentorExpInfoPage_Up :: mentor_no :: "+mentor.getMentor_no());
		
	// 이미 데이터 있는데 수정하려 할 경우, delete 시키고 다시 insert 하는 걸로 처리함
		// mentor_no로 education 테이블 조회
		List<MentorDTO> find_file_no = ms.career_select(mentor);
		
		// 조회한 education 테이블의 List가 있으면 if문 실행, 없으면 if문 밖의 insert만 실행
		if(find_file_no.size() >= 1 ) {
			MentorDTO file_no = find_file_no.get(0); // 인덱스 0번의 MentorDTO 객체 가져오기
			System.out.println("file_no :: "+file_no);
			System.out.println("file_no.getFile_no() :: "+file_no.getFile_no());
			
			file_no.setMentor_no(mentor.getMentor_no());
			
			int result1 = ms.career_delete(file_no); // career 테이블 데이터 삭제
			int result2 = ms.delete_file(file_no);	 // file 테이블 삭제

			System.out.println("delete education :: "+ result1);
			System.out.println("delete file :: "+ result2);
		}
		
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
		    String temp_departure_date = departure_dates[i];
		    
		    if(temp_departure_date.equals("N")) {
		    	LocalDate localDate = LocalDate.now(); // 현재 날짜
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 원하는 날짜 형식 지정
				temp_departure_date = localDate.format(formatter); // LocalDate 타입을 String 타입으로 변환
				departure_dates[i] = null;
		    }
		    
			LocalDate enteringDate = LocalDate.parse(entering_date);
			LocalDate departureDate = LocalDate.parse(temp_departure_date);
			
			Period period = Period.between(enteringDate, departureDate);
			years[i] = period.getYears();
		}
		
		// 결과 확인을 위해 배열 출력
		for (int year : years) {
		    System.out.println("년차 ::::: " + year + "년");
		}
		
		for(int i=0; i<company.length; i++) { 
			mentor.setCompany(company[i]);
			mentor.setEntering_date(entering_dates[i]);
			mentor.setDeparture_date(departure_dates[i]); 
			mentor.setTask(task[i]);
			mentor.setYears(mentor.getYears()+years[i]);
			  
			int result = ms.career_insert(mentor); 
			System.out.println("result  "+ i + "번째  :: " + result); 
		}
		 
		
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
	public String mentorExpInfoPage_View(MentorDTO mentor, Model model) {
		
		System.out.println("mentorExpInfoPage_View :: mentor_no :: "+mentor.getMentor_no());

		List<MentorDTO> career_select = ms.career_select(mentor);
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("car_sel", career_select);
		
		return "mentor/mentorExpInfoPage_View";
	}
	//   **********************************************[경력사항 end]******************************************************
	//   **********************************************[기술및분야 start]******************************************************

	// 멘토 프로필 수정 [기술및분야 작성 전] 페이지
	@GetMapping("mentorTechInfoPage")
	public String mentorTechInfoPage(MentorDTO mentor, Model model) {
		
		System.out.println("mentorTechInfoPage :: mentor_no :: "+mentor.getMentor_no());

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		List<MentorDTO> license_select = ms.license_select(mentor);
		
		if(license_select.size() >= 1) {
			String[] technology = mentor_select.getTechnology().split(",");
			List<String> technologyList = Arrays.asList(technology);
			
			System.out.println(technologyList);
			
			model.addAttribute("technologyList", technologyList);
		}
		
		
		model.addAttribute("lic_sel", license_select);
		model.addAttribute("msel", mentor_select);
		
		return "mentor/mentorTechInfoPage";
	}

	// 멘토 프로필 수정 [기술및분야] 페이지
	@PostMapping("mentorTechInfoPage_Up")
	public String mentorTechInfoPage_Up(MentorDTO mentor) {

		System.out.println("mentorTechInfoPage_Up::::::"+mentor);
		
		System.out.println("mentorTechInfoPage_Up :: mentor_no :: "+mentor.getMentor_no());
		
		if(!mentor.getTechnology().equals("")) {
			System.out.println(mentor.getTechnology());
			// update
			
			int result1 = ms.mentorTBL_update(mentor);
			
			System.out.println("mentorTBL_update ::: "+result1);
		}
		
		
		if(!mentor.getKind().equals("")) {
			
			System.out.println("들어오지마라.");
			
			String[] kind = mentor.getKind().split(",");
			String[] license_name = mentor.getLicense_name().split(",");
			String[] issuing_authority = mentor.getIssuing_authority().split(",");
			String[] issuing_date = mentor.getIssuing_date().split(",");

			System.out.println(Arrays.toString(kind));
			System.out.println(Arrays.toString(license_name));
			System.out.println(Arrays.toString(issuing_authority));
			System.out.println(Arrays.toString(issuing_date));
			
			for(int i=0; i<kind.length; i++) { 
				mentor.setKind(kind[i]);
				mentor.setLicense_name(license_name[i]);
				mentor.setIssuing_authority(issuing_authority[i]); 
				mentor.setIssuing_date(issuing_date[i]);
				
				int result2 = ms.license_insert(mentor);
			
				System.out.println("license_insert ::: "+result2);
			}
			
		}
		
		
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
		 
		
		// 멘토 classification update
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		if(mentor_select.getClassification() == 21) {
			int class_result = ms.apply_mentor_classification(mentor);
			System.out.println("요청 멘토(22)로 update :: "+class_result);
		}
		
		return "mentor/mentorTechInfoPage_View";
	}
	
	// 멘토 프로필 수정 [기술및분야 작성 완료] 페이지
	@GetMapping("mentorTechInfoPage_View")
	public String mentorTechInfoPage_View(MentorDTO mentor, Model model) {
		
		System.out.println("mentorTechInfoPage_View :: mentor_no :: "+mentor.getMentor_no());

		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		List<MentorDTO> license_select = ms.license_select(mentor);
		
		String[] technology = mentor_select.getTechnology().split(",");
		List<String> technologyList = Arrays.asList(technology);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("lic_sel", license_select);
		model.addAttribute("technologyList", technologyList);
		
		return "mentor/mentorTechInfoPage_View";
	}

	//   **********************************************[기술및분야 end]******************************************************

	
	//   **********************************************[큰 지현]******************************************************
	//   **********************************************[상담 요청 start]******************************************************

	// 멘토링 신청 리스트 페이지
	@GetMapping("mentoringApplyListPage")
	public String boardList(@RequestParam(value = "page", defaultValue = "1") int currentPage,
			MyMentoringBean mymentoring, MentorDTO mentor, Authentication auth, Model model) throws Exception {
		
		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		mentor.setMember_no(member_no);	// mentor 객체에 member_no 할당

		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		
		int rowPage = 10;
		int limit = 10;

		// 데이터 갯수
		int total = ms.getListCount(mymentoring);

		int startRow = (currentPage - 1) * limit; // limit로 추출하기 위한 시작번호 : 0, 10, 20...
		System.out.println("startRow:" + startRow);

		mymentoring.setStartRow(startRow);

		List<MyMentoringBean> list = ms.list(mymentoring);

		Paging paging = new Paging(total, rowPage, currentPage);

		// 모달 추가
		MyMentoringBean apply_detail = ms.apply_detail(mymentoring);
		model.addAttribute("apply_detail", apply_detail);

		model.addAttribute("page", currentPage);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("search", mymentoring.getSearch());
		model.addAttribute("keyword", mymentoring.getKeyword());

		return "mentor/mentoringApplyListPage";
	}
				
	// 멘토링 신청 상세 페이지 (모달)
	@GetMapping("mentoringApplyDetailPage")
	public String mentoringApplyDetailPage(MyMentoringBean mymentoring, MentorDTO mentor, Model model) {

		System.out.println("mentoringApplyDetailPage :: mentoring_no :: "+mymentoring.getMentoring_no());
		System.out.println("mentoringApply''Detail''Page :: mentor_no :: "+mymentoring.getMentor_no());
		
		// *** 추가
		MyMentoringBean apply_detail = ms.apply_detail(mymentoring);
		
		System.out.println("mentoringApplyDetailPage :: apply_detail :::::: "+apply_detail);

		model.addAttribute("mentoring_no", mymentoring.getMentoring_no());
		model.addAttribute("file_no", mymentoring.getFile_no());
		model.addAttribute("apply_detail", apply_detail);

		return "mentor/mentoringApplyDetailPage";
	}
	
	//	멘토링 신청 상세 모달 수락버튼
	@GetMapping("applyUpdate_ok")
	public String applyUpdate_ok(int mentoring_no, MentorDTO mentor,
								Authentication auth, Model model) {
		
		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		model.addAttribute("msel", mentor_select);
		
		int result = ms.update_apply_ok(mentoring_no);
		if(result == 1 ) System.out.println("수락성공");
		return "redirect:mentoringApplyListPage?mentor_no="+mentor_select.getMentor_no(); // 수락 후 신청 리스트로 이동
	}
	
	//	멘토링 신청 상세 모달 거절버튼
	@GetMapping("applyUpdate_no")
	public String applyUpdate_no(int mentoring_no, MentorDTO mentor,
								Authentication auth, Model model) {
		
		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		model.addAttribute("msel", mentor_select);
		
		int result = ms.update_apply_no(mentoring_no);
		if(result == 1 ) System.out.println("거절성공");
		return "redirect:mentoringApplyListPage?mentor_no="+mentor_select.getMentor_no(); // 수락 후 신청 리스트로 이동
	}
	
		
	 // 예약된 상담 리스트 페이지
	 @GetMapping("mentoringAcceptedListPage")
	 public String mentoringAcceptedListPage(@RequestParam(value = "page", defaultValue = "1")
	 										int currentPage, MyMentoringBean mymentoring, MentorDTO mentor,
	 										Authentication auth, Model model) {
		 
		 int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		 int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		
		 mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		 mentor.setMember_no(member_no);	// mentor 객체에 member_no 할당

		 // mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		 MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		 model.addAttribute("msel", mentor_select);

		 int rowPage = 10; int limit = 10;
		 
		 // 데이터 갯수 
		 int total = ms.getAcceptedListCount(mymentoring);
		 
		 int startRow = (currentPage - 1) * limit; // limit로 추출하기 위한 시작번호 : 0, 10, 20... 
		 
		 mymentoring.setStartRow(startRow);
		 
		 List<MyMentoringBean> acceptedList = ms.acceptedList(mymentoring);
		 
		 Paging paging = new Paging(total, rowPage, currentPage);
		
		 int no = total - (startRow + 1) + 1; model.addAttribute("no", no);
		  
		 model.addAttribute("page", currentPage); 
		 model.addAttribute("paging", paging); 
		 model.addAttribute("acceptedList", acceptedList);
		 model.addAttribute("search", mymentoring.getSearch());
		 model.addAttribute("keyword", mymentoring.getKeyword());
	  
	 	return "mentor/mentoringAcceptedListPage"; 
	 }

	 // 예약된 상담 상세 페이지 (모달)
	 @GetMapping("mentoringAcceptedDetailPage") 
	 public String mentoringAcceptedDetailPage(MyMentoringBean mymentoring, MentorDTO mentor, Model model) {
	 
		 System.out.println("mentoringAccepted'''Detail'''Page :: mentor_no :: "+mymentoring.getMentor_no());
		 
		 MentorDTO mentor_select = ms.mentorProfile(mentor);
		 model.addAttribute("msel", mentor_select);
		 
		 System.out.println(":::::::::::mymentoring.getMentoring_no():::::::::::" + mymentoring.getMentoring_no());
		 
		 // 추가 
		 MyMentoringBean accepted_detail = ms.accepted_detail(mymentoring);
		 
		 // **** 후기 추가 
		 List<MyMentoringBean> acceptedCancel_reason = ms.acceptedCancel_reason(mymentoring.getMentoring_no()); // 상세 페이지 답변글
		 
		 model.addAttribute("mymentoring", mymentoring);
		 model.addAttribute("acceptedCancel_reason", acceptedCancel_reason); // ****후기 추가 끝
		 
		 model.addAttribute("mentoring_no", mymentoring.getMentoring_no());
		 model.addAttribute("accepted_detail", accepted_detail);
	 
	 	return "mentor/mentoringAcceptedDetailPage"; 
	 }
	 
	 
	 // 멘토링 예약 상세 모달 취소버튼
	 @PostMapping("acceptedUpdate_no")
	 public String acceptedUpdate_no(MyMentoringBean mymentoring, MentorDTO mentor, Model model) {
	 
		 
		 System.out.println("acceptedUpdate_no :: mentor_no :: "+mymentoring.getMentor_no());

		 MentorDTO mentor_select = ms.mentorProfile(mentor);
		 model.addAttribute("msel", mentor_select);
		 
		 int result = ms.update_accepted_no(mymentoring); 
		 
		 if(result == 1 )
			 System.out.println("예약취소성공"); 
		 
		 System.out.println("cancel_reason:::"+mymentoring.getCancel_reason());
		 System.out.println("mentoring_no:::"+mymentoring.getMentor_no());
		 return "redirect:mentoringAcceptedListPage?mentor_no="+mentor_select.getMentor_no(); //수락 후 신청 리스트로 이동 
	 }
	  
	 // 멘토링 예약 상세 모달 상담완료 버튼
	 @GetMapping("acceptedUpdate_ok")
	 public String acceptedUpdate_ok(MyMentoringBean mymentoring, MentorDTO mentor, Authentication auth, Model model) {
	 
		System.out.println("acceptedUpdate_ok :: mentor_no :: "+mymentoring.getMentor_no());

		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		model.addAttribute("msel", mentor_select);
		 
		 
		int result = ms.update_accepted_ok(mymentoring);
		
	 	if(result == 1 )
			 System.out.println("상담성공");
		 
	 	return "redirect:mentoringAcceptedListPage?mentor_no="+mentor_select.getMentor_no(); // 수락 후 신청 리스트로 이동 
	 }

	 // 지난 멘토링 리스트
	 @GetMapping("mentoringFinishedListPage") 
	 public String mentoringFinishedListPage(@RequestParam(value = "page", defaultValue = "1")
	 										int currentPage, MyMentoringBean mymentoring, MentorDTO mentor,
	 										Authentication auth, Model model) {
	 
		System.out.println("acceptedUpdate_ok :: mentor_no :: "+mymentoring.getMentor_no());

		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		model.addAttribute("msel", mentor_select);
			 
		 
		 int rowPage = 10;
		 int limit = 10;

	 // 데이터 갯수 
		 int total = ms.getFinishedListCount(mymentoring);
		 System.out.println("total:" + total);
	 
		 int startRow = (currentPage - 1) * limit; // limit로 추출하기 위한 시작번호 : 0, 10, 20... 
		 System.out.println("startRow:" + startRow);
	 
		 mymentoring.setStartRow(startRow);
	 
		 List<MyMentoringBean> finishedList = ms.finishedList(mymentoring);
		 System.out.println("finishedList:" + finishedList);
		 
		 Paging paging = new Paging(total, rowPage, currentPage);
	
		 int no = total - (startRow + 1) + 1;
		 
		 model.addAttribute("no", no); 
		 model.addAttribute("page", currentPage);
		 model.addAttribute("paging", paging); 
		 model.addAttribute("finishedList", finishedList); 
		 model.addAttribute("search", mymentoring.getSearch());
		 model.addAttribute("keyword", mymentoring.getKeyword());
	 
		 return "mentor/mentoringFinishedListPage"; // 작성 후 리스트로 이동 
	 }
	 
	 // 지난 상담 상세페이지 (모달)
	 @GetMapping("mentoringFinishedDetailPage") 
	 public String mentoringFinishedDetailPage(MyMentoringBean mymentoring, MentorDTO mentor,
												Authentication auth,  Model model) {
	 
		System.out.println("acceptedUpdate_ok :: mentor_no :: "+mymentoring.getMentor_no());

		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		model.addAttribute("msel", mentor_select);
		 
		 System.out.println(":::::::::::mymentoring.getMentoring_no():::::::::::" +
		 mymentoring.getMentoring_no());
		 
		 // 추가 
		 MyMentoringBean finished_detail = ms.finished_detail(mymentoring);
		 
		 // **** 후기 추가 
		 List<MyMentoringBean> mentoringReview = ms.mentoringReview(mymentoring.getMentoring_no()); // 상세 페이지 답변글
		 
		 model.addAttribute("mymentoring", mymentoring);
		 model.addAttribute("mentoringReview", mentoringReview); // **** 후기 추가 끝
		 
		 model.addAttribute("mentoring_no", mymentoring.getMentoring_no());
		 model.addAttribute("finished_detail", finished_detail);
		 
		 return "mentor/mentoringFinishedDetailPage"; 
	 }

	 // 멘토 일대일 문의 리스트 페이지
	 @GetMapping("mentorInqueryListPage")
	 public String mentorInqueryListPage(@RequestParam(value = "page", defaultValue = "1") 
	 									int currentPage, MyMentoringBean mymentoring, MentorDTO mentor,
	 									Authentication auth, Model model) {
	 
		 int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		 mentor.setMentor_no(mentor_no); // mymentoring 객체에 mentor_no 할당

		 // mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		 MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		 model.addAttribute("msel", mentor_select);

		 
		 int rowPage = 10; int limit = 10;
		 
		 // 데이터 갯수 
		 int total = ms.getInqueryListCount(mymentoring); 
		 System.out.println("total:" + total);
		 
		 int startRow = (currentPage - 1) * limit; // limit로 추출하기 위한 시작번호 : 0, 10,20... 
		 System.out.println("startRow:" + startRow);
		 
		 mymentoring.setStartRow(startRow);
		 
		 List<MyMentoringBean> inqueryList = ms.inqueryList(mymentoring);
		 System.out.println("inqueryList:" + inqueryList);
		 
		 Paging paging = new Paging(total, rowPage, currentPage);
		 
		 int no = total - (startRow + 1) + 1;
		 
		 model.addAttribute("no", no); model.addAttribute("page", currentPage);
		 model.addAttribute("paging", paging); model.addAttribute("inqueryList",
		 inqueryList); model.addAttribute("search", mymentoring.getSearch());
		 model.addAttribute("keyword", mymentoring.getKeyword());
		 
		 return "mentor/mentorInqueryListPage";
	 }
	 
	 
	 // 멘토 일대일 문의 폼 페이지 이동
	 @GetMapping("mentorInqueryFormPage")
	 public String mentorInqueryFormPage(MentorDTO mentor,
											Authentication auth, Model model) {
	 
		 int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		 mentor.setMentor_no(mentor_no); // mymentoring 객체에 mentor_no 할당

		 // mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		 MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		 model.addAttribute("msel", mentor_select);
		 
	 return "mentor/mentorInqueryFormPage"; }
	 
	 // 멘토 일대일 문의 폼 저장
	 @PostMapping("mentorInquery") 
	 public String mentorInquery(@RequestParam("title") String title, @RequestParam("content")
	 								String content, MyMentoringBean mymentoring, 
	 								Authentication auth, Model model) {
	 
		 int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		 int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		 mymentoring.setMember_no(member_no);	// mymentoring 객체에 member_no 할당
		 
		 int result = ms.inqueryBoard(mymentoring); // 문의 작성 폼 if (result == 1)
		 System.out.println("문의 작성 완료"+result);
		 
		 return "redirect:mentorInqueryListPage?mentor_no="+mentor_no+"&member_no="+member_no; // 작성 후 리스트로 이동
	 }
	 
	 // 멘토 일대일 문의 상세 페이지 이동
	 @GetMapping("mentorInqueryDetail") 
	 public String mentorInqueryDetailPage(int post_no, int ref_post_no, int page, 
			 								MyMentoringBean mymentoring, MentorDTO mentor, Authentication auth, Model model) {
	
		 System.out.println("post_no"+post_no);
		 System.out.println("ref_post_no"+ref_post_no);
		 
		 int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		 int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();

		 mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		 mymentoring.setMember_no(member_no);	// mymentoring 객체에 member_no 할당

		 mymentoring = ms.getDetail(post_no); // 상세 페이지 이동
		 System.out.println("mymentoring:" + mymentoring);
		 
		 List<MyMentoringBean> inqueryReply = ms.inqueryReply(ref_post_no); // 상세 페이지 답변글
		  
		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("mymentoring", mymentoring);
		model.addAttribute("inqueryReply", inqueryReply);
		model.addAttribute("page", page);
		 
		return "mentor/mentorInqueryDetailPage"; 
	 }
	 
	 // 멘토 일대일 문의 수정 폼 (update Form)
	 
	 @GetMapping("mentorInqueryUpdateForm")
	 public String mentorInqueryUpdateForm(int post_no, int page, MyMentoringBean mymentoring, MentorDTO mentor,
			 								Authentication auth, Model model) {
	 
		int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		 
		mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
		mymentoring.setMember_no(member_no);	// mentor 객체에 member_no 할당
		 
		mymentoring = ms.getDetail(post_no); model.addAttribute("mymentoring", mymentoring);
		 
		// mentor_no으로 mentor JOIN career & alarm 테이블 검색 [사이드바 출력 내용]
		MentorDTO mentor_select = ms.mentorProfile(mentor);
		
		model.addAttribute("msel", mentor_select);
		model.addAttribute("page", page);
		 
		return "mentor/mentorInqueryUpdateForm"; 
	 }
	 
	 // 멘토 일대일 문의 수정 저장
	 
	 @PostMapping("mentorInqueryUpdate") 
	 public String mentorInqueryUpdate(@RequestParam("page") int page, MyMentoringBean mymentoring, 
			 							Authentication auth, Model model) {
	 
		 int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		 mymentoring.setMember_no(member_no);	// mentor 객체에 member_no 할당
	 
		 int result = ms.inqueryUpdate_ok(mymentoring); // 수정 메서드 호출 if(result == 1)
		 System.out.println("수정성공");
	 
		 ms.getDetail(mymentoring.getPost_no());
	 
	 return "redirect:mentorInqueryDetail?post_no="+mymentoring.getPost_no() + "&page=" + page + "&ref_post_no="+mymentoring.getRef_post_no(); }
	 
	 
	 // 멘토 일대일 게시판 글 삭제
	 @GetMapping("mentorInqueryDelete")
	 public String mentorInqueryDelete(@RequestParam("post_no") int post_no, @RequestParam("page") int page, 
			 							MyMentoringBean mymentoring, Authentication auth, Model model) {
	 
		 int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no();
		 int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		 mymentoring.setMember_no(member_no);	// mentor 객체에 member_no 할당
		 
		 int result = ms.delete_ok(post_no); // 삭제 메소드
		 
		 return "redirect:mentorInqueryListPage?page=" + page + "&mentor_no=" + mentor_no; 
	 }

	 /*
	 * // 멘토링 신청 상세 포트폴리오 ( 파일 업로드 )
	 * 
	 * @GetMapping("download") public void download(HttpServletRequest request,
	 * HttpServletResponse response) throws UnsupportedEncodingException { //
	 * response.setCharacterEncoding("utf-8");
	 * 
	 * System.out.println("download()..."); String fname =
	 * request.getParameter("fname"); System.out.println("fname = " + fname);
	 * 
	 * String DownloadPath = request.getRealPath("upload"); String path =
	 * DownloadPath + "\\" + fname; System.out.println("path=" + path);
	 * 
	 * File file = new File(path); String downName = file.getName(); //다운로드 받을 파일명을
	 * 절대경로로 구해옴
	 * 
	 * // 이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다 downName = new
	 * String(downName.getBytes("utf-8"), "iso-8859-1");
	 * 
	 * // octet-stream은 8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다. //
	 * response.setHeader("Content-Type", "application/octet-stream");
	 * response.setContentType("application/octet-stream");
	 * response.setHeader("Content-Disposition", "attachment; filename=\"" +
	 * downName + "\"");
	 * 
	 * FileInputStream in = null; OutputStream out = null; try { in = new
	 * FileInputStream(file); out = response.getOutputStream();
	 * FileCopyUtils.copy(in, out); } catch (FileNotFoundException e) {
	 * e.printStackTrace(); } catch (IOException e) { e.printStackTrace(); } }
	 */
	
	// ********************************************************************
	/*
	 * @GetMapping("mentorPwModifyPage") public String mentorPwModifyPage(MentorDTO
	 * mentor, Authentication auth, Model model) {
	 * 
	 * int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no(); int member_no
	 * = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
	 * 
	 * mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
	 * mentor.setMember_no(member_no); // mentor 객체에 member_no 할당
	 * 
	 * // mentor_no으로 mentor 테이블 전체 검색 MentorDTO mentor_select =
	 * ms.mentorProfile(mentor);
	 * 
	 * model.addAttribute("msel", mentor_select);
	 * 
	 * return "mentor/mentorPwModifyPage"; }
	 */
	
	 @GetMapping("mentorAlarmListPage")
	   public String mentorAlarmListPage(String pageNum, MentorDTO mentor, Authentication auth, Model model) {
	      
	      int mentor_no = ((AuthUser)(auth.getPrincipal())).getMentor_no();
	        int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
	        
	       final int rowPage = 10;

	      if (pageNum == null || pageNum.equals("")) {
	         pageNum = "1";
	      }
	      int currentPage = Integer.parseInt(pageNum);

	      int total = ms.getTotal(member_no);
	      //System.out.println("total:;;;;;;;;;;;;;;;;;;;;;;;;"+total);
	      
	      int startRow = (currentPage - 1) * rowPage;
	      int endRow = rowPage;

	      Paging paging = new Paging(total, rowPage, currentPage);

	      mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
	      mentor.setMember_no(member_no);   // mentor 객체에 member_no 할당
	      
	      List<MentorDTO> select_alarm = ms.select_alarm(mentor);
	      System.out.println("select_alarm:"+select_alarm);
	      
	      // mentor_no으로 mentor 테이블 전체 검색
	      MentorDTO mentor_select = ms.mentorProfile(mentor);
	      //System.out.println("mentor_select:"+mentor_select);
	      
	      mentor.setStartRow(startRow);
	      mentor.setEndRow(endRow);

	      model.addAttribute("search", mentor.getSearch());
	      model.addAttribute("keyword", mentor.getKeyword());
	      model.addAttribute("paging", paging);
	      model.addAttribute("msel", mentor_select);
	      model.addAttribute("sel_alarm", select_alarm);
	       
	       return "mentor/mentorAlarmListPage";
	   }
	
	
	@GetMapping("mentorAlarmDetailPage")
	public String mentorAlarmDetailPage(MentorDTO mentor, Authentication auth, Model model) {
		
		int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
		
		mentor.setMember_no(member_no);	// mentor 객체에 member_no 할당
		
		MentorDTO select_alarm_detail = ms.select_alarm_detail(mentor);
		
		if(select_alarm_detail.getRead_yn().equals("N")) {
			int result = ms.update_alarm(select_alarm_detail.getAlarm_no());
			System.out.println("update_alarm :: "+result);
		}
		
		model.addAttribute("detail_al", select_alarm_detail);
		
		return "mentor/mentorAlarmDetailPage";
	}
	
	   // ---------------------------------------------- 혜지 작성 ------------------------------------------------------------------
	   
    // 탈퇴 폼
    @GetMapping("deleteMentor")
    public String deleteMentor(Authentication auth) {
       int mentor_no = ((AuthUser)(auth.getPrincipal())).getMentor_no();
       
       return "mentor/deleteMentor";
    }
    
    // 멘토 탈퇴
    @PostMapping("mentorDel_ok")
    public String mentorDel_ok(String password, String quit_reason, HttpSession session, Model model, Authentication auth) {
       int mentor_no = ((AuthUser)(auth.getPrincipal())).getMentor_no();
       
       MentorDTO member = ms.mentorDetail(mentor_no);
       
       int result = 0;
       
       if(passwordEncorder.matches(password, member.getPassword())) {
          
          member.setQuit_reason(quit_reason);
          
          //System.out.println("member;;;;;;"+member);
          
          ms.insertquittbl(member);
          ms.quit_mentor(member);
          
          result = 1;
          model.addAttribute("result", result);

          session.invalidate();
          return "mentor/deleteMentorResult";
       }else {
          result = 2;
          model.addAttribute("result", result);
          
          return "mentor/deleteMentorResult";
       }
       
    }
    
    // 비밀번호 변경 폼
    @GetMapping("mentorPwModifyPage")
    public String mentorPwModifyPage(Authentication auth, MentorDTO mentor, Model model) {
       
	   int mentor_no = ((AuthUser)auth.getPrincipal()).getMentor_no(); 
	   int member_no = ((AuthUser)auth.getPrincipal()).getMember().getMember_no();
	  	 
	   mentor.setMentor_no(mentor_no); // mentor 객체에 mentor_no 할당
	   mentor.setMember_no(member_no); // mentor 객체에 member_no 할당
	  	 
	   // mentor_no으로 mentor 테이블 전체 검색 
	   MentorDTO mentor_select = ms.mentorProfile(mentor);
	 	 
	   model.addAttribute("msel", mentor_select);
       
       return "mentor/mentorPwModifyPage";
    }
    
    @PostMapping("mentorUpdatePw_ok")
    public String mentorUpdatePw_ok(String password, String newpasswd, Authentication auth, Model model) {
       int mentor_no = ((AuthUser)(auth.getPrincipal())).getMentor_no();
       
       int result = 0;
       
       MentorDTO member = ms.mentorDetail(mentor_no);
       //System.out.println("member;;;;;;;;;;;;" + member);

       if(passwordEncorder.matches(password, member.getPassword())) {
          
          String encodepw = passwordEncorder.encode(newpasswd);
          
          member.setPassword(encodepw);
          
          ms.mentorNewPwd(member);
          
          result = 3;
          
          model.addAttribute("result", result);
          
          return "mentor/deleteMentorResult";
       }else {
          
          result = 2;

          model.addAttribute("result", result);
          
          return "mentor/deleteMentorResult";
       }
       
    }
    
    

}
