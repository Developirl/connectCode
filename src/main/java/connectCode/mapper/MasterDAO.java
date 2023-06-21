package connectCode.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import connectCode.model.FileDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.PostDTO;
import connectCode.model.ReportDTO;
import connectCode.model.VisitDTO;


@Mapper
public interface MasterDAO {
	// 멘토 전체 데이터
	int getTotal1(MentorDTO mentor);

	// 멘티 전체 데이터
	int getTotal2(MenteeDTO mentee);

	// 멘토 승인요청 목록 
	List<MentorDTO> mentorlist(MentorDTO mentor);

	// 멘토 상세페이지 
	MentorDTO mentorDetail(int mentor_no);

	// 멘토 경력
	List<MentorDTO> mentorCareer(int mentor_no);

	// 멘토 학벌
	List<MentorDTO> mentorEducation(int mentor_no);

	// 멘토 자격증 
	List<MentorDTO> mentorLicense(int mentor_no);

	// 멘토 경력 파일
	List<MentorDTO> mentorCareerFile(int mentor_no);
	
	// 멘토 학벌 파일
	List<MentorDTO> mentorEducationFile(int mentor_no);

	// 멘토 자격증 파일
	List<MentorDTO> mentorLicenseFile(int mentor_no);

	// 멘토 서비스
	List<MentorDTO> mentorService(int mentor_no);

	// 멘티 리스트
	List<MenteeDTO> menteelist(MenteeDTO mentee);

	// 전체 회원 목록
	List<MentorDTO> totallist(MentorDTO mentor);

	// 멘토 승인거부 업데이트
	int mentorlApplyUpdate(MentorDTO mentor);
	
	// 멘토 승인거부 업데이트
	int mentorlRefuseUpdate(MentorDTO mentor);

	// 문의 전체 데이터
	int getPostTotal(PostDTO post);

	// 문의 전체 목록
	List<PostDTO> postlist(PostDTO post);

	// 문의 상세
	PostDTO postDetail(int post_no);

	PostDTO postReply(int post_no);

	PostDTO dbpost(int post_no);

	int insertBoard(PostDTO dbpost);

	int UpdateBoard(PostDTO dbpost);

//	List<MentorDTO> memberDetail(int member_no);

	// 회원 메일 구해오기
	MentorDTO getEmailbyMember(String memberNum);

	// 신고 총 데이터
//	int getReport(ReportDTO report);

	// 신고 목록_미처리
//	List<ReportDTO> reportUncomplete(ReportDTO report);

	// 신고 목록_처리
//	List<ReportDTO> reportComplete(ReportDTO report);

	// 파일 다운로드
	Map<String, Object> selectFile(Map<String, Object> map);

	// 멘토 신고수
	int mentorReport(int mentor_no);

	// 멘티 멘토링
	List<MenteeDTO> menteeMentoring(MenteeDTO mentee);

	// 멘티 정보구해오기
	MenteeDTO menteeDelete(int member_no);

	// 멘티 탈퇴
	int mmDelete(int member_no);

	// 멘토 탈퇴 업데이트
	int mmDelUpdate(int member_no);

	// 멘토 리뷰수
	int mentorReview(int mentor_no);

	// 멘토링 평균
	double mentorAVG(int mentor_no);

	// 신고 총 데이터
	int getReport(ReportDTO report);

	// 신고 목록
	List<ReportDTO> reportList(ReportDTO report);

	// 신고 상세 내역
	ReportDTO reportDetail(int report_no);

	// 파일 
	FileDTO file(int mentor_no);
	
	
	
	
	
//*****************************병걸 작성***************************************

	public int insertVisitorInfo(VisitDTO visitor);
	
	public int updateExitTime(int visit_id);
	
	public int getTotalVisitors();
	public int getTodayVisitors();
	public int getMentors();
	public int getMentees();
	public int getUnreadyMentors();
	public int getReadyMentors();







//*****************************병걸 작성***************************************
	

	
}
