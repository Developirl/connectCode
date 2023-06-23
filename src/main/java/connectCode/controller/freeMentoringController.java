package connectCode.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import connectCode.model.freeMentoringBoardDTO;
import connectCode.service.FindMentorPageMaker;
import connectCode.service.freeMentoringService;

@Controller
@RequestMapping("/freeMentoring/*")
public class freeMentoringController{
	
	@Autowired
	private freeMentoringService service; // 서비스 인터페이스 연결
	
    @GetMapping("/freeMentoringList.do")
    public String freeMentoringList(@RequestParam(name = "page", defaultValue = "1") int page,
            Model model) {
       
    	List<freeMentoringBoardDTO> list = service.getList();
            // 페이징 처리에 필요한 값 설정
            int limit = 10; // 페이지당 보여줄 레코드 수
            int total = 100; // 총 레코드 수 (예시를 위해 임의로 설정)
            int block = 10; // 페이저 처리를 위한 보여줄 버튼 개수

            // FindMentorPageMaker 객체 생성 및 초기화
            FindMentorPageMaker pageMaker = new FindMentorPageMaker(limit, page, total, block);

            // 페이징 처리된 데이터를 조회하기 위한 startRow, endRow 값 설정
            int startRow = (page - 1) * limit + 1;
            int endRow = startRow + limit - 1;

            // 데이터 조회 및 결과를 모델에 추가
            // 예시를 위해 mentors 변수에 조회된 데이터를 담았다고 가정
            // 데이터 조회 및 결과를 mentors 변수에 할당하는 로직은 실제 상황에 맞게 구현되어야 합니다.
            // 이 예시에서는 mentors 변수에 더미 데이터를 할당하였습니다.
            String[] mentors = new String[total];
            for (int i = 0; i < total; i++) {
                mentors[i] = "Mentor " + (i + 1);
            }
            model.addAttribute("list", list);
            model.addAttribute("mentors", mentors);
            model.addAttribute("pageMaker", pageMaker);
            model.addAttribute("startRow", startRow);
            model.addAttribute("endRow", endRow);

        
        return "/freeMentoring/freeMentoringList";
    
	}
    
    
    @GetMapping("/freeMentoringCreate.do")
    public String freeMentoringCreate() {
    	
    	return "/freeMentoring/freeMentoringCreate";
    }
}
