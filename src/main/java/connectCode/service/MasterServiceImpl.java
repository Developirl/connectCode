package connectCode.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.catalina.webresources.FileResource;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import connectCode.mapper.MasterDAO;
import connectCode.model.FileDTO;
import connectCode.model.MailDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.PaymentDTO;
import connectCode.model.PostDTO;
import connectCode.model.ReportDTO;
import connectCode.model.VisitDTO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MasterServiceImpl implements MasterService {
	@Autowired
	MasterDAO md;

	@Value("${phone_hj_1}")
	private String phonekey1;

	@Value("${phone_hj_2}")
	private String phonekey2;

	@Value("${hjphone}")
	private String myphone;

	@Autowired
	private JavaMailSender emailSender;
//    private static final String FROM_ADDRESS = "이메일에 보낼 주소";

	// 멘토 전체 데이터
	@Override
	public int getTotal1(MentorDTO mentor) {
		return md.getTotal1(mentor);
	}

	// 멘티 전체 데이터
	@Override
	public int getTotal2(MenteeDTO mentee) {
		return md.getTotal2(mentee);
	}

	// 멘토 리스트
	@Override
	public List<MentorDTO> mentorlist(MentorDTO mentor) {
		return md.mentorlist(mentor);
	}

	// 멘토 상세 정보
	@Override
	public MentorDTO mentorDetail(int mentor_no) {

		return md.mentorDetail(mentor_no);
	}

	// 멘토 경력
	@Override
	public List<MentorDTO> mentorCareer(int mentor_no) {
		return md.mentorCareer(mentor_no);
	}

	// 멘토 학벌
	@Override
	public List<MentorDTO> mentorEducation(int mentor_no) {
		return md.mentorEducation(mentor_no);
	}

	// 멘토 자격증
	@Override
	public List<MentorDTO> mentorLicense(int mentor_no) {
		return md.mentorLicense(mentor_no);
	}

	// 멘토 서비스
	@Override
	public List<MentorDTO> mentorService(int mentor_no) {
		return md.mentorService(mentor_no);
	}

	// 멘토 경력 파일
	@Override
	public List<MentorDTO> mentorCareerFile(int mentor_no) {
		return md.mentorCareerFile(mentor_no);
	}

	// 멘토 학벌 파일
	@Override
	public List<MentorDTO> mentorEducationFile(int mentor_no) {
		return md.mentorEducationFile(mentor_no);
	}

	// 멘토 자격증 파일
	@Override
	public List<MentorDTO> mentorLicenseFile(int mentor_no) {
		return md.mentorLicenseFile(mentor_no);
	}

	// 멘토 승인 요청_승인
	@Override
	public void mentorDetailApply(String phone) {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[ConnectCode] 멘토요청이 승인되었습니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// 멘토 승인요청_미승인
	@Override
	public void mentorDetailRefuse(String phone) {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[ConnectCode] 멘토요청이 거부되었습니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// 멘토 승인완료 업데이트
	@Override
	public int mentorlApplyUpdate(MentorDTO mentor) {

		return md.mentorlApplyUpdate(mentor);
	}

	// 멘토 승인거부 업데이트
	@Override
	public int mentorlRefuseUpdate(MentorDTO mentor) {

		return md.mentorlRefuseUpdate(mentor);
	}

	// 멘토 승인 알람 보내기
	@Override
	public int mentorApplyAlarm(MentorDTO mentor) {
		return md.mentorApplyAlarm(mentor);
	}
	
	// 승인 거부 알림
	@Override
	public int mentorApplyRefuse(MentorDTO mentor) {
		return md.mentorApplyRefuse(mentor);
	}

	// 멘티 리스트
	@Override
	public List<MenteeDTO> menteelist(MenteeDTO mentee) {

		return md.menteelist(mentee);
	}

	// 전체 회원 목록
	@Override
	public List<MentorDTO> totallist(MentorDTO mentor) {

		return md.totallist(mentor);
	}

	// 문의 전체 데이터
	@Override
	public int getPostTotal(PostDTO post) {

		return md.getPostTotal(post);
	}

	// 문의 목록
	@Override
	public List<PostDTO> postlist(PostDTO post) {

		return md.postlist(post);
	}

	// 문의 상세
	@Override
	public PostDTO postDetail(int post_no) {

		return md.postDetail(post_no);
	}

	@Override
	public PostDTO postReply(int post_no) {

		return md.postReply(post_no);
	}

	@Override
	public PostDTO dbpost(int post_no) {

		return md.dbpost(post_no);
	}

	@Override
	public int insertBoard(PostDTO dbpost) {
//		System.out.println(dbpost);
		return md.insertBoard(dbpost);
	}

	@Override
	public int UpdateBoard(PostDTO dbpost) {

		return md.UpdateBoard(dbpost);
	}

//	@Override
//	public List<MentorDTO> memberDetail(int member_no) {
//		
//		return md.memberDetail(member_no);
//	}

	// 회원 메일 구해오기
	@Override
	public MentorDTO getEmailbyMember(String memberNum) {

		return md.getEmailbyMember(memberNum);
	}

	// 신고 총 데이터
//	@Override
//	public int getReport(ReportDTO report) {
//
//		return md.getReport(report);
//	}
//
//	// 신고 목록_미처리
//	@Override
//	public List<ReportDTO> reportUncomplete(ReportDTO report) {
//
//		return md.reportUncomplete(report);
//	}
//
//	// 신고 목록_처리
//	@Override
//	public List<ReportDTO> reportComplete(ReportDTO report) {
//		
//		return md.reportComplete(report);
//	}

	// 메일 전송
	@Override
	public void mailSend(MailDTO mail) throws UnsupportedEncodingException, MessagingException {
//		SimpleMailMessage message = new SimpleMailMessage();
		MimeMessage message = emailSender.createMimeMessage();
		message.addRecipients(javax.mail.Message.RecipientType.TO, mail.getEmailAddress());
		message.setFrom(new InternetAddress("gpwl9929@naver.com", "ConnectCode"));
//		message.setTo(mail.getEmailAddress());
		message.setSubject(mail.getTitle());
		message.setText(mail.getContent(), "utf-8", "html");
		System.out.println(message);
		emailSender.send(message);
	}

	// 파일 다운로드
	@Override
	public Map<String, Object> selectFile(Map<String, Object> map) {

		return md.selectFile(map);
	}

	// 멘토 신고
	@Override
	public int mentorReport(int mentor_no) {

		return md.mentorReport(mentor_no);
	}

	// 멘티 멘토링
	@Override
	public List<MenteeDTO> menteeMentoring(MenteeDTO mentee) {

		return md.menteeMentoring(mentee);
	}

	// 멘티 정보 구해오기
	@Override
	public MenteeDTO menteeDelete(int member_no) {

		return md.menteeDelete(member_no);
	}

	// 멘티 탈퇴
	@Override
	public int mmDelete(int member_no) {

		return md.mmDelete(member_no);
	}

	// 멘토 탈퇴 정보 업데이트
	@Override
	public int mmDelUpdate(int member_no) {

		return md.mmDelUpdate(member_no);
	}

	// 멘토링 후기수
	@Override
	public int mentorReview(int mentor_no) {

		return md.mentorReview(mentor_no);
	}

	// 멘토링 평균
	@Override
	public double mentorAVG(int mentor_no) {

		return md.mentorAVG(mentor_no);
	}

	// 신고 총 데이터
	@Override
	public int getReport(ReportDTO report) {

		return md.getReport(report);
	}

	// 신고 목록
	@Override
	public List<ReportDTO> reportList(ReportDTO report) {

		return md.reportList(report);
	}

	// 신고 상세 내역
	@Override
	public ReportDTO reportDetail(int report_no) {

		return md.reportDetail(report_no);
	}

	// 파일
	@Override
	public FileDTO file(FileDTO fileDTO) {

		return md.file(fileDTO);
	}

	// 학벌 파일
	@Override
	public List<MentorDTO> efile(int file_no) {

		return md.efile(file_no);
	}

	// 결제 리스트
	@Override
	public int getPay(PaymentDTO pay) {

		return md.getPay(pay);
	}

	// 결제 리스트
	@Override
	public List<PaymentDTO> paylist(PaymentDTO pay) {

		return md.paylist(pay);
	}

	// 신고 철회
	@Override
	public int reportCancle(int report_no) {

		return md.reportCancle(report_no);
	}

	// 새로운 문의 요청
	@Override
	public int newinquire() {

		return md.newinquire();
	}

	// 새로운 신고
	@Override
	public int newReport() {

		return md.newReport();
	}

	// 새로운 멘토 요청
	@Override
	public int newMentor() {

		return md.newMentor();
	}

	// 오늘 발생한 신고
	@Override
	public int newPay() {

		return md.newPay();
	}

	// 통계
	// 멘토 성비
	@Override
	public int getMale() {
		return md.getMale();
	}

	@Override
	public int getFemale() {
		return md.getFemale();
	}

	// 멘티 성비
	@Override
	public int geteemale() {
		return md.geteemale();
	}

	@Override
	public int geteefemale() {
		return md.geteefemale();
	}

	// 전체 성비
	@Override
	public int getTmale() {
		return md.getTmale();
	}

	@Override
	public int getTfemale() {
		return md.getTfemale();
	}

	// 이용자 현황
	@Override
	public int getsign_up() {
		return md.getsign_up();
	}

	@Override
	public int getlastsign_up() {
		return md.getlastsign_up();
	}

	@Override
	public int getTsign_up() {
		return md.getTsign_up();
	}

	@Override
	public int getquit() {
		return md.getquit();
	}

	@Override
	public int getlastquit() {
		return md.getlastquit();
	}

	@Override
	public int getTquit() {
		return md.getTquit();
	}

//*****************************병걸 작성***************************************

	@Override
	public void insertVisitorInfo(VisitDTO visitor) {

		md.insertVisitorInfo(visitor);
	}

	@Override
	public void updateExitTime(int visit_id) {
		md.updateExitTime(visit_id);
	}

	@Override
	public int getTotalVisitors() {
		return md.getTotalVisitors();
	}

	@Override
	public int getTodayVisitors() {
		return md.getTodayVisitors();
	}

	@Override
	public int getMentors() {
		return md.getMentors();
	}

	@Override
	public int getMentees() {
		return md.getMentees();
	}

	@Override
	public int getUnreadyMentors() {
		return md.getUnreadyMentors();
	}

	@Override
	public int getReadyMentors() {
		return md.getReadyMentors();
	}



//*****************************병걸 작성***************************************

}
