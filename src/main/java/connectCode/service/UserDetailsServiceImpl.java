package connectCode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import connectCode.mapper.MemberMapper;
import connectCode.model.AuthUser;
import connectCode.model.MemberDTO;
import lombok.Setter;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		MemberDTO member = mapper.getAuth(id);
		int mentor_no = mapper.getMentor_no(member.getMember_no());
		int mentee_no = mapper.getMentee_no(member.getMember_no());
		
		return member == null? null:new AuthUser(member, mentor_no, mentee_no);
	}

}
