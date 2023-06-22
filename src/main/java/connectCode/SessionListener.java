package connectCode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import connectCode.model.VisitDTO;
import connectCode.service.MasterService;
import lombok.Setter;

@Component
public class SessionListener implements HttpSessionListener {
    
	@Setter(onMethod_ = @Autowired)
	private MasterService masterService;
	
    @Value("${server.servlet.session.timeout}")
    private int sessionTime;
    
    public void sessionCreated(HttpSessionEvent se) {
    	
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        HttpSession session = se.getSession();
        
        session.setMaxInactiveInterval(sessionTime);
        
        VisitDTO visitor = new VisitDTO();
        
        visitor.setVisit_ip(request.getRemoteAddr());
        visitor.setVisit_agent(request.getHeader("User-Agent"));
        visitor.setVisit_refer(request.getHeader("referer"));
        
        masterService.insertVisitorInfo(visitor);
        session.setAttribute("visit_id", visitor.getVisit_id());
        
        System.out.println("세션 생성");
    }
 
    public void sessionDestroyed(HttpSessionEvent se) {
    	masterService.updateExitTime(Integer.valueOf(String.valueOf(se.getSession().getAttribute("visit_id"))));
    	System.out.println("세션 삭제");
    }
}