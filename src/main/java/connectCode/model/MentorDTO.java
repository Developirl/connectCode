package connectCode.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MentorDTO {
   private int mentor_no;
   private String name;
   private String phone;
   private String gender;
   private Date birthday;  
   private String email;
   private String intro;
   private String account;
   private String bank;
   private String account_name;
   private int profile_img_no;
   private String technology;
   private String mentoring_location;
   private String unable_date;
   private String mentoring_time;
   private int classification;
   private Date apply_date;
   private int member_no;
   
   // 알람
   private int alarm_no;
   private String title;
   private String content;
   private Timestamp happen_time;
   private String read_yn;
   private int receiver_mem_no;
   private int row_num;
   
   // 서비스 요금
   private int service_no;
   private String mentoring_kind;
   private int mentoring_fee;
   private String available_NY;
   
   // 학력사항
   private int education_no;
   private String school;
   private String entering_date;
   private String graduation_date;
   private String major;
   private String minor;
   private String degree;
   private int file_no;
   
   // 경력사항
   private int career_no;
   private String company;
   private String departure_date;
   private String task;
   private int years;
   
   // 자격증 및 수상내역
   private int license_no;
   private String kind;
   private String license_name;
   private String issuing_authority;
   private String issuing_date;
   
   // 페이징
   private int startRow;
   private int endRow;

   // 검색
   private String search;
   private String keyword;
   
   // 조인
   private int number;
   private int mentoring_no;
   private String age;
   private String mentor_name;
   private String mentee_name;
   private String mentee_no;
   private String request_content;
   private String location;
   private String comment;
   private String cancel_reason;
   private String git_YN;
   private String blog_YN;
   private Timestamp apply_time;
   private Timestamp reserve_date;
   
	
   private String id;
   private Date reg_date;
   private String desired_job;        
   private String technology_stack;
   private String git;              
   private String blog;
   
   private Date e_date;
   private Date g_date;
   private Date d_date;
   private Date i_date;
   
   // 첨부파일 List
   private List<MultipartFile> files = new ArrayList<>();
   
   // 파일 join용
   private int file_serial_number;
   private String file_url;
   private String origin_name;
   private String physical_name;

   private long size;

   private String extension;
   
   // 알람수
   private int alarm_count;
   
   // ******** 혜지 추가추가 *********
   private String password;
   private String newpasswd;
   private String quit_reason;
   
}