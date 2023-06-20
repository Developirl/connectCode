package connectCode.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connectCode.model.AuthUser;
import connectCode.model.FindMentorBeanFactory;
import connectCode.model.FindMentorDTO;
import connectCode.model.FindMentorInfoDTO;
import connectCode.service.FindMentorService;

@Controller
@RequestMapping("/findMentor/*")
public class FindMentor {
//	지수
	
	@Autowired
	private FindMentorService service;
	
	private String kakaokey1 = "0388851e9cdac5dc3e27e52b9b48f259";

	@GetMapping("mentorlistpage")
	public String mentorlistpage(@RequestParam(value="page",defaultValue = "1") String page, 
			Model model,
			HttpSession session,
			FindMentorDTO dto,
			Authentication auth) {
		System.out.println(dto.getTechnology());
		System.out.println(dto.getMentoring_location());
		System.out.println(dto.getGender());
		System.out.println(dto.getYears());
		
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
        
        // 이전에 검색을 했다면 해당 검색내역을 띄울 수 있도록 필터 데이터를 dto채로 넘겨준다.
        model.addAttribute("filterdto",dto);

        // 검색 필터에 필요한 리스트 dto에서 꺼내서 view단으로 넘겨줌
		model.addAttribute("techStacks",fac.techStacks());
		model.addAttribute("regionList",fac.region());
		
		
		return "findMentor/mentorListPage";
	}
	
	
	
	
	
	// 멘토 정보 상세페이지로 이동. 
	@GetMapping("MentorProfileDetailPage") 
	public String applyMentoringPage(int mentor_no,
			@RequestParam(value = "bookmark",defaultValue = "0") int bookmark ,
			Model model,
			Authentication auth) {
		
		// 필요한 데이터1. 경력사항(career)/학력사항(education)/수상내역(license)/지역/비용(service)/후기(review)
		
		// 멘토 카드 
		FindMentorDTO dto = service.getMentorProfile(mentor_no);
		dto.setCheckedBookmark(bookmark); // 여기 에러 났었는데? NullPointer
		
		
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
			Model model) {
	
		if(mentoring_kind!=null) {
			if(!mentoring_kind.equals(""))
			model.addAttribute("kind",mentoring_kind);
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
		List<String> reservedTime = service.getReservedTime(reserve_date,mentor_no);
		
		return reservedTime;
	}
	
	
	//결제 버튼 클릭전 선택한 멘토링 종류에 대한 정보와 환불 규정을 띄운다. 
	@GetMapping("getPaymentInfo")
	public String getPaymentInfo(int mentor_no,
			String reserve_day,
			String reserve_time,
			String mentoring_kind,
			Model model) {
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
