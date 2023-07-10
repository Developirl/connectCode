package connectCode.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import connectCode.model.AuthUser;
import connectCode.model.FileDTO;
import connectCode.model.FindMentorBeanFactory;
import connectCode.model.FindMentorDTO;
import connectCode.model.FindMentorInfoDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.MentoringDTO;
import connectCode.model.PaymentDTO;
import connectCode.service.FileService;
import connectCode.service.FileUtils;
import connectCode.service.FindMentorService;
import connectCode.service.MasterService;
import connectCode.service.MasterServiceImpl;

@Controller
@RequestMapping("/findMentor/*")
public class FindMentor {
	
	
	@Autowired
	private FindMentorService service;
	
	// file 업로드용 
	@Autowired
	private FileService fileService;
	// file 업로드용 
	@Autowired
	private FileUtils fileUtils;
	
	@Value("${js_kakao_key}")
	private String kakaokey1;

	@GetMapping("mentorlistpage")
	public String mentorlistpage(@RequestParam(value="page",defaultValue = "1") String page, 
			Model model,
			HttpSession session,
			FindMentorDTO dto,
			Authentication auth) {
		
		// 임의로 member_no 값 설정 
		//session.setAttribute("member_no", 2);
		
		/*  페이징 처리 안할거라서 주석 처리함.
		 * int currentPage = Integer.parseInt(page); int total = service.getTotal(dto);
		 * System.out.println("구해온 총 데이터 수 : "+total);  // 나중에 서비스랑 dao 에 있는 메소드도 제거해줘야함. getTotal()
		 */
		
		/*
		 * FindMentorPageMaker pmk = new FindMentorPageMaker(10,currentPage,total,5);
		 * System.out.println("pageMaker:"+pmk);
		 */
		
		//dto.setStartEndRow(pmk); //FindMentorDTO dto에  start/end 번호 세팅
		
		//System.out.println("startRow,endRow:"+dto.getStartRow()+" "+dto.getEndRow());
		
		List<FindMentorDTO> list = service.getMentorList(dto); 
        System.out.println("list:"+list);
        
        String member_no = null;
        
        if(auth!=null) {
        	member_no = String.valueOf(((AuthUser)auth.getPrincipal()).getMember().getMember_no());
        }
        
        list = service.setRemaining(list,member_no); // reivewcount, mentoring_kind, fee, bookmark 셋팅
        
        
        
        FindMentorBeanFactory fac = new FindMentorBeanFactory();
        
        System.out.println("모든 멘토 : ");
        System.out.println(list);
		
		// 필요한 정보 : 멘토 테이블 컬럼 모두 , 리뷰 수 , 기술 스택, 각 서비스의 요금
        model.addAttribute("list",list);
        model.addAttribute("listsize",list.size());
        
        // 이전에 검색을 했다면 해당 검색내역을 띄울 수 있도록 필터 데이터를 dto채로 넘겨준다.
        model.addAttribute("filterdto",dto);

        // 검색 필터에 필요한 리스트 dto에서 꺼내서 view단으로 넘겨줌
		model.addAttribute("techStacks",fac.techStacks());
		model.addAttribute("regionList",fac.region());
		
		
		return "findMentor/mentorListPage";
	}
	
	
	
	//특정 멘토의 즐겨찾기 값 update
	@PostMapping("bookmarkChange")
	@ResponseBody
	public String bookmarkChange(int clickchecked,int mentor_no,
			Authentication auth) {
		
		System.out.println("clickchecked :"+clickchecked);
		System.out.println("mentor_no :"+mentor_no);
		
		String result = ""; 
		
		 int member_no = 0;
	        
	        if(auth!=null) {
	        	member_no = Integer.parseInt(String.valueOf(((AuthUser)auth.getPrincipal()).getMember().getMember_no()));
	        }
		
	    System.out.println("세션에서 가져온 member_no : "+member_no);    
	        
	    if(clickchecked == 0) {
	    	int rsp = service.deleteBookmark(member_no,mentor_no);
	    	System.out.println("여기 들어와?");
	    	if(rsp == 1) {
	    		result = "0";
	    		System.out.println("북마크를 삭제합니다. ");
	    	}
	    }else if(clickchecked==1) {
	    	int rsp = service.insertBookmark(member_no,mentor_no);
	    	if(rsp == 1) {
	    		result = "1";
	    		System.out.println("북마크를 추가합니다. ");
	    	}
	    }
		
		return result;
	}
	
	
	
	
	
	// 멘토 정보 상세페이지로 이동. 
	@GetMapping("MentorProfileDetailPage") 
	public String applyMentoringPage(int mentor_no,
			Model model,
			Authentication auth) {
		
		// 필요한 데이터1. 경력사항(career)/학력사항(education)/수상내역(license)/지역/비용(service)/후기(review)
		
		// 멘토 카드 
		FindMentorDTO dto = service.getMentorProfile(mentor_no);
		System.out.println(dto);
		
		 int member_no = 0;
	        
	        if(auth!=null) {
	        	member_no = Integer.parseInt(String.valueOf(((AuthUser)auth.getPrincipal()).getMember().getMember_no()));
	        	model.addAttribute("notEmptySession","true");
	        }
	        
	    int bookmark = service.getCheckedBookmark(member_no,mentor_no);    
		
		dto.setCheckedBookmark(bookmark); // 여기 에러 났었는데? NullPointer
		System.out.println("bookmark 값 :"+bookmark);
		
		// 멘토 경력 사항
		List<FindMentorInfoDTO> careerlist = service.getCareerList(mentor_no);
		
		// 멘토 학력 사항
		List<FindMentorInfoDTO> edulist = service.getEducationList(mentor_no);
		
		// 멘토 자격증,수상내역
		List<FindMentorInfoDTO> licenselist = service.getLicenseList(mentor_no);
		
		// 멘토링 비용
		List<FindMentorInfoDTO> payment = service.getPayment(mentor_no);
		
		// 멘토링 리뷰 
		List<FindMentorInfoDTO> review = service.getReviewList(mentor_no);
		
		// 별점 구하기
		int avgRating = service.getReivewAVG(review);
		
		model.addAttribute("mentorInfo",dto);// 멘토 카드 정보
		model.addAttribute("key",kakaokey1);
		model.addAttribute("careerlist",careerlist);
		model.addAttribute("edulist",edulist);
		model.addAttribute("licenselist",licenselist);
		model.addAttribute("payment",payment);
		model.addAttribute("reviewlist",review);
		model.addAttribute("reviewcount",review.size());
		model.addAttribute("avg",avgRating);
		
		System.out.println(dto.getMentoring_location());
		
		return "findMentor/MentorProfileDetailPage";
	}
	
