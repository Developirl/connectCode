package connectCode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.auth.AUTH;
import org.omg.CORBA.FREE_MEM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import connectCode.model.AuthUser;
import connectCode.model.MemberDTO;
import connectCode.model.MenteeDTO;
import connectCode.model.MentorDTO;
import connectCode.model.freeMentoringBoardDTO;
import connectCode.model.freeMentoringReplyDTO;
import connectCode.service.FindMentorPageMaker;
import connectCode.service.freeMentoringService;

@Controller
@RequestMapping("/freeMentoring/*")
public class freeMentoringController{
	
	@Autowired
	private freeMentoringService service; // 서비스 인터페이스 연결
	
    @GetMapping("/freeMentoringList.do")
    public String freeMentoringList(String page, Model model, freeMentoringBoardDTO free, HttpSession session, Authentication auth) {    	
    		if(page == null) {
    			page ="1";
    		}
    	
            // 페이징 처리에 필요한 값 설정
            final int limit = 10; // 페이지당 보여줄 레코드 수
            final int block = 5; // 페이저 처리를 위한 보여줄 버튼 개수
            
            int currentPage = Integer.parseInt(page);
            
            int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();

            
//            int member_no = (int) session.getAttribute("member_no");
//            
//            MenteeDTO mentee = service.getMentee(member_no);

            System.out.println("서치: "+free.getSearch());
            
            int total = service.getFreeBoardCount(free);
            
            System.out.println("토탈 : " + total);
            
            // FindMentorPageMaker 객체 생성 및 초기화
            FindMentorPageMaker pageMaker = new FindMentorPageMaker(limit, currentPage, total, block);

            
            // 페이징 처리된 데이터를 조회하기 위한 startRow, endRow 값 설정
            int startRow = pageMaker.getNumber();
            int endRow = startRow - 9;
            
            if(endRow < 1) {
            	endRow = 1;
            }
            
            int limitdata = total - startRow;
            int limitdata2 = startRow - endRow +1;
            
            
            System.out.println("토탈 - 스타트로우 : "+limitdata);	//1
            System.out.println("스타트 로우 - 엔드로우 +1 : "+ limitdata2); //2

            List<freeMentoringBoardDTO> list = service.getList(free, limitdata, limitdata2);


            model.addAttribute("list", list);
            model.addAttribute("pageMaker", pageMaker);
            model.addAttribute("startRow", startRow);
            model.addAttribute("freeboard", free);
            model.addAttribute("mentee_no", mentee_no);

        
        return "/freeMentoring/freeMentoringList";
    
	}
    
    @GetMapping("/freeMentoringDetail.do")
    public String freeMentorinDetail(String page, int free_no, Model model, HttpSession session, 
    		String search, String keyword, Authentication auth) {
    	
    	if(page == null) {
    		page = "1";
    	}
    	
       freeMentoringBoardDTO dto = service.freeRead(free_no);
       
       service.updatefreeReadCount(free_no);
              
       int mentor_no = ((AuthUser)(auth.getPrincipal())).getMentor_no();
       

       MentorDTO mentor = service.getMentor(mentor_no);

       
       int mentee_no = ((AuthUser)(auth.getPrincipal())).getMentee_no();
       
       System.out.println("멤버노 디테일: " + mentor_no);
       
       
       int total = service.getFreeReplyCount(free_no);
       
       List<freeMentoringReplyDTO> freeReplyList = service.getFreeReplyList(free_no);
       
       model.addAttribute("freereplylist", freeReplyList);
       model.addAttribute("total", total);
       model.addAttribute("freeboard",dto);
       model.addAttribute("page", page);
       model.addAttribute("search", search);
       model.addAttribute("keyword", keyword);
       model.addAttribute("mentee_no", mentee_no);
       model.addAttribute("mentor", mentor);
       return "/freeMentoring/freeMentoringDetail";
    }
    
//  답글 insert + 답글수 +1
    @GetMapping("insertreply")
    @ResponseBody
    public int replyInsert(freeMentoringReplyDTO freereply) {
    	
    	int result = service.InsertFreeReply(freereply);
    	
    	service.updateFreeCommentCount(freereply.getFree_no());
    	
    	
    	return result;
    	
    }
//  답글 insert + 답글수 -1
    @GetMapping("deletereply")
    @ResponseBody
    public int replyDelete(int free_no, int free_reply_no) {
    	
    	int result = service.DeleteFreeReply(free_reply_no);
    	
    	service.updateMinusFreeCommentCount(free_no);
    	
    	return result;
    }
    
    // 답글 update
    @GetMapping("updatereply")
    @ResponseBody
    public int replyUpdate(int free_reply_no, String free_reply_content) {
    	
    	int result = service.UpdateFreeReply(free_reply_no, free_reply_content);
    	
    	return result;
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////
    
//  작성 폼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 멘티만 달 수 있게!!!!!!!!!!!!!!
	@GetMapping("/freeMentoringCreate.do")
	public String freeMentoringCreateForm(HttpSession session, Model model, Authentication auth) {

		
		MemberDTO member = ((AuthUser)(auth.getPrincipal())).getMember();

		MenteeDTO mentee = service.getMentee(member.getMember_no());

		System.out.println("멘티 노 " + mentee.getMentee_no());

		model.addAttribute("mentee", mentee);

		return "/freeMentoring/freeMentoringCreate";
	}
//  작성 폼 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	
	
//  작성 등록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    
	@PostMapping("/freeMentoringCreate.do")
	public String freeMentoringCreate(freeMentoringBoardDTO free, RedirectAttributes rttr) {


		int result = service.freeInsert(free);

		if (result == 1) {
			rttr.addFlashAttribute("result", "createfree");
		}

		return "redirect:/freeMentoring/freeMentoringList.do";
	}
//  작성 등록 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     	
	
	
	//업데이트 폼
	
		@GetMapping("freeMentoringUpdateForm.do")
		public String freeUpdateForm(int free_no, String page, Model model) {
			
			if(page == null) {
				page = "1";
			}
			freeMentoringBoardDTO dto = service.freeRead(free_no);
			System.out.println("프리노 업데이트 폼 :"+dto.getFree_no());
			model.addAttribute("DTO",dto );
			
			model.addAttribute("page", page);			
			return "/freeMentoring/freeMentoringUpdateForm";
		}
			
		
		// 업데이트 수행
		
		@PostMapping("freeMentoringUpdate.do")
		public String freeUpdate(freeMentoringBoardDTO free, RedirectAttributes rttr) {
			
			System.out.println("프리노 업데이트 중:" + free.getFree_no());			
		
			int result = service.freeUpdate(free);
			
			if(result == 1) {
				rttr.addFlashAttribute("result", "updatefree");
			}
			
			return "redirect:/freeMentoring/freeMentoringDetail.do?free_no="+free.getFree_no();
		}
		
		
		@GetMapping("freeMentoringdelete.do")
		public String freeDelete(int free_no, RedirectAttributes rttr) {
			
			int result = service.deleteFree(free_no);
			
			if(result == 1) {
				rttr.addFlashAttribute("result", "deletefree");
			}
			
			return "redirect:/freeMentoring/freeMentoringList.do";
		}
		
		
		
}
