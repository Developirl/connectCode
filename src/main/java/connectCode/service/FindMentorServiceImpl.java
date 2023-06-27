package connectCode.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import connectCode.mapper.FindMentorDAO;
import connectCode.model.FindMentorDTO;
import connectCode.model.FindMentorInfoDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentoringDTO;
import edu.emory.mathcs.backport.java.util.Arrays;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class FindMentorServiceImpl implements FindMentorService {

	@Autowired
	private FindMentorDAO dao;
	
	
	@Value("${phone_hj_1}")
	private String phonekey1;

	@Value("${phone_hj_2}")
	private String phonekey2;
	
	@Value("${hjphone}")
	private String myphone;
	

	@Override
	public int getTotal(FindMentorDTO dto) {
		return dao.getTotal(dto);
	}

	@Override
	public List<FindMentorDTO> getMentorList(FindMentorDTO dto) {
		return dao.getMentorList(dto);
	}

	
	// 페이징 처리시 필요한 reviewcount , 멘토링 종류 및 요금 등을 설정한다. 
	@Override
	public List<FindMentorDTO> setRemaining(List<FindMentorDTO> list, String member_no_) {
		List<FindMentorDTO> li = list;
		
		// for문을 돌면서 하나씩 값을 셋팅해준다. 
		for(int i=0;i<li.size();i++) {
			int mentor_no = li.get(i).getMentor_no();
			
			int reviewcount = dao.getReviewcount(mentor_no);
			list.get(i).setReviewcount(reviewcount);
			
			List<String> men_payment = dao.getMentoringPayment(mentor_no);
			String[] str = new String[2];
			String payment = "";
			
			for(int j=0; j<2;j++) {
				payment = men_payment.get(j);
				str[j] = payment;
				System.out.println("str["+j+"] ="+str[j]);
			}
			
			list.get(i).setMentoring_payment(str);   
			System.out.println("str ="+Arrays.toString(str));
			
			if(member_no_ != null && !member_no_.equals("") ) {
				int member_no = Integer.parseInt(member_no_);
				list.get(i).setCheckedBookmark(dao.getCheckedBookmark(member_no,mentor_no));
			}

		}
		
		return list;
	}
	
	
	@Override
	public FindMentorDTO getMentorProfile(int mentor_no) {
		return dao.getMentorProfile(mentor_no);
	}
	
	
	
	@Override
	public List<FindMentorInfoDTO> getCareerList(int mentor_no) {
		return dao.getCareerList(mentor_no);
	}
	
	
	
	@Override
	public List<FindMentorInfoDTO> getEducationList(int mentor_no) {
		return dao.getEducationList(mentor_no);
	}
	
	@Override
	public List<FindMentorInfoDTO> getLicenseList(int mentor_no) {
		return dao.getLicenseList(mentor_no);
	}
	
	@Override
	public List<FindMentorInfoDTO> getPayment(int mentor_no) {
		return dao.getPayment(mentor_no);
	}
	
	@Override
	public List<FindMentorInfoDTO> getReviewList(int mentor_no) {
		return dao.getReviewList(mentor_no);
	}
	
	// 별점 구하기
	@Override
	public int getReivewAVG(List<FindMentorInfoDTO> review) {
		List<FindMentorInfoDTO> list = review;
		
		double tmp = 0;
		for(int i=0;i<list.size();i++) {
			tmp += list.get(i).getRating();
		}
		tmp /= list.size();
		
		
		return (int)Math.round(tmp);
	}
	
	
	// 오늘 날짜로부터 7일치 날짜 배열 구해오기
	@Override
	public List<String> getDayList() {
		
		LocalDate today = LocalDate.now();
        List<String> dayList = new ArrayList<String>();

        for (int i = 0; i < 7; i++) {
            LocalDate date = today.plusDays(i);
            String formattedDate = date.format(DateTimeFormatter.ofPattern("MM/dd"));
            String dayOfWeek = date.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREAN);

            dayList.add(dayOfWeek + ';' + formattedDate);
            System.out.println(dayList.get(i));
        }
				
		return dayList;
	}
	
	@Override
	public String getDayAndTime(int mentor_no) {
		
		String dayday = dao.getDayAndTime(mentor_no);
		
		String[] day = dayday.split(";");
		
		ObjectMapper objectMapper = new ObjectMapper();
		String schedule = null;
		
		try {
			schedule = objectMapper.writeValueAsString(day);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		
		return schedule;
	}
	
	
	
	@Override
	public List<String> getReservedTime(String reserve_date,int mentor_no) {
		return dao.getReservedTime(reserve_date,mentor_no);
	}
	
	
	@Override
	public FindMentorDTO getMentorInfo(int mentor_no) {
		return dao.getMentorInfo(mentor_no);
	}
	
	
	@Override
	public Timestamp getReserveDate(String reserve_day, String reserve_time) {
		
		
		String day = (reserve_day.substring(6)+"-"+reserve_day.substring(0,5)).replace("/", "-");
		
		String dateString = day+" "+reserve_time+":00";
		System.out.println("예약 시간 timestamp로 변경 " +dateString);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(dateString, formatter);
		Timestamp time = Timestamp.valueOf(dateTime);

		return time;
	}
	
	
	@Override
	public int deleteBookmark(int member_no, int mentor_no) {
		return dao.deleteBookmark(member_no,mentor_no);
	}
	
	
	@Override
	public int insertBookmark(int member_no, int mentor_no) {
		return dao.insertBookmark(member_no,mentor_no);
	}
	
	
	@Override
	public MenteeDTO getMenteePortfolio(int member_no) {
		return dao.getMenteePortfolio(member_no);
	}
	
	
	
	@Override
	public int getCheckedBookmark(int member_no, int mentor_no) {
		return dao.getCheckedBookmark(member_no,mentor_no);
	}
	
	@Override
	public int getFileMaxNo() {
		return dao.getFileMaxNo();
	}
	
	
	@Override
	public MentoringDTO getMentoringInfo(int payment_no) {
		return dao.getMentoringInfo(payment_no);
	}
	
	
	@Override
	public String getPhone(int mentor_no) {
		return dao.getPhone(mentor_no);
	}
	
	//멘토링 결제가 완료되면 멘토에게 멘토링 신청이 왔다는 메세지를 전송한다. 
	@Override
	public void sendMentoringApply(MentoringDTO mentoring, String phone) {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String reservedate = format.format(mentoring.getReserve_date());
		
		String msg = "[ConnectCode] 멘토링 신청이 들어왔습니다. ";
		String msg2 = "[ConnectCode] \n예약일자 : "+reservedate+"\n멘토링 요청을 수락하셔야 예약이 확정됩니다. ";
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01065054737"); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", msg); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		HashMap<String, String> params2 = new HashMap<String, String>();
		params2.put("to", "01065054737"); // 수신전화번호
		params2.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params2.put("type", "SMS");
		params2.put("text", msg2); // 문자 내용 입력
		params2.put("app_version", "test app 1.2"); // application name and version
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params2);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	
	
	@Override
	public void sendMentoringApplyalarm(MentoringDTO mentoringDTO) {
			dao.sendMentoringApplyalarm(mentoringDTO);
	}

}