	@GetMapping("applyMentoringPage")
	public String applyMentoringPage(String mentoring_kind,
			int mentor_no,
			Model model,
			Authentication auth) {
	
		
		// 비용 선택 후 예약 요청하는 경우
		if(mentoring_kind!=null) {
			if(!mentoring_kind.equals(""))
			model.addAttribute("kind",mentoring_kind);
		}
		
		
		//멘티의 깃허브 , 블로그 주소를 가져와야함
		 int member_no = 0;
	    // 세션에 공유된 회원 넘버를 가져와서 멘티 정보 가져오기     
	     if(auth!=null) {
	     	member_no = Integer.parseInt(String.valueOf(((AuthUser)auth.getPrincipal()).getMember().getMember_no()));
	     	
	     	MenteeDTO mentee = service.getMenteePortfolio(member_no);
	     	model.addAttribute("mentee", mentee);
	     }
		
		// 멘토링 비용
		List<FindMentorInfoDTO> payment = service.getPayment(mentor_no);
		
		//오늘로 부터 일주일치 달력 list 
		List<String> dayList = service.getDayList();
		
		String schedule = service.getDayAndTime(mentor_no);
		System.out.println("schedule: "+schedule);		
		
		model.addAttribute("payment",payment);
		model.addAttribute("mentor_no",mentor_no);
		model.addAttribute("dayList",dayList);
		model.addAttribute("schedule",schedule);
		
		return "findMentor/applyMentoringPage";
	}
	
	
	// 선택한 날짜에 예약이 된 시간대를 가져온다. 
	@PostMapping("getReservedTime")
	@ResponseBody
	public List<String> getReservedTime(String reserve_date,int mentor_no){
		System.out.println("reserve_date : "+reserve_date);
		List<String> reservedTime = service.getReservedTime(reserve_date,mentor_no);
		
		return reservedTime;
	}
	
	
	//결제 버튼 클릭전 선택한 멘토링 종류에 대한 정보와 환불 규정을 띄운다. 
	@GetMapping("getPaymentInfo")
	public String getPaymentInfo(int mentor_no,
			String reserve_day,
			String reserve_time,
			String mentoring_kind,
			String git,
			String blog,
			int amount,
			Model model) {
		
		
		// git,blog 비공개 선택시 빈문자열이 넘어오니 if문 추가해주기
		
		
		// 멘토 회사, 직무 구해옴
		FindMentorDTO dto = service.getMentorInfo(mentor_no);
		model.addAttribute("mentor",dto);
		
		// 상담정보 전달
		model.addAttribute("reserve_kind",mentoring_kind);
		
		// 상담 시간 timestamp 타입으로 변형
		Timestamp reserve_date = service.getReserveDate(reserve_day,reserve_time);
		model.addAttribute("reserve_date",reserve_date);
		
		
		return "findMentor/etc/paymentInfo";
	}
	

	@PostMapping("insertMentoring_file")
	@ResponseBody
	public int insertMentoring_file(MentoringDTO dto,Model model) {
		List<FileDTO> files = fileUtils.uploadFiles(dto.getFiles()); 
		
		int fileMaxNo = service.getFileMaxNo();  
		fileService.saveFiles(fileMaxNo, files);
		
		return fileMaxNo;
	}
	
	
	
	// 멘토링 신청이 왔다는 문자 메세지 전송
		@RequestMapping("mentoringApplyMsg")
		public String mentoringApplyMsg(int mentor_no,
				int payment_no,
				RedirectAttributes rdattr) throws JsonProcessingException {

			// 예약 정보를 보낸다. 
			MentoringDTO mentoring = service.getMentoringInfo(payment_no);
			// 문자 메세지를 전송할 번호를 구한다. 
			String phone = service.getPhone(mentor_no);
			service.sendMentoringApply(mentoring,phone);
			
			UriComponentsBuilder builder = UriComponentsBuilder.fromUriString("redirect:/findMentor/paymentCompletePage")
		            .queryParam("order_no", mentoring.getOrder_no())
		            .queryParam("mentoring_kind", mentoring.getMentoring_kind())
		            .queryParam("reserve_date", mentoring.getReserve_date())
		            .queryParam("pay_time", mentoring.getPay_time());

		    // 리다이렉트
		    return builder.toUriString();
		}

	
	
	// 결제 완료 페이지로 이동
	@GetMapping("paymentCompletePage")
	public String paymentCompletePage(@ModelAttribute MentoringDTO mentoring,Model model) {
		
		model.addAttribute("mentoring",mentoring);
		System.out.println("findMentor 에서 paymentCompletePage 요청에서 꺼낸 mentoring 객체의 값 : ");
		System.out.println(mentoring);
		
		return "findMentor/paymentComplete";
	}
	
	
	
	
	
	

}
