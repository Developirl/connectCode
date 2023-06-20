package connectCode.service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import connectCode.mapper.FindMentorDAO;
import connectCode.model.FindMentorDTO;
import connectCode.model.FindMentorInfoDTO;

@Service
public class FindMentorServiceImpl implements FindMentorService {

	@Autowired
	private FindMentorDAO dao;

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
	public List<FindMentorDTO> setRemaining(List<FindMentorDTO> list, String string) {
		List<FindMentorDTO> li = list;
		
		// for문을 돌면서 하나씩 값을 셋팅해준다. 
		for(int i=0;i<li.size();i++) {
			int mentor_no = list.get(i).getMentor_no();
			
			int reviewcount = dao.getReviewcount(mentor_no);
			list.get(i).setReviewcount(reviewcount);
			
			List<String> men_payment = dao.getMentoringPayment(mentor_no);
			System.out.println("mem_payment: "+men_payment);
			String[] str = new String[2]; 
			for(int j=0; j<men_payment.size();j++) {
				str[j] = men_payment.get(j);
			}
			list.get(i).setMentoring_payment(str);
			
			if(string != null && !string.equals("") ) {
				int member_no = Integer.parseInt(string);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
